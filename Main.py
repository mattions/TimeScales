# Author Michele Mattioni
# Wed Mar 18 17:51:51 GMT 2009

from neuron import h
from nrnSim import *
from synapse import *
from graph import *
import numpy




def calcWeight(CaMKIIbar):
    """Calc the weight of the synapses according to the CaMKII"""
    
    # Dummy function should be changed
    weight = 1 + CaMKIIbar
    return weight  


nrnSim = NeuronSim()

tEquilibrium = 100 # [sec] 

#------------------------------------------------------------------------------ 
graph = Graph()

vecsVolt = {}
vecsCai = {}
vecsCali = {}
vecsiCa = {}


# Set the stimuls to the synapses

for spine in nrnSim.spines:
    ampaSyn = Synapse('ampa', spine.head)
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

print "Run the system 'till equilibrium"
# Using CVODE with a variable timestep
cvode = h.CVode()
cvode.active(1)

nrnSim.init() # init

#h.dt = 10 #  [ms]  
nrnSim.run(tEquilibrium * 1e3) # NEURON use the millisecond as base unit
print "Equilibrium reached. Neuron time: %f" % h.t
for spine in nrnSim.spines:
    spine.ecellMan.ses.run(tEquilibrium)
    print "Equilibrium for spine: %s, dend: %s, bio sim time: %f" % (spine.head.name(), 
                                                                     spine.parent.name(),
                                                                     spine.ecellMan.ses.getCurrentTime())



#------------------------------------------------------------------------------ 
# Experiment

#tStop = (tEquilibrium + 2) * 1e3
#nrnSim.h.dt = 0.025 # [ms] is the bas unit for neuron so fixed dt at 0.025
##
#weights_tracker = []
#while nrnSim.h.t < tStop:
#    nrnSim.h.fadvance() # run Neuron for step
##    print "Neuron time [ms]: %f, spines: %s" % ( nrnSim.h.t, nrnSim.spines)
#    if numpy.round(nrnSim.h.t, decimals = 4) % 1 == 0: # for every ms in NEURON we update the ecellMan
#        for spine in nrnSim.spines:
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
#    if numpy.round(nrnSim.h.t, decimals = 4) % 50 == 0: # printig every half sec
#            print "Neuron time [ms]: %f, spines: %s" % ( nrnSim.h.t, nrnSim.spines)
#            print "Ecell Time [s] %g: " %spine.ecellMan.ses.getCurrentTime()

## Let's plot