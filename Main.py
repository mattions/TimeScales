# Author Michele Mattioni
# Wed Mar 18 17:51:51 GMT 2009


from nrnSim import *




def calcWeight(CaMKIIbar):
    """Calc the weight of the synapses according to the CaMKII"""
    
    # Dummy function should be changed
    weight = 1 + CaMKIIbar
    return weight  


nrnSim = NeuronSim()
nrnSim.init()

### Equilibrium run

print "Run the system till at the equilibrium"

#nrnSim.run(100 * 1e3) # NEURON use the millisecond as base unit
#for spine in nrnSim.spines:
#    spine.ecellMan.ses.run(100)
#
#
#
## Experiment
#
#tStop = 200 * 1e3
#nrnSim.h.dt = 0.025 #ms for neuron
#
#weights_tracker = []
#while nrnSim.h.t < tStop:
#    nrnSim.h.fadvance() # run Neuron for ms
#    print "Neuron time [ms]: %f, spines: %s" % ( h.t, nrnSim.spines)
#    if h.t % 1 == 0: # for every ms in NEURON we update the ecellMan
#        for spine in nrnSim.spines:
#            
#            # Setting the calcium in the biochemical sim with the one from neuron
#            electrical_cal = spine.vecs['ca'].x[-1] 
#            spine.ecellMan.ca['Value'] = electrical_cal 
#            print "Ecell Time [s] %f: " %spine.ecellMan.ses.getCurrentTime() 
#            spine.ecellMan.ses.run(0.001)
#            
#            # getting the conc of the active CaMKII and set the weight of the synapse
#            CaMKIIbar = spine.ecellMan.CaMKIIbar['Value']
#            ampa = spine.synapses['ampa']
#            weight = calcWeight(CaMKIIbar)
#            ampa['netCon'].weight[0] = weight
#            weights_tracker.append(weight)
#        print "Active CamKII: %f Weight AMPA: %f" % (CaMKIIbar, weight)

### Let's plot
        
         


