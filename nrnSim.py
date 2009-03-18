# Author: Michele Mattioni
# Tue Nov 11 11:54:40 GMT 2008

import neuron
import numpy
from pylab import *
from spine import *

class NeuronSim():
    def __init__(self):
        self.h = neuron.h
        self.h.load_file("my_init.hoc")
            
    def run(self, tStop):
        """Run the simulation untill tStop"""
        while (self.h.t < tStop):
            self.h.fadvance()
            
    def init(self, v_init=-87.75):
        """Initialize the cell"""
        self.h.finitialize(v_init)
        self.initialized = True
        
    def initAndRun(self, tStop):
        """Initialize and run the simulation untill tStop""" 
        self.init()
        self.run(tStop)
        
    def rig1(self):
        """Creating an IClamp in the soma"""
        # Creating an ICLAMP just for testing
        self.msn.soma.push()
        iClamp = self.h.IClamp(0.5)
        self.h.pop_section()
        
        iClamp.delay = 100
        iClamp.dur = 500
        iClamp.amp = 0.2481
        
        return iClamp
    


# Test code

if __name__ == "__main__":
    import pylab
    nrnSim = NeuronSim()
    h = nrnSim.h # Unpacking the variable for easy access in the console
    vecs = {}
    vecs['t'] = h.Vector()
    vecs['t'].record(h._ref_t)
    vecs['v_soma'] = h.Vector()
    vecs['v_soma'].record(h.MSP_Cell[0].soma(0.5)._ref_v)
    iClamp = h.IClamp(0.5, sec=h.MSP_Cell[0].soma)
    iClamp.delay = 100
    iClamp.dur = 500
    iClamp.amp = 0.2481
    #import neuron.gui
    #h.load_file("guiRig2.ses")
    nrnSim.initAndRun(800)
    pylab.plot(vecs['t'],vecs['v_soma'])
    pylab.show()
    
    