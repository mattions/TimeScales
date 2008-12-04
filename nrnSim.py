# Author: Michele Mattioni
# Tue Nov 11 11:54:40 GMT 2008

import neuron
import mediumSpinyNeuron

class NeuronSim():
    def __init__(self):
        self.h = neuron.h 
        self.msn = mediumSpinyNeuron.MediumSpinyNeuron(self.h)
        self.initialized = False
        
    def run(self, tStop):
        """Run the simulation untill tStop"""
        if not self.initialized: 
            self.h.finitialize(-87.75)
            self.initialized = True
        
        while (self.h.t < tStop):
            self.h.fadvance()
            
    
    def rig1(self):
        """Creating an IClamp in the soma"""
        # Creating an ICLAMP just for testing
        self.msn.soma.push()
        iClamp = self.h.IClamp(0.5)
        self.h.pop_section()
        
        iClamp.delay = 10
        iClamp.dur = 10
        iClamp.amp = 0.3
    
    def rec(self):
        
        vectors = {}
        t = self.h.Vector()
        t.record(self.h._ref_t)
        vectors['time'] = t
        print "Created vectors t"
        
        v_soma = self.h.Vector()
        v_soma.record(self.msn.soma(0.5)._ref_v)
        vectors['v_soma'] = v_soma
        print "Created vectors v_soma"
        
        ca_in_s = self.h.Vector()
        ca_in_s.record(self.msn.soma(0.5)._ref_cai)
        vectors['ca_in_s'] = ca_in_s
        print "Created vectors ca_in_s"
        
        return vectors

if __name__ == "__main__":
    nrnSim = NeuronSim()
    vectors = nrnSim.rec()
    #nrnSim.rig1()
    nrnSim.run(20)