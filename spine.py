# Author: Michele Mattioni
# Mon Jan 26 05:54:30 GMT 2009

import nrn

class Spine(nrn.Section):
    """Class spine. Extend the section class"""
    def __init__(self, ):
        """ Create a spine with a standard volume of ~0.11 um"""
        # Volume of a spine ~ 0.11 um 
        # dia = (sqrt (V/(pi*h))) * 2
        self.L = 1
        self.diam =  0.3742
        debug = True
        if debug:
            import math
            vol = spine.L * (spine.diam/2) * (spine.diam/2) * math.pi
            print "Volume of the spine %f" % vol
            
    def createAMPASyn(self, section, position=0.5):
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
        
        syn["syn"] = h.ampa(position, sec = section)
        
        syn["netCon"] = h.NetCon(syn["syn"], syn["netStim"])
        syn["netCon"].weight[0] = 10
        
        return syn
    
    def createSynapseVecs(syn):
        """Create the vector to measure the activity of the synapse"""
        
        synVecs = {}
        synVecs["stimul"] = h.Vector()
        syn["netCon"].record(synVecs["stimul"]) # Record the input 
        
        synVecs["i"] = h.Vector()
        synVecs["i"].record(syn["syn"]._ref_i)