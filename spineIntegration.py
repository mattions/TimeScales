# Author Michele Mattioni
# Wed Mar 18 17:51:51 GMT 2009

import logging
import numpy
from neuron import h

from neuronControl import nrnSim, synapse
from helpers import Loader, Storage
from nrnvisio.manager import Manager



def calcWeight(CaMKIIbar, theta=10):
    """Calc the weight of the synapses according to the CaMKII"""
    
    # Dummy function should be changed
    weight = 1 + (1 + math.pow(CaMKIIbar, theta)/k)
    return weight


def convertCalcium(cai, vol=1e-15):
    """Convert the internal calcium concentration to the number of molecules."""
    
    NAv= 6.022e23
    numberOfMoleculs = cai * vol * NAv
    numberOfMoleculs = math.round(numberOfMoleculs)
    
    return numberOfMoleculs

def update_calcium_spines(spine_head_vec, var, ca_sampling_interval):
    """Update the calcium taking it from the NEURON section to the ecell compartment
        
        params:
        spine_head_vec - vec recording calcium concentration
        var - Name of the variable recording the calcium
        ca_sampling_interval - Interval to use to sync the electrical concentration \
        with the biochemical.
    """
    electrical_ca = spine_head_vec[var].x[-1] 
    spine.ecellMan.ca['Value'] = electrical_ca
    spine.ecellMan.ses.run(ca_sampling_interval)
    print "Equilibrium for spine: %s, dend: %s, bio sim time: \
    %f" % (spine.head.name(), spine.parent.name(),
           spine.ecellMan.ses.getCurrentTime())


def save_results(manager):
    """Save the results in a directory"""
    loader = Loader()
    saving_dir = loader.create_new_dir(prefix=os.getcwd())
    
    # Storage object
    storage  = Storage()
    
    # Convert manager to a pickable object
    pickable_vec_refs = manager.convert_vec_refs()
    storage.set_VecRefs(pickable_vec_refs)
    
    # get the timecourses
    spine_timecourses = {}
    for spine in nrnSim.spines:
        spine.ecellMan.converToTimeCourses()
        spine_timecourses[spine.id] = spine.ecellMan.timeCourses    
    
    
    loader.save(pickable_vec_refs, saving_dir, "pickable_vec_refs")
    
#    synapses_weight = {}
#    for spine in nrnSim.spines:
#        for syn_name, syn_obj in spine.synapses.iteritems():
#            key = synapse.type + "_" + synapse.section
#            synapses_weight[key] = synapse.synVecs['weight']
#    loader.save(synapses_weight, saving_dir, "synapses_weight")

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
       
    parser.add_option("--dtNeuron", default=0.005, 
                  help= "Fixed timestep to use to update neuron. i.e.:0.005")
    
    parser.add_option("--calciumSampling", default=0.020, 
                  help= "Fixed interval used to sample the calcium concentration in the Neuron world and\
                   pass it to the biochemical simulator. i.e.:0.020")
    
    (options, args) = parser.parse_args()
    
    # Checking the correct num of args
    
    if len(args) != 2:
        parser.error("Incorrect number of arguments. You should provide \
        the tEquilibrium and the tStop")
        parser.usage()
    else:
        tEquilibrium = float (args[0])
        tStop = float (args[0])
        if tStop < tEquilibrium:
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

    # Set the stimuls to the synapses    
    # For now hardcoded than we have to decide _how_ give the input. 
    for spine in nrnSim.spines:
        for synapse in spine.synapses:
            if synapse.chan_type == 'ampa':
                synapse.createStimul(start = (tEquilibrium) * 1e3, # to convert in secs 
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
        sections_list = manager.get_tree(spine.neck)
        for sec in sections_list:
            for var in variables_to_rec:
                manager.add_vecRef(var, sec)
    
    
    # Recording the synapses
    
    for spine in nrnSim.spines:
        
        for syn in spine.synapses:
            synVec = manager.add_synVecRef(syn)
            
    
    
    
        
    #------------------------------------------------------------------------------ 
    # Equilibrium run
        
    logger.debug("Running the system until equilibrium: %f" %tEquilibrium)
    nrnSim.initAndRun(tEquilibrium * 1e3) # NEURON use the millisecond as base unit
    logger.debug( "Equilibrium reached. Neuron time: %f" % h.t)
    for spine in nrnSim.spines:
        spine.ecellMan.ses.run(float (options.calciumSampling))
        logger.debug( "Equilibrium for spine: %s, dend: %s, bio sim time: %f" % (spine.head.name(), 
                                                                         spine.parent.name(),
                                                                         spine.ecellMan.ses.getCurrentTime()))
        
    
    ##------------------------------------------------------------------------------ 
    ## Experiment
    
    while h.t < tStop:
        h.fadvance() # run Neuron for step
        logger.debug( "Neuron time [ms]: %f, spines: %s" % ( nrnSim.h.t, 
                                                             nrnSim.spines))
        if numpy.round(h.t, decimals = 4) % 1 == 0: # for every ms in NEURON we update the ecellMan
            
            for spine in nrnSim.spines:
                vec_spine_head = manager.get_vec(spine.head, 'cai')
                update_calcium_spines(vec_spine_head, 'cai', 
                                      float (options.calciumSampling)) 
            
            
                # getting the conc of the active CaMKII and set the weight of the synapse
                CaMKIIbar = spine.ecellMan.CaMKIIbar['Value']
                weight = calcWeight(CaMKIIbar)
                
                # Updating the AMPA synapses
                ampa = spine.synapses['ampa']
                ampa.netCon.weight[0] = weight
                ampa.synVecs['weight'].append(weight)
    #            
        if numpy.round(h.t, decimals = 4) % 50 == 0: # printig every half sec
                logger.debug( "Neuron time [ms]: %f, spines: %s" 
                              % ( h.t, nrnSim.spines))
                logger.debug( "Ecell Time [s] %g: " 
                              %spine.ecellMan.ses.getCurrentTime())
    #
    
    #------------------------------------
    # Save the Results
    print "Simulation Ended"
    save_results(manager)