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


def calcWeight(old_weight, CaMKIIbar, n=2, k=4):
    """Calc the weight of the synapses according to the CaMKII"""
    
    # Dummy function should be changed
    delta = math.pow(CaMKIIbar, n) / (math.pow(k, n) + math.pow(CaMKIIbar, n))
    weight = old_weight + delta
    s = "Old weight %f, CAMKIIbar value: %e,\
    calculated delta: %e" %(old_weight, CaMKIIbar, delta)
    #print s
    return weight

def write_log(saving_dir, tStop, calciumSampling, dtNeuron, tEquilibrium, stims):
    """Save the results in a directory"""
    f = open(os.path.join(saving_dir, 'log.txt'), 'w') 
    f.write("tStop [s]: %f\n" % (tStop))
    f.write("calciumSampling [s]: %f\n" % (calciumSampling))
    f.write("dtNeuron [ms]: %f\n" % (dtNeuron))
    f.write("tEquilibrium [s]: %f\n" % (tEquilibrium))
    for stim in stims:
        f.write(stim.to_log())
    f.close()
    print "Simulation saved in %s" % saving_dir

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
#    print ("Ecell current time: %s in %s. Advancing of: %s seconds.") %(current_time,
#                                                                           spine.id, 
#                                                                           delta_t)
    spine.ecellMan.ses.run(delta_t)
    
    

def synch_simulators(tmp_tstop, stim_spines_id, delta_calcium_sampling):
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
                sync_calcium(spine)
                advance_ecell(spine, delta_calcium_sampling / 1e3)
                update_synape_weight(spine)

def sync_calcium(spine):
    """"
    Calculate the calcium in the spine_head and synch it with ecell. 
    """
    if hasattr(spine, 'ecellMan'):
        vec_spine_head_cai = manager.get_vector(spine.head, 'cai')
        vec_spine_head_cali = manager.get_vector(spine.head, 'cali')
        head_cai = vec_spine_head_cai.x[-1]
        head_cali = vec_spine_head_cali.x[-1]
        electrical_ca = head_cai + head_cali
        spine.update_calcium(electrical_ca)


def update_synape_weight(spine):
    """
    Update the electrical weight's synapses using active CaMKII 
    """    
    # getting the conc of the active CaMKII
    CaMKIIbar = spine.ecellMan.CaMKIIbar['Value']
    
    # Updating the AMPA synapses
    for synapse in spine.synapses:
        if synapse.chan_type == 'ampa':                       
            weight = calcWeight(synapse.netCon.weight[0], CaMKIIbar)
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
    print "Excitatory stim [ms]: %s " % excitatory_stimuli
    return excitatory_stimuli


def advance_quickly(tmp_tstop, stim_spines_id):
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
        update_synape_weight(spine)
    
def run_simulation(tStop_final, t_buffer, delta_calcium_sampling):
    """
    Run the simulation. If input synchronizes the two simulators, 
    otherwise run each on its own and advance quickly
        
    """
    
    # Getting the calcium before the stims
    for spine_id in param['stimulated_spines']:
        spine = nrnSim.spines[spine_id]
        update_synape_weight(spine)
        
    while h.t < tStop_final:
        
        if excitatory_stims:
            t_stim = excitatory_stims.pop(0)
            print "Current Neuron time: %s. Current t_stim: %s, remaining input: %s" %(h.t,
                                                                                       t_stim,
                                                                                       excitatory_stims)
            if h.t < t_stim:
                advance_quickly(t_stim, stim_spines_id)
                tmp_tstop = t_stim + t_buffer
                synch_simulators(tmp_tstop, stim_spines_id, delta_calcium_sampling) 
                
                    
                
        else:
            print "No excitatory input remaining. Quickly to the end"
            advance_quickly(tStop_final, stim_spines_id)
            h.fadvance() # This is to force the latest step and avoid the infinite loop.
    
    # Recording last 
    for spine_id in param['stimulated_spines']:
        spine = nrnSim.spines[spine_id]
        update_synape_weight(spine) 

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
    run_simulation(tStop_final, t_buffer, delta_calcium_sampling)
    
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
