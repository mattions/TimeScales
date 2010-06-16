# Author Michele Mattioni
# Wed Mar 18 17:51:51 GMT 2009

import logging
import numpy as np
import math

import sys
import os

from neuron import h

import matplotlib
backend = 'Agg'
matplotlib.use(backend)
import matplotlib.pyplot as plt

from neuronControl import nrnSim, synapse 
from neuronControl.stimul import Stimul 

from neuronvisio.manager import Manager
from sumatra.external.NeuroTools import parameters

import tables 
from neuronvisio.manager import BaseRef

 
class TimeSeries(BaseRef):
    
    def __init__(self, sec_name=None, vecs=None, detail=None):
        
        BaseRef.__init__(self)
        self.sec_name = sec_name
        self.vecs = vecs
        self.detail = detail


def add_timeseries(manager):
    print nrnSim.spines
    for spine in nrnSim.spines:
        
        if hasattr(spine, 'ecellMan'):
            # Retrieving the biochemical timecourses
            spine.ecellMan.converToTimeCourses()
            time_courses = spine.ecellMan.timeCourses 
            
            pos = str(spine.pos)
            parent = spine.parent.name()
            detail = parent + "_" + pos
            sec_name = str(spine.id)
            
            # Adding a record for each variable
            vecs = {}
            time = None
            for var in time_courses.keys():
                time = time_courses[var][0]
                vecs[var] = time_courses[var][1]
                
            timeseriesRef = TimeSeries(sec_name=sec_name, 
                                       vecs=vecs,
                                       detail=detail)
            manager.add_ref(timeseriesRef, time)
            print manager.refs
        else:
            print "Not ecell instance in spine: %s" %spine.id
                            
   
def save_timeseries_in_db(filename):
        
    conn = sqlite3.connect(filename)
    cursor = conn.cursor()
    
    ################
    # timeseries
    table = "Timeseries"
    # Create the table.
    sql_stm = "CREATE TABLE IF NOT EXISTS " + table + " (var TEXT, pos REAL, \
    parent TEXT, sec_name TEXT, vec BLOB)"
    cursor.execute(sql_stm)
    conn.commit()
    
    sql_stm = "INSERT INTO " + table + " VALUES(?,?,?,?,?)"
    for spine in nrnSim.spines:
        if hasattr(spine, 'ecellMan'):
            # Retrieving the biochemical timecourses
            spine.ecellMan.converToTimeCourses()
            time_courses = spine.ecellMan.timeCourses 
            notes = '#timecourse'
            pos = str(spine.pos)
            parent = spine.parent.name()
            sec_name = str(spine.id)
            
            # Adding a record for each variable
            for key in time_courses.keys():
                var = key
                array = cPickle.dumps(time_courses[key], -1)
                cursor.execute(sql_stm, (var, pos, parent, sec_name,
                                         sqlite3.Binary(array)))    
        conn.commit()
    cursor.close()

    

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

def build_vecs_to_plot(var, secs, vecRefs):
    """Create the dictionary of section->vectors to plot"""
    vecs_to_plot = {}
    for secName in secs:
        for vecref in vecRefs:
            if secName == vecref.sec_name:
                if vecref.vecs.has_key(var):
                    vecs_to_plot[secName] = vecref.vecs[var]
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

if __name__ == "__main__":

    import os
    import neuronControl
    
    logger = logging.getLogger("spineIntegration")
    logger.setLevel(logging.DEBUG)
    #create console handler and set level to debug
    ch = logging.StreamHandler()
    ch.setLevel(logging.DEBUG)
    #create formatter
    formatter = logging.Formatter("%(name)s - %(levelname)s - %(message)s")
    #add formatter to ch
    ch.setFormatter(formatter)
    #add ch to logger
    logger.addHandler(ch)
    
    
    if len(sys.argv) != 2:
        print("No parameter file supplied. Abort.")
        usage = 'python spineIntegration.py parameters_file.param'
        print usage
        sys.exit()
        
    parameter_file = sys.argv[1]
    param = parameters.ParameterSet(parameter_file)
    
    
    # Processing the options
    h.dt = param['dtNeuron']
    calcium_sampling = param['calciumSampling']
    t_equilibrium = param['tEquilibrium']
    ecell_interval_update = calcium_sampling * 1e3 # we need [ms] to sync 
                                                   # with NEURON in the while
    tStop = param['tStop']
    tStop = t_equilibrium + tStop
                                                   
    logger.debug("Starting Spine integration")
    
    hoc_path = "hoc"
    mod_path="mod"
    
    nrnSim = neuronControl.NeuronSim(mod_path=mod_path, hoc_path=hoc_path, 
                              spines_dist=param['spines_dist'], 
                              biochemical_filename=param['biochemical_filename']) 
    
    kir_gkbar(param['kir_gkbar'])
    
    
    # Create Manager
    manager = Manager()
    
    # Set the stimuls to the synapses
    
    stim_spines = param['stimulated_spines']
    for spine_id in stim_spines:
        if spine_id in param.keys():
            for spine in nrnSim.spines:
                if spine_id == spine.id:
                    for stim_id in param[spine.id]:
                        stim_par = param[stim_id]
                        stim = Stimul((stim_par['t_stim'] + t_equilibrium)* 1e3, 
                                      stim_par['numbers'], 
                                      stim_par['delay'], 
                                      stim_par['type'])
                        spine.setStimul(stim)
                        spine.setupBioSim() # Initializing ecell
                
    #==========
    # Recording
    # - Variables in the section
    
    # - Synaptic weight
    # - Biochemical timecourse (done in the spines already)
    #==========

    # Recording the sections
    
    variables_to_rec = param['var_to_plot']
    
    for var in variables_to_rec:
        for sec in h.allsec():
            if sec.name() in param['section_to_plot']:
                manager.add_vecRef(var, sec)
    
    
    # Recording the synapses
    
    for spine in nrnSim.spines:
        for syn in spine.synapses:
            synVec = manager.add_synVecRef(syn)
            
    

    
    ##------------------------------------------------------------------------------ 
    ## Experiment
    nrnSim.init() # Initializing neuron
    while h.t < ( tStop * 1e3): # Using [ms] for NEURON
        h.fadvance() # run Neuron for step
        #for every ms in NEURON we update the ecellMan
        if np.round(h.t, decimals = 4) % ecell_interval_update == 0: 
                
            for spine in nrnSim.spines:
                if hasattr(spine, 'ecellMan'):
                    vec_spine_head_cai = manager.get_vector(spine.head, 'cai')
                    vec_spine_head_cali = manager.get_vector(spine.head, 'cali')
                    head_cai = vec_spine_head_cai.x[-1]
                    head_cali = vec_spine_head_cali.x[-1]
                    electrical_ca = head_cai + head_cali
                    
                    spine.update_calcium(electrical_ca)
                    spine.ecellMan.ses.run(calcium_sampling)
                
                    # getting the conc of the active CaMKII and set the weight of the synapse
                    CaMKIIbar = spine.ecellMan.CaMKIIbar['Value']
                    
                    # Updating the AMPA synapses
                    for synapse in spine.synapses:
                        if synapse.chan_type == 'ampa':                       
                            weight = calcWeight(synapse.netCon.weight[0], CaMKIIbar)
                            synapse.netCon.weight[0] = weight
                            synapse.vecs['weight_ampa'].append(weight)
                
        if np.round(h.t, decimals = 4) % 200 == 0: # printig every two seconds
            logger.debug( "Neuron time [ms]: %f" % h.t)
            if hasattr(spine, 'ecellMan'):
                logger.debug( "Ecell Time [s] %g: " 
                                  %spine.ecellMan.ses.getCurrentTime())
    
    #------------------------------------
    # Save the Results
    
    # Add timeseries
    add_timeseries(manager)
    
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