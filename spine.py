# Author: Michele Mattioni
# Mon Jan 26 05:54:30 GMT 2009

import nrn
from neuron import h

class Spine(nrn.Section):
    """Class spine. Extend the section class"""
    def __init__(self):
        """ Create a spine with a standard volume of ~0.11 um
        the h is the reference to the main hoc interpreter"""
        nrn.Section.__init__(self) # Calling the init of the 
        # Volume of a spine ~ 0.11 um 
        # dia = (sqrt (V/(pi*h))) * 2
        self.L = 1
        self.diam =  0.3742
        self.nseg = 7
        self.Ra = 150 # Used by Grunditz et al 2008 (see supplemental material) 
        debug = True
        if debug:
            import math
            vol = self.L * (self.diam/2) * (self.diam/2) * math.pi
            print "Volume of the spine %f" % vol
            
    def createAMPASyn(self, position=0.5):
        """Insert an ampa synapse in the section
        
        return syn dictionary where there are:
        stim -> MyNetStim class
        ampa -> h.ampa class
        nc -> h.NetCon class"""
        
        syn = {}
        syn["netStim"] = h.NetStim()
        syn["netStim"].number = 10
        syn["netStim"].start = 50
        syn["netStim"].noise = 0
        
        syn["syn"] = h.ampa(position, sec = self)
        
        syn["netCon"] = h.NetCon(syn["netStim"], syn["syn"])
        syn["netCon"].weight[0] = 10
        
        return syn
    
    def createSynapseVecs(self, syn):
        """Create the vector to measure the activity of the synapse"""
        
        synVecs = {}
        synVecs["stimul"] = h.Vector()
        syn["netCon"].record(synVecs["stimul"]) # Record the input 
        
        synVecs["i"] = h.Vector()
        synVecs["i"].record(syn["syn"]._ref_i)
        
        return synVecs
    
    def attach(self, parentSec, parentx, childx):
        """Attach a spine to a parentSec and store the parentSec into an attribute.
        Just anhandy variation of the connect method"""
        self.parent = parentSec
        self.connect(parentSec, parentx, childx)