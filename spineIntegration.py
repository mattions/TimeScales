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

from neuronControl.nrnManager import NeuronManager
from neuronControl.stimul import Stimul 


from neuronvisio.manager import Manager
from sumatra.external.NeuroTools import parameters

import tables 
from extref import ExtRef 

    
def iClamptest(delay=10, duration=250, amplititude=0.248):
    """# Quick Iclamp test to check the current dynamics"""
    iclamp = h.IClamp(h.MSP_Cell[0].soma(0.5))
    iclamp.delay = delay
    iclamp.dur = duration
    iclamp.amp = amplititude        


class Runner():
    """Class to run the two simulator together"""
    def __init__(self, parameter_file):
        """Read the param and create the manager from neuronvisio"""
        self.param = parameters.ParameterSet(parameter_file)
        # Create Neuronvisio Manager
        self.manager = Manager()
    
    def advance_ecell(self, spine, delta_t):
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
    
    def advance_quickly(self, tmp_tstop, nrnManager):
        """
        Advance the two simulators quickly in an independent way. Synapse weight 
        is synchronized at the end
        """
        stimulated_spines = self.param['stimulated_spines']
        #Update the weight
        for spine_id in stimulated_spines:
            spine = nrnManager.spines[spine_id]   
            self.update_synape_weight(spine)
        
        delta_ecell = tmp_tstop - h.t
        delta_ecell_seconds = delta_ecell / 1e3
        print ("\nAdvance quickly routine.")
        print ("Current Neuron time: %s, aimed tstop[ms]: %s") %(h.t, tmp_tstop)
        print ("Delta applied on Ecell simulator [s]: %s\n") % delta_ecell_seconds
        nrnManager.run(tmp_tstop)
        for spine_id in stimulated_spines:
            spine = nrnManager.spines[spine_id]
            self.advance_ecell(spine, delta_ecell_seconds)
            self.update_synape_weight(spine)
    
    
    def build_vecs_to_plot(self, var, secs, anyRefs):
        """Create the dictionary of section->vectors to plot"""
        vecs_to_plot = {}
        for secName in secs:
            for ref in anyRefs:
                if secName == ref.sec_name:
                    if ref.vecs.has_key(var):
                        vecs_to_plot[secName] = ref.vecs[var]
        return vecs_to_plot
        
    def create_excitatory_inputs(self, nrnManager):
        """
        Create the excitatory inputs according to the parametes file.
        
        - Create the NEURON inputs on each synapses according to the parameters
        - Record the synaptic vars with a SynVecRef
        - Set and initialize the ecell biochemical simulator in the stimulated
        spine."""
        
        excitatory_stimuli = []
        
        for spine_id in self.param['stimulated_spines']:
            if spine_id in self.param.keys(): # for each spine we list the input
                spine = nrnManager.spines[spine_id]
                for stim_id in self.param[spine.id]:
                    stim_dictionary = self.param[stim_id]
                    stim = Stimul((stim_dictionary['t_stim']), 
                                  stim_dictionary['numbers'], 
                                  stim_dictionary['delay'], 
                                  stim_dictionary['type'])
                    if stim.chan_type == 'ampa':
                        for syn in spine.synapses:
                            if syn.chan_type == 'ampa':
                                syn.stims.append(stim)
                                
                    elif stim.chan_type == 'nmda':# more than one stim
                        for syn in spine.synapses:
                            if syn.chan_type == 'nmda':
                                syn.stims.append(stim)
                       
                    stims_time = stim.get_stims_time()
                    excitatory_stimuli.extend(stims_time)
                    
                spine.deploy_stims(self.param['neuron_time_recording_interval'])
                spine.setup_bio_sim() # Initializing ecell
        
        excitatory_stimuli = list(set(excitatory_stimuli))
        excitatory_stimuli.sort()
        return excitatory_stimuli
    
    def get_calcium_flux(self, spine):
        """
        Retrieving the calcium in the interval. end is always -1 because is
        the last timepoint available, start is when the interval has begun
        """
        delta_calcium_sampling = self.param['delta_calcium_sampling'] 
        start_index = -int(delta_calcium_sampling/ self.param['dtNeuron'])
        # Getting the calcium value
        vec_spine_head_cai = self.manager.get_vector(spine.head, 'cai')
        vec_spine_head_cali = self.manager.get_vector(spine.head, 'cali')
        
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

    def equilibrium(self, nrnManager):
        """Brings both NEURON and Ecell to equilibrium"""  
        print ("#--#")
        print ("Equilibrium started.")
        nrnManager.run(self.param['t_equilibrium_neuron'])
        for spine_id in self.param['stimulated_spines']:
            spine = nrnManager.spines[spine_id]
            runner.advance_ecell(spine, self.param['t_equilibrium_ecell'])
            spine.set_ampa_equilibrium_baseline()
        print ("Equilibrium run finished. Starting normal simulation.")
        print ("#--#")
    
    def main(self):
        print ("#--#")
        print ("Equilibrium run for the two simulators")
        # Neuron Setup -----------------------------------------------------------
        nrnManager = NeuronManager(self.param['biochemical_filename'],
                                   self.param['big_spine'],
                                   self.param['dtNeuron'],
                                   spines_dist=self.param['spines_dist'],
                                   mod_path='mod', 
                                   hoc_path='hoc') 
        
        nrnManager.set_kir_gkbar(self.param['kir_gkbar'])
    
        # Recording -------------------------------------------------------------------------
        # - Recording and stimul
        # - Set the stimuls to the synapses
        # - Initialize Ecell in each spine
        
        excitatory_stims = self.create_excitatory_inputs(nrnManager)
        print "This are the time of the stims: %s" %excitatory_stims
    
        # Recording the sections
        self.record_vectors(nrnManager)
        
        # Experiment -------------------------------------------------------------------- 
        nrnManager.init() # Initializing neuron
        self.equilibrium(nrnManager)
        self.run_simulation(nrnManager, excitatory_stims)
        
        # Save the Results ------------------------------------
        self.save_results(nrnManager)
        
        #Let's save same plot
        self.plot_results(nrnManager)
    
    
    
    def plot_results(self, nrnManager):
        for i, var in enumerate(self.param['var_to_plot']):
            secs = self.param['section_to_plot']
            vecs_to_plot = self.build_vecs_to_plot(var, 
                                                   secs, 
                                                   self.manager.refs['VecRef'])
            self.manager.plotVecs(vecs_to_plot, figure_num=i)
            
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
    
        from helpers.plotter import EcellPlotter
        ecp = EcellPlotter()
        x_start = self.param['tEquilibrium_ecell']
        x_stop = x_start + self.param['tStop']/1e3
        for stim_spine in self.param['stimulated_spines']:
            spine = nrnManager.spines[stim_spine]
            ecp.plot_timeCourses(spine.ecellMan.timeCourses, save=True, 
                               dir=saving_dir, name=spine.id, 
                               x_lims= [x_start, x_stop])
            ecp.plot_weight(spine.ecellMan.timeCourses, dir=saving_dir)
            
    def record_vectors(self, nrnManager):
        """Add a vecRef to record the vectors"""
        
        for var in self.param['var_to_plot']:
            for sec_rec in self.param['sec_to_rec']:
                if sec_rec == 'all': 
                    for sec in h.allsec():
                        self.manager.add_all_vecRef(var,
                                                    self.param['neuron_time_recording_interval'])
                        break
                else:
                    for sec in h.allsec():
                        if sec.name() in param['sec_to_rec']:
                            self.manager.add_vecRef(var, sec, 
                                                    param['neuron_time_recording_interval'])
                    
        # Recording the synapses
        for spine_id in self.param['stimulated_spines']:
            spine = nrnManager.spines[spine_id]
            for syn in spine.synapses:
                self.manager.add_synVecRef(syn)

    def run_simulation(self, nrnManager, excitatory_stims):

        """
        Run the simulation. If input synchronizes the two simulators, 
        otherwise run each on its own and advance quickly
            
        """
        # Processing the options
        tStop_final = self.param['tStop'] + self.param['t_equilibrium_neuron']        
        
        # Getting the calcium before the stims
        for spine_id in self.param['stimulated_spines']:
            spine = nrnManager.spines[spine_id]
            self.update_synape_weight(spine)
            
        while h.t < tStop_final:
            
            if excitatory_stims:
                t_stim = excitatory_stims.pop(0)
                s_log = "Current Neuron time: %s. \
                Current t_stim: %s, remaining input: %s" %(h.t, 
                                                           t_stim,
                                                           len(excitatory_stims))
                print s_log
                
                if h.t < t_stim:
                    self.advance_quickly(t_stim, nrnManager)
                    tmp_tstop = t_stim + self.param['t_buffer']
                    self.synch_simulators(tmp_tstop, nrnManager)
            else:
                print "No excitatory input remaining. Quickly to the end"
                self.advance_quickly(tStop_final, nrnManager)
                h.fadvance() # This is to force the latest step and avoid the infinite loop.
        
        # Recording last 
        for spine_id in self.param['stimulated_spines']:
            spine = nrnManager.spines[spine_id]
            self.update_synape_weight(spine)
    
    def save_results(self, nrnManager):
        """Saving both results"""
            # Add timeseries
        extRef = ExtRef()
        extRef.add_timeseries(self.manager, 
                              self.param['stimulated_spines'], 
                              nrnManager)
        
        # Saving the weight
        extRef.add_weights(self.manager, 
                           self.param['stimulated_spines'], 
                           nrnManager)
        
        print "Simulation Ended. Saving results"
        saving_dir = self.manager.create_new_dir(root='Data')
        hdf_name = 'storage.h5'
        filename = os.path.join(saving_dir, hdf_name)
        print "Results will be saved in %s" %filename
        # Saving everything
        self.manager.save_to_hdf(filename)
        
    def synch_simulators(self, tmp_tstop, nrnManager):
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
        stimulated_spines = self.param['stimulated_spines']
        t_synch_start = h.t
        while h.t < tmp_tstop:
            h.fadvance() # run Neuron for step
            #for every ms in NEURON we update the ecellMan
            if np.round(h.t, decimals = 4) % self.param['delta_calcium_sampling'] == 0:
                for spine_id in stimulated_spines :
                    spine = nrnManager.spines[spine_id]
                    self.sync_calcium(spine)
                    self.advance_ecell(spine, (h.t - t_synch_start) / 1e3)
                    # Stopping flux from the input.
                    spine.ecellMan.ca_in['k'] = 0
                    # Re-enabling pump and leak. 
                    spine.ecellMan.ca_leak['vmax'] = self.param['ca_leak_vmax']
                    spine.ecellMan.ca_pump['vmax'] = self.param['ca_pump_vmax']
                    self.update_synape_weight(spine)
                t_synch_start = h.t # Resetting the t_start to the new NEURON time.
    
    def sync_calcium(self, spine):
        """"
        Calculate the flux of the calcium in the spine_head and synch 
        it with ecell. 
        """
        if hasattr(spine, 'ecellMan'):
            
            k_ca_flux = self.get_calcium_flux(spine)
            # Unit conversion in update_calcium
            spine.update_calcium(k_ca_flux)
            
    def update_synape_weight(self, spine):
        """
        Update the electrical weight's synapses. Use the baseline calculated
        just after the equilibrium as reference to estimate the change of the weight
        
        spine : the spine where the weight should be updated
        baseline : the equilibrium concentration of AMPAR-P which we use as reference
        and  put equal to one.
        """    
        
        # Updating the AMPA synapses
        for syn in spine.synapses:
            if syn.chan_type == 'ampa':                       
            # Retrieve the value of the weight.
                weight = spine.ecellMan.ampar_P['Value']/spine.ampa_equilibrium_conc
                syn.netCon.weight[0] = weight
                # The weight of the ampa is a double list
                # Check the specs in synapse weight for more info. 
                syn.weight[0].append(h.t)
                syn.weight[1].append(weight)
                print "Updating synapse weight in %s, time [ms]: %s, weight: %s, netCon: %s" %(spine.id,
                                                                                   h.t,
                                                                                   weight,
                                                                                   syn.netCon.weight[0])
                print "AMPA syn value g: %s itmp: %s ical: %s i: %s scale: %s voltage: %s" %(syn.chan.g, 
                                                                                  syn.chan.itmp,
                                                                                  syn.chan.ical,
                                                                                  syn.chan.i,
                                                                                  syn.chan.scale,
                                                                                  spine.psd.v )
                itmp = syn.chan.scale * syn.chan.g * spine.psd.v
                print "itmp in NEURON: %s, itmp calculated: %s" %(syn.chan.itmp, itmp)

    
if __name__ == "__main__":
    
    if len(sys.argv) != 2:
        print("No parameter file supplied. Abort.")
        usage = 'python spineIntegration.py parameters_file.param'
        print usage
        sys.exit()
        
    parameter_file = sys.argv[1]
    runner = Runner(parameter_file)
    runner.main()

