# Author Michele Mattioni
# Wed Mar 18 17:51:51 GMT 2009

from neuron import h
from neuronControl import nrnSim, synapse, graph
import numpy




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




if __name__ == "__main__":

    from optparse import OptionParser
    import os
    
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

    logger.debug("Starting Spine integration")
    
    usage= "usage: %prog [options] tEquilibrium tStop"
    parser = OptionParser(usage)
       
    parser.add_option("-nDt", "--dtNeuron", default=0.005, 
                  help= "Fixed timestep to use to update neuron.")
    
    parser.add_option("-caS", "--calciumSampling", default=0.020, 
                  help= "Fixed interval used to sample the calcium concentration in the Neuron world and\
                   pass it to the biochemical simulator")
    
    
    (options, args) = parser.parse_args()
    
    # Checking the correct num of args
    
    if len(args) != 2:
        parser.error("Incorrect number of arguments. You should provide the tEquilibrium and the tStop")
        parser.usage()
    else:
        tEquilibrium = float (args[0])
        tStop = float (args[0])
        if tStop < tEquilibrium:
            logger.error("tEquilbrium should be bigger of Tstop. We can't finish before the equilibrium")
            parser.usage()
        
    
    # Processing the options
    
    nrnSim = nrnSim.NeuronSim()
    
    #------------------------------------------------------------------------------ 
    graph = graph.Graph()
    
    vecsVolt = {}
    vecsCai = {}
    vecsCali = {}
    vecsiCa = {}
    
    
    # Set the stimuls to the synapses
    
    # For now hardcoded than we have to decide _how_ give the input. 
    
    for spine in neuronSim.spines:
        ampaSyn = synapse.Synapse('ampa', spine.head)
        ampaSyn.createStimul(start = (tEquilibrium) * 1e3, # to convert in secs 
                             number = 10, 
                             interval = 10 # ms between the stimuli
                             ) 
        spine.synapses[ampaSyn.type] = ampaSyn
        vecsVolt = graph.createVecs(vecsVolt, spine, 'v')
        vecsCai = graph.createVecs(vecsCai, spine, 'cai')
        vecsCali = graph.createVecs(vecsCali, spine, 'cali')
        vecsiCa = graph.createVecs(vecsiCa, spine, 'ica')
        
    
    #------------------------------------------------------------------------------ 
    # Equilibrium run
    
    
    def updateSpines():
        for spine in neuronSim.spines:
            ca_from_NEURON = spine.vecs['ca'].x[-1] 
            spine.ecellMan.ca['Value'] = ca_from_NEURON 
            spine.ecellMan.ses.run(caSamplingInterval)
            print "Equilibrium for spine: %s, dend: %s, bio sim time: %f" % (spine.head.name(), 
                                                                         spine.parent.name(),
                                                                         spine.ecellMan.ses.getCurrentTime())
    for eventTimePoint in eventTimePoints:
        event = Event(eventTimePoint, neuronSim)
        
    logger.debug("Running the system until equilibrium: %f" %tEquilibrium)
    nrnSim.initAndRun(tEquilibrium * 1e3) # NEURON use the millisecond as base unit
    logger.debug( "Equilibrium reached. Neuron time: %f" % h.t)
    for spine in neuronSim.spines:
        spine.ecellMan.ses.run(caSamplingInterval)
        logger.debug( "Equilibrium for spine: %s, dend: %s, bio sim time: %f" % (spine.head.name(), 
                                                                         spine.parent.name(),
                                                                         spine.ecellMan.ses.getCurrentTime()))
    
    
    
    ##------------------------------------------------------------------------------ 
    ## Experiment
    #
    
    #
    ## Back To Fix timeStep. We need to implement a variable algorithm to 
    ## keep track of the changes
    #cvode.active(0)
    
    #
    weights_tracker = []
    while h.t < tStop:
        h.fadvance() # run Neuron for step
        logger.debug( "Neuron time [ms]: %f, spines: %s" % ( neuronSim.h.t, neuronSim.spines))
        if numpy.round(h.t, decimals = 4) % 1 == 0: # for every ms in NEURON we update the ecellMan
            for spine in neuronSim.spines:
                
                # Setting the calcium in the biochemical sim with the one from neuron
                electrical_cal = spine.vecs['ca'].x[-1] 
                spine.ecellMan.ca['Value'] = electrical_cal 
                print "Ecell Time [s] %g: " %spine.ecellMan.ses.getCurrentTime() 
                spine.ecellMan.ses.run(float (options.calciumSampling) )
    #            
    #            # getting the conc of the active CaMKII and set the weight of the synapse
                CaMKIIbar = spine.ecellMan.CaMKIIbar['Value']
                weight = calcWeight(CaMKIIbar)
    #            
    #            # Updating the AMPA synapses
                ampa = spine.synapses['ampa']
                ampa.netCon.weight[0] = weight
                weights_tracker.append(weight)
    #            
        if numpy.round(h.t, decimals = 4) % 50 == 0: # printig every half sec
                logger.debug( "Neuron time [ms]: %f, spines: %s" % ( h.t, neuronSim.spines))
                logger.debug( "Ecell Time [s] %g: " %spine.ecellMan.ses.getCurrentTime())
    #
    #### Let's plot
