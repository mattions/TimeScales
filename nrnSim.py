# Author: Michele Mattioni
# Tue Nov 11 11:54:40 GMT 2008

#from neuron import h
import numpy
from spine import *

class NeuronSim():
    def __init__(self):
        h.load_file("my_init.hoc")
        self.distributeSpines()
            
    def run(self, tStop):
        """Run the simulation untill tStop"""
        while (h.t < tStop):
            h.fadvance()
            
    def init(self, v_init=-87.75):
        """Initialize the cell"""
        h.finitialize(v_init)
        self.initialized = True
        
    def initAndRun(self, tStop):
        """Initialize and run the simulation untill tStop""" 
        self.init()
        self.run(tStop)
    
    def distributeSpines(self):
        """Attach spines to the dendrites"""
        
        # Now just a test spine
        spine = Spine("spine1")
        spine.attach(h.MSP_Cell[0].dend1_1[1], 0.5, 0)
        self.spines = [spine]
        
        
    def rig1(self):
        """Creating an IClamp in the soma"""
        # Creating an ICLAMP just for testing
        
        iClamp = self.h.IClamp(0.5, sec = h.MSP_Cell[0].soma)
        
        iClamp.delay = 100
        iClamp.dur = 500
        iClamp.amp = 0.2481
        
        return iClamp
    


# Test code

if __name__ == "__main__":
    import pylab
    import neuron.gui
    from neuron import h
    cvode = h.CVode()
    cvode.active(1)
    cvode.atol(0.0001)
    nrnSim = NeuronSim()
    vecs = {}
    vecs['t'] = h.Vector()
    vecs['t'].record(h._ref_t)
    vecs['v_soma'] = h.Vector()
    vecs['v_soma'].record(h.MSP_Cell[0].soma(0.5)._ref_v)
    iClamp = h.IClamp(0.5, sec=h.MSP_Cell[0].soma)
    iClamp.delay = 100
    iClamp.dur = 500
    iClamp.amp = 0.2481
    h.load_file("../guiRig2.ses")
    nrnSim.initAndRun(800)
    pylab.plot(vecs['t'],vecs['v_soma'])
    pylab.show()
    
    