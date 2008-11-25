# Author: Michele Mattioni
# Tue Nov 11 11:54:40 GMT 2008

import neuron
import mediumSpinyNeuron

class neuronSim():
    def __init__(self):
        h = neuron.h 
        msn = mediumSpinyNeuron.mediumSpinyNeuron(h)
        self.setup()
        
    def setup(self):

        
    def run(self, tStop):    
        if 
    def rig1():
        # Creating an ICLAMP just for testing
        iClamp = self.h.IClamp(soma, 0.5)
        
        t = h.Vector()
        t.record(h._ref_t)
        print "Created vectors t"
        
        v_soma = h.Vector()
        v_soma.record(self.soma(0.5)._ref_v)
        print "Created vectors v_soma"
        
        ca_in_s = h.Vector()
        ca_in_s.record(self.soma(0.5)._ref_cai)
        print "Created vectors ca_in_s"

if __name__ == "__main__":
    nrnSim = neuronSim()