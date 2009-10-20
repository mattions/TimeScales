# Author Michele Mattioni
# Wed Mar 18 17:51:51 GMT 2009

import logging
import numpy
import math

from neuron import h

from neuronControl import nrnSim, synapse
from helpers import Loader, Storage

from nrnvisio.manager import Manager
from nrnvisio.manager import SynVecRef


def calcWeight(old_weight, CaMKIIbar, n=2, k=4):
    """Calc the weight of the synapses according to the CaMKII"""
    
    # Dummy function should be changed
    delta = math.pow(CaMKIIbar, n) / (math.pow(k, n) + math.pow(CaMKIIbar, n))
    weight = old_weight + delta
    s = "Old weight %f, CAMKIIbar value: %e,\
    calculated delta: %e" %(old_weight, CaMKIIbar, delta)
    print s
    return weight


def convertCalcium(cai, vol=1e-15):
    """Convert the internal calcium concentration to the number of molecules."""
    
    NAv= 6.022e23
    numberOfMoleculs = cai * vol * NAv
    numberOfMoleculs = math.round(numberOfMoleculs)
    
    return numberOfMoleculs

def update_calcium_spines(ca_concentration, spine_head_vol, ca_sampling_interval):
    """Update the calcium taking it from the NEURON section to the ecell compartment
        
        params:
        calcium concentration - Name of the variable recording the calcium
        spine_head_vol - Volume of the spine's head
        ca_sampling_interval - Interval to use to sync the electrical concentration \
        with the biochemical.
    """
    print "Neuron calcium: %f, Ecell Calcium: %f" %(ca_concentration, 
                                                    spine.ecellMan.ca['Value'])
    # converting the concentration in molecules:
    # mM to M (1e-3)
    # um^3 to l (1e-15)
    # 6.022 * 1e23 Avogadro's number
    ca_ions = ca_concentration * spine_head_vol * 1e-3 * 1e-15 * 6.022 * 1e23
    spine.ecellMan.ca['Value'] = ca_ions
    print "Neuron calcium: %f, Ecell Calcium: %f" %(ca_concentration, 
                                                    spine.ecellMan.ca['Value'])
    spine.ecellMan.ses.run(ca_sampling_interval)

def save_results(manager, tStim, tStop, calciumSampling, dtNeuron):
    """Save the results in a directory"""
    loader = Loader()
    saving_dir = loader.create_new_dir(prefix=os.getcwd())
    
    # Storage object
    storage  = Storage()
    
    # Convert the time
    storage.t = numpy.array(manager.t)
    
    # Convert manager to a pickable object
    pickable_vec_refs = manager.convert_vec_refs()
    storage.set_vecRefs(pickable_vec_refs)
    
    pickable_synVecRefs = manager.convert_syn_vec_refs()
    storage.set_synVecRefs(pickable_synVecRefs)
    
    # get the biochemical timecourses
    spine_timecourses = {}
    synVecRefs = []
    spines_id = []
    spines_pos = []
    spines_parent_sec = []
    
    for spine in nrnSim.spines:
        # Retrieving the biochemical timecourses
        spine.ecellMan.converToTimeCourses()
        
        spine_timecourses[spine.id] = spine.ecellMan.timeCourses
        spines_id.append(spine.id)
        spines_pos.append(spine.pos)
        spines_parent_sec.append(spine.parent.name())
        
    storage.set_timecourses(spine_timecourses)
    storage.set_spines(spines_id, spines_pos, spines_parent_sec)
    
    # We need to save spines pos and parent
    
    
    loader.save(storage, saving_dir, "storage")
    f = open(os.path.join(saving_dir, 'log.txt'), 'w') 
    f.write("tStim [s]: %f\n" % (tStim))
    f.write("tStop [s]: %f\n" % (tStop))
    f.write("calciumSampling [s]: %f\n" % (calciumSampling))
    f.write("dtNeuron [ms]: %f\n" % (dtNeuron))
    f.close()
    return storage

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
    
    usage= "usage: %prog [options] tEquilibrium tStop"
    parser = OptionParser(usage)
       
    parser.add_option("--dtNeuron", default=0.025, 
                  help= "Fixed timestep to use to update neuron. i.e.:0.005")
    
    parser.add_option("--calciumSampling", default=0.020, 
                  help= "Fixed interval used to sample the calcium concentration in the Neuron world and\
                   pass it to the biochemical simulator. i.e.:0.020")
    
    (options, args) = parser.parse_args()
    
    # Checking the correct num of args
    
    if len(args) != 2:
        parser.error("Incorrect number of arguments. You should provide \
        the timeOfStimul and the tStop")
        parser.usage()
    else:
        tStim = float (args[0])
        tStop = float (args[1])
        if tStop < tStim:
            logger.error("tEquilbrium should be bigger of Tstop. \
            We can't finish before the equilibrium")
            parser.usage()
        
    
    # Processing the options
    logger.debug("Starting Spine integration")
    
    hoc_path = "hoc"
    mod_path="mod"
    
    nrnSim = neuronControl.NeuronSim(mod_path=mod_path, hoc_path=hoc_path, 
                              spines=True, 
                              biochemical=True,
                              biochemical_filename="biochemical_circuits/biomd183.eml") 

    # Set the spines
    
    # Set the stimuls to the synapses    
    # For now hardcoded than we have to decide _how_ give the input.
       
    for spine in nrnSim.spines:
        for synapse in spine.synapses:
            if synapse.chan_type == 'ampa':
                synapse.createStimul(start = (tStim) * 1e3, # to convert in secs 
                             number = 10, 
                             interval = 10 # ms between the stimuli
                             )
                

    #==========
    # Recording
    # - Variables in the section
    # - Synaptic weight
    # - Biochemical timecourse (done in the spines already)
    #==========

    # Recording the sections
    
    variables_to_rec = ['v', 'cai', 'cali', 'ica']
    
    manager = Manager()
    for spine in nrnSim.spines:
        sections_list = manager.get_tree(spine.psd)
        for sec in sections_list:
            for var in variables_to_rec:
                manager.add_vecRef(var, sec)
    
    
    # Recording the synapses
    
    for spine in nrnSim.spines:
        
        for syn in spine.synapses:
            synVec = manager.add_synVecRef(syn)
    
    
    #------------------------------------------------------------------------
    # Processing the options
    
    h.dt = float(options.dtNeuron)
    calcium_sampling = float(options.calciumSampling)
    
    ecell_interval_update = calcium_sampling * 1e3 # we need [ms] to sync 
                                                   # with NEURON in the while
    
    ##------------------------------------------------------------------------------ 
    ## Experiment
    nrnSim.init() # Initilizing neuron
    while h.t < tStop * 1e3: # Using [ms] for NEURON
        h.fadvance() # run Neuron for step
        #for every ms in NEURON we update the ecellMan
        if numpy.round(h.t, decimals = 4) % ecell_interval_update == 0: 
                
            for spine in nrnSim.spines:
                vec_spine_head_cai = manager.get_vector(spine.head, 'cai')
                vec_spine_head_cali = manager.get_vector(spine.head, 'cali')
                head_cai = vec_spine_head_cai.x[-1]
                head_cali = vec_spine_head_cali.x[-1]
                electrical_ca = head_cai + head_cali
                 
                update_calcium_spines(electrical_ca, spine.head_vol, 
                                      calcium_sampling)
            
                # getting the conc of the active CaMKII and set the weight of the synapse
                CaMKIIbar = spine.ecellMan.CaMKIIbar['Value']
                
                # Updating the AMPA synapses
                for synapse in spine.synapses:
                    if synapse.chan_type == 'ampa':
                        weight = calcWeight(synapse.netCon.weight[0], CaMKIIbar)
                        synapse.netCon.weight[0] = weight
                        synapse.syn_vecs['weight'].append(weight)
                
        if numpy.round(h.t, decimals = 4) % 200 == 0: # printig every two seconds
            logger.debug( "Neuron time [ms]: %f, spines: %s" 
                              % ( h.t, nrnSim.spines))
            logger.debug( "Ecell Time [s] %g: " 
                              %spine.ecellMan.ses.getCurrentTime())
    #
    
    #------------------------------------
    # Save the Results
    print "Simulation Ended"
    sto = save_results(manager, tStim, tStop, 
                       options.calciumSampling, options.dtNeuron)