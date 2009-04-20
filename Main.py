# Author Michele Mattioni
# Wed Mar 18 17:51:51 GMT 2009

from neuron import h
from neuronControl import nrnSim, synapse, graph
import numpy




def calcWeight(CaMKIIbar):
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


neuronSim = nrnSim.NeuronSim()

#------------------------------------------------------------------------------ 
graph = graph.Graph()

vecsVolt = {}
vecsCai = {}
vecsCali = {}
vecsiCa = {}


# Set the stimuls to the synapses

tEquilibrium = 100 # [sec] 

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


caSamplingInterval = 0.0020 # [sec] Reasonable Calcium sampling
# Using CVODE with a variable timestep
cvode = neuronSim.usingVariableTimeStep()
eventTimePoints = numpy.arange(0,tEquilibrium, caSamplingInterval)

#def updateSpines():
#    for spine in neuronSim.spines:
#        ca_from_NEURON = spine.vecs['ca'].x[-1] 
#        spine.ecellMan.ca['Value'] = ca_from_NEURON 
#        spine.ecellMan.ses.run(caSamplingInterval)
#        print "Equilibrium for spine: %s, dend: %s, bio sim time: %f" % (spine.head.name(), 
#                                                                     spine.parent.name(),
#                                                                     spine.ecellMan.ses.getCurrentTime())
#for eventTimePoint in eventTimePoints:
#    event = Event(eventTimePoint, neuronSim)
    
print "Run the system 'till equilibrium"
neuronSim.initAndRun(tEquilibrium * 1e3) # NEURON use the millisecond as base unit
print "Equilibrium reached. Neuron time: %f" % h.t
for spine in neuronSim.spines:
    spine.ecellMan.ses.run(caSamplingInterval)
    print "Equilibrium for spine: %s, dend: %s, bio sim time: %f" % (spine.head.name(), 
                                                                     spine.parent.name(),
                                                                     spine.ecellMan.ses.getCurrentTime())



##------------------------------------------------------------------------------ 
## Experiment
#
#tStop = (tEquilibrium + 2) * 1e3
#
## Back To Fix timeStep. We need to implement a variable algorithm to 
## keep track of the changes
#cvode.active(0)
#h.dt = 0.025 # [ms] is the bas unit for neuron so fixed dt at 0.025
#
#weights_tracker = []
#while h.t < tStop:
#    h.fadvance() # run Neuron for step
##    print "Neuron time [ms]: %f, spines: %s" % ( neuronSim.h.t, neuronSim.spines)
#    if numpy.round(h.t, decimals = 4) % 1 == 0: # for every ms in NEURON we update the ecellMan
#        for spine in neuronSim.spines:
#            
#            # Setting the calcium in the biochemical sim with the one from neuron
#            electrical_cal = spine.vecs['ca'].x[-1] 
#            spine.ecellMan.ca['Value'] = electrical_cal 
##            print "Ecell Time [s] %g: " %spine.ecellMan.ses.getCurrentTime() 
#            spine.ecellMan.ses.run(0.001)
#            
#            # getting the conc of the active CaMKII and set the weight of the synapse
#            CaMKIIbar = spine.ecellMan.CaMKIIbar['Value']
#            weight = calcWeight(CaMKIIbar)
#            
#            # Updating the AMPA synapses
#            ampa = spine.synapses['ampa']
#            ampa.netCon.weight[0] = weight
#            weights_tracker.append(weight)
#            
#    if numpy.round(h.t, decimals = 4) % 50 == 0: # printig every half sec
#            print "Neuron time [ms]: %f, spines: %s" % ( h.t, neuronSim.spines)
#            print "Ecell Time [s] %g: " %spine.ecellMan.ses.getCurrentTime()
#
#### Let's plot
