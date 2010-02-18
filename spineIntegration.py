# Author Michele Mattioni
# Wed Mar 18 17:51:51 GMT 2009

import logging
import numpy as np
import math

import sys
import os

import sqlite3
import cPickle

from neuron import h

from neuronControl import nrnSim, synapse 
from neuronControl.stimul import Stimul 

from helpers import Loader

from neuronvisio.manager import Manager
from neuronvisio.manager import SynVecRef

 
def save_inputs_in_db(filename):
    
    conn = sqlite3.connect(filename)
    cursor = conn.cursor()
    
    ###############
    # SynVec
    pickable_synVecRefs = manager.convert_syn_vec_refs()
    
    table = "SynVectors"
    # Create the table.
    sql_stm = "CREATE TABLE IF NOT EXISTS " + table + " (var TEXT, chan_type TEXT, \
    sec_name TEXT, vec BLOB)"
    cursor.execute(sql_stm)
    conn.commit()
    
    sql_stm = "INSERT INTO " + table + " VALUES(?,?,?,?)"
    for syn_vec_ref in pickable_synVecRefs:
        for var in syn_vec_ref.syn_vecs.keys():
            array = cPickle.dumps(syn_vec_ref.syn_vecs[var], -1)
            cursor.execute(sql_stm, (var, syn_vec_ref.chan_type, 
                           syn_vec_ref.section_name,
                           sqlite3.Binary(array))) 
    conn.commit()
    cursor.close()
    
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

if __name__ == "__main__":

    from optparse import OptionParser
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
    
    usage= "usage: %prog [options] tStop"
    parser = OptionParser(usage)
       
    parser.add_option("--dtNeuron", default=0.025, 
                  help= "Fixed timestep to use to update neuron. Default: 0.005 [ms]")
    parser.add_option("--calciumSampling", default=0.001, 
                  help= "Fixed interval used to sample the calcium concentration in the Neuron world and\
                   pass it to the biochemical simulator. Default: 0.001 [s]")
    parser.add_option("--tEquilibrium", default=0,
                      help= "Time to run the system to reach the equilibrium, Default: 0 [s]")
    (options, args) = parser.parse_args()
    
    # Checking the correct num of args
    
    if len(args) != 1:
        parser.error("Incorrect number of arguments. You should provide the tStop")
        parser.usage()
    else:
        # Processing the options
        h.dt = float(options.dtNeuron)
        calcium_sampling = float(options.calciumSampling)
        t_equilibrium = float(options.tEquilibrium)
        ecell_interval_update = calcium_sampling * 1e3 # we need [ms] to sync 
                                                       # with NEURON in the while
        
        tStop = float (args[0])
        tStop = t_equilibrium + tStop
                                                   
    logger.debug("Starting Spine integration")
    
    hoc_path = "hoc"
    mod_path="mod"
    
    nrnSim = neuronControl.NeuronSim(mod_path=mod_path, hoc_path=hoc_path, 
                              spines=True, 
                              biochemical=True,
                              biochemical_filename="biochemical_circuits/biomd183.eml") 

    # Set the spines
    
    # Set the stimuls to the synapses    
    
    
    stim1 = Stimul((1  + t_equilibrium) * 1e3, 10, 
                   0.1, 'ampa')
    stim2 = Stimul((1.1 + t_equilibrium) * 1e3, 10, 
                   0.1, 'ampa')
    nrnSim.spines[0].setStimul(stim1)
    nrnSim.spines[1].setStimul(stim2)
    
    manager = Manager()
    manager.stims = [stim1, stim2]
    for stim in manager.stims:
        print stim.to_log()
    
    
#    for spine in nrnSim.spines:
#        for synapse in spine.synapses:
#            for tStim in tStims:            
#                if synapse.chan_type == 'ampa':
#                    # to convert in secs
#                    synapse.createStimul(start = tStim * 1e3,  
#                                 number = 10, 
#                                 interval = 10 # ms between the stimuli
#                                 )
                

    #==========
    # Recording
    # - Variables in the section
    # - Synaptic weight
    # - Biochemical timecourse (done in the spines already)
    #==========

    # Recording the sections
    
    variables_to_rec = ['v', 'cai', 'cali', 'ica']
    
    for var in variables_to_rec:
        manager.add_all_vecRef(var)
#    for spine in nrnSim.spines:
#        sections_list = manager.get_tree(spine.psd)
#        for sec in sections_list:
#            for var in variables_to_rec:
#                manager.add_vecRef(var, sec)
    
    
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
                        synapse.syn_vecs['weight'].append(weight)
                
        if np.round(h.t, decimals = 4) % 200 == 0: # printig every two seconds
            logger.debug( "Neuron time [ms]: %f" % h.t)
            logger.debug( "Ecell Time [s] %g: " 
                              %spine.ecellMan.ses.getCurrentTime())
    #
    
    #------------------------------------
    # Save the Results
    print "Simulation Ended. Saving results"
    saving_dir = manager.create_new_dir()
    db_name = 'storage.sqlite'
    filename = os.path.join(saving_dir, db_name)
    # Saving the vectors
    manager.store_in_db(filename)
    
    # Saving the inputs
    save_inputs_in_db(filename)
    
    # Saving the timeseries
    save_timeseries_in_db(filename)
    
    #Writing the log
    write_log(saving_dir, tStop, options.calciumSampling, options.dtNeuron, 
              t_equilibrium, manager.stims)