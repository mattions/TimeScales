# Author Michele Mattioni
# Wed Mar 18 17:51:51 GMT 2009


from nrnSim import *




def calcWeight(CaMKIIbar):
    """Calc the weight of the synapses according to the CaMKII"""
    
    # Dummy function should be changed
    weight = 1 + CaMKIIbar
    return weight  


nrnSim = NeuronSim()
h = nrnSim.h # Unpacking the variable for easy access in the console

tStop = 1

nrnSim.init()


while h.t < tStop:
    nrnSim.run(0.001) # run Neuron for ms
    for spine in nrnSim.spines:
        
        # Setting the calcium in the biochemical sim with the one from neuron
        electrical_cal = spine.vecs['ca'].x[-1] 
        spine.ecellMan.ca['Value'] = electrical_cal 
         
        spine.ecellMan.ses.run(0.001)
        
        # getting the conc of the active CaMKII and set the weight of the synapse
        CamKIIbar = spine.ecellMan.CaMKIIbar['Value']
        ampa = spine.synapses['ampa']
        ampa['netCon'].weight[0] = calcWeight(CamKIIbar)
        

### Let's plot
        
         


