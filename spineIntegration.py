# Author Michele Mattioni
# Wed Mar 18 17:51:51 GMT 2009

import logging
import numpy as np
import math

import sys
import os

from neuron import h

import matplotlib
from ecellControl.ecellManager import EcellManager
backend = 'Agg'
matplotlib.use(backend)
import matplotlib.pyplot as plt

from neuronControl import nrnSim, synapse 
from neuronControl.stimul import Stimul 

from neuronvisio.manager import Manager
from sumatra.external.NeuroTools import parameters

import tables 
from extref import ExtRef 

    
def build_vecs_to_plot(var, secs, anyRefs):
    """Create the dictionary of section->vectors to plot"""
    vecs_to_plot = {}
    for secName in secs:
        for ref in anyRefs:
            if secName == ref.sec_name:
                if ref.vecs.has_key(var):
                    vecs_to_plot[secName] = ref.vecs[var]
    return vecs_to_plot

def kir_gkbar(gkbar):
    for sec in h.allsec():
        for seg in sec:
            for mech in seg:
                if mech.name() == 'kir':
                    mech.gkbar = gkbar


def iClamptest(delay=10, duration=250, amplititude=0.248):
    """# Quick Iclamp test to check the current dynamics"""
    iclamp = h.IClamp(h.MSP_Cell[0].soma(0.5))
    iclamp.delay = delay
    iclamp.dur = duration
    iclamp.amp = amplititude

def advance_neuron(tmp_tstop):
    """
    Advance Neuron till tmp_tstop.
       
    Parameters
    ----------
    tmp_stop: Temporary tstop. It has to be expressed in milliseconds.
    """
    nrnSim.run(tmp_tstop)
    
def advance_ecell(spine, delta_t):
    """
    Advance ecell simulator in `spine` of `delta_t`.
    
    Paramters:
    ----------
    tmp_tstop: Temporary tstop. It has to be expressed in seconds
    """
    current_time = spine.ecellMan.ses.getCurrentTime()
    len_current_time = len (spine.ecellMan.loggers['ca'].getData()[:,0])
    print ("Ecell current time: %s in %s. Advancing of: %s seconds.\
    Current time len: %s") %(current_time, spine.id, delta_t, len_current_time)
    spine.ecellMan.ses.run(delta_t)
    
    

def synch_simulators(tmp_tstop, stim_spines_id,
                     dtNeuron,
                     delta_calcium_sampling, 
                     weight_baseline):
    """
    Calculate the synapse weight, using the calcium in the spine_heads 
    as input.
    
    Synch the two simulators using the following steps:
    1. Calculate the calcium concentration in the spines head in 
    NEURON and set this value in ecell.
    2. Advance ecell for the specified_delta
    3. Update the electric weight of the synapses in NEURON
    """
    print ("Synchronizing sims till [ms] %s") %tmp_tstop
    
    while h.t < tmp_tstop:
        h.fadvance() # run Neuron for step
        #for every ms in NEURON we update the ecellMan
        if np.round(h.t, decimals = 4) % delta_calcium_sampling == 0:
            for spine_id in stim_spines_id :
                spine = nrnSim.spines[spine_id]
                sync_calcium(spine, dtNeuron, delta_calcium_sampling)
                advance_ecell(spine, delta_calcium_sampling / 1e3)
                spine.ecellMan.ca_in['k'] = 0
                update_synape_weight(spine, weight_baseline)

def sync_calcium(spine, dtNeuron, delta_calcium_sampling):
    """"
    Calculate the flux of the calcium in the spine_head and synch 
    it with ecell. 
    """
    if hasattr(spine, 'ecellMan'):
        
        k_ca_flux = get_calcium_flux(dtNeuron, 
                                     delta_calcium_sampling, 
                                     spine)
        # Unit conversion in update_calcium
        spine.update_calcium(k_ca_flux)

def get_calcium_flux(dtNeuron, delta_calcium_sampling, spine):
    """
    Retrieving the calcium in the interval. end is always -1 because is
    the last timepoint available, start is when the interval has begun
    """
    start_index = -int(dtNeuron / delta_calcium_sampling)
    # Getting the calcium value
    vec_spine_head_cai = manager.get_vector(spine.head, 'cai')
    vec_spine_head_cali = manager.get_vector(spine.head, 'cali')
    
    head_cai = vec_spine_head_cai.x[start_index]
    head_cali = vec_spine_head_cali.x[start_index]
    electrical_ca_start = head_cai + head_cali
    
    head_cai = vec_spine_head_cai.x[-1]
    head_cali = vec_spine_head_cali.x[-1]
    electrical_ca_end = head_cai + head_cali
    electrical_diff = electrical_ca_end - electrical_ca_start
    print "Len vecs: %s start_idx: %s" %(len(vec_spine_head_cali), start_index)
    print "Electrical calcium start: %s end: %s difference: %s" %(electrical_ca_start,
                                                                  electrical_ca_end,
                                                                  electrical_diff)
    # Calculating the flux
    k_calcium_flux = electrical_diff / delta_calcium_sampling
    
    return k_calcium_flux
    

def update_synape_weight(spine, baseline):
    """
    Update the electrical weight's synapses.
    
    spine : the spine where the weight should be updated
    baseline : the equilibrium concentration of AMPAR-P which we use as reference
    and  put equal to one.
    """    
    
    # Updating the AMPA synapses
    for synapse in spine.synapses:
        if synapse.chan_type == 'ampa':                       
        # Retrieve the value of the weight.
            weight = spine.ecellMan.ampar_P['Value']/baseline
            synapse.netCon.weight[0] = weight
            # The weight of the ampa is a double list
            # Check the specs in synapse weight for more info. 
            synapse.weight[0].append(h.t)
            synapse.weight[1].append(weight)
            print "Updating synapse weight in %s, time [ms]: %s, weight: %s" %(spine.id,
                                                                               h.t,
                                                                               weight)

def create_excitatory_inputs(stim_spines_id, neuron_time_interval):
    """
    Create the excitatory inputs according to the parametes file.
    
    Create the NEURON inputs on each synapses according to the parameters.
    Set and initialize the ecell biochemical simulator in the stimulated
    spine."""
    
    excitatory_stimuli = []
    
    for spine_id in stim_spines_id:
        if spine_id in param.keys():
            spine = nrnSim.spines[spine_id]
            for stim_id in param[spine.id]:
                stim_par = param[stim_id]
                stim = Stimul((stim_par['t_stim']* 1e3), 
                              stim_par['numbers'], 
                              stim_par['delay'], 
                              stim_par['type'])
                stims_time = stim.get_stims_time()
                excitatory_stimuli.extend(stims_time)
                spine.setStimul(stim, neuron_time_interval)
                spine.setupBioSim() # Initializing ecell
    
    excitatory_stimuli.sort()
    return excitatory_stimuli


def advance_quickly(tmp_tstop, stim_spines_id, weight_baseline):
    """
    Advance the two simulators quickly in an independent way. Synapse weight 
    is synchronized at the end
    """
    delta_ecell = tmp_tstop - h.t
    delta_ecell_seconds = delta_ecell / 1e3
    print ("\nAdvance quickly routine.")
    print ("Current Neuron time: %s, aimed tstop[ms]: %s") %(h.t, tmp_tstop)
    print ("Delta applied on Ecell simulator [s]: %s\n") % delta_ecell_seconds
    advance_neuron(tmp_tstop)
    for spine_id in stim_spines_id:
        spine = nrnSim.spines[spine_id]
        advance_ecell(spine, delta_ecell_seconds)
        update_synape_weight(spine, weight_baseline)
    
def run_simulation(tStop_final, t_buffer, dtNeuron,
                   delta_calcium_sampling, weight_baseline):
    """
    Run the simulation. If input synchronizes the two simulators, 
    otherwise run each on its own and advance quickly
        
    """
    
    # Getting the calcium before the stims
    for spine_id in param['stimulated_spines']:
        spine = nrnSim.spines[spine_id]
        update_synape_weight(spine, weight_baseline)
        
    while h.t < tStop_final:
        
        if excitatory_stims:
            t_stim = excitatory_stims.pop(0)
            print "Current Neuron time: %s. Current t_stim: %s, remaining input: %s" %(h.t,
                                                                                       t_stim,
                                                                                       len(excitatory_stims))
            if h.t < t_stim:
                advance_quickly(t_stim, stim_spines_id, weight_baseline)
                tmp_tstop = t_stim + t_buffer
                synch_simulators(tmp_tstop, stim_spines_id,
                                 dtNeuron,
                                 delta_calcium_sampling,
                                 weight_baseline) 
                
                    
                
        else:
            print "No excitatory input remaining. Quickly to the end"
            advance_quickly(tStop_final, stim_spines_id, weight_baseline)
            h.fadvance() # This is to force the latest step and avoid the infinite loop.
    
    # Recording last 
    for spine_id in param['stimulated_spines']:
        spine = nrnSim.spines[spine_id]
        update_synape_weight(spine, weight_baseline) 

if __name__ == "__main__":

    import os
    import neuronControl
    
    if len(sys.argv) != 2:
        print("No parameter file supplied. Abort.")
        usage = 'python spineIntegration.py parameters_file.param'
        print usage
        sys.exit()
        
    parameter_file = sys.argv[1]
    param = parameters.ParameterSet(parameter_file)
    
    
    # Processing the options
    h.dt = param['dtNeuron']
    delta_calcium_sampling = param['delta_calcium_sampling']
    t_equilibrium_neuron = param['tEquilibrium_neuron']
    t_equilibrium_ecell = param['tEquilibrium_ecell']

    tStop_final = param['tStop']
                                                   
    print("Starting Spine integration")
    
    hoc_path = "hoc"
    mod_path="mod"
    
    nrnSim = neuronControl.NeuronSim(mod_path=mod_path, hoc_path=hoc_path, 
                              spines_dist=param['spines_dist'], 
                              biochemical_filename=param['biochemical_filename']) 
    
    kir_gkbar(param['kir_gkbar'])

    #--------------------------------------------------------------------------
    # Recording and stimul
    
    # Create Manager
    manager = Manager()
    
    # Set the stimuls to the synapses
    
    stim_spines_id = param['stimulated_spines']
    excitatory_stims = create_excitatory_inputs(stim_spines_id,
                                                param['time_resolution_neuron'])

    # Recording the sections
    
    variables_to_rec = param['var_to_plot']
    
    for var in variables_to_rec:
        for sec in h.allsec():
            #manager.add_all_vecRef(var) # Saving all the vecRef for testing
            if sec.name() in param['section_to_plot']:
                manager.add_vecRef(var, sec, param['time_resolution_neuron'])
            
    # Recording the synapses
    for spine_id in stim_spines_id:
        spine = nrnSim.spines[spine_id]
        for syn in spine.synapses:
            manager.add_synVecRef(syn)
    
    
    ##------------------------------------------------------------------------------ 
    ## Experiment
    nrnSim.init() # Initializing neuron
    
    # equilibrium
    print ("#--#")
    print ("Equilibrium run for the two simulators") 
    advance_neuron(t_equilibrium_neuron)
    for spine_id in stim_spines_id:
        advance_ecell(nrnSim.spines[spine_id], t_equilibrium_ecell)
    print ("Equilibrium run finished. Starting normal simulation.")
    print ("#--#")
    t_buffer = param['t_buffer']
    run_simulation(tStop_final, t_buffer, 
                   h.dt, delta_calcium_sampling, param['weight_baseline'])
    
    #------------------------------------
    # Save the Results
    
    # Add timeseries
    extRef = ExtRef()
    extRef.add_timeseries(manager, param['stimulated_spines'], nrnSim)
    
    # Saving the weight
    extRef.add_weights(manager, param['stimulated_spines'], nrnSim)
    
    print "Simulation Ended. Saving results"
    saving_dir = manager.create_new_dir(root='Data')
    hdf_name = 'storage.h5'
    filename = os.path.join(saving_dir, hdf_name)
    print "Results will be saved in %s" %filename
    # Saving everything
    manager.save_to_hdf(filename)
    
    #Let's save same plot
    
    for i, var in enumerate(param['var_to_plot']):
        secs = param['section_to_plot']
        vecs_to_plot = build_vecs_to_plot(var, secs, manager.refs['VecRef'])
        manager.plotVecs(vecs_to_plot, figure_num=i)
        
        if var == 'v':
            plt.ylabel("Voltage [mV]")
            plt.xlabel("Time [ms]")
            plt.ylim(-90) # Setting the minimum limits
            
        elif var == 'cai' or var == 'cali':
            plt.xlabel("Time [ms]")
            plt.ylabel("Concentration [mM]")
        
        elif var == 'ica':
            plt.xlabel("Time [ms]")
            plt.ylabel("Current [nA]")
            
        fig_file = 'plot_' + var
        plt.savefig(os.path.join(saving_dir, fig_file))

    from ecellControl import ecellManager as eM
    for stim_spine in param['stimulated_spines']:
        spine = nrnSim.spines[spine_id]
        eM.plotTimeCourses(spine.ecellMan.timeCourses, save=True, dir=saving_dir)
        eM.plotWeight(spine.ecellMan.timeCourses, dir=saving_dir)
