# Author: Michele Mattioni
# Mon Jan 26 05:54:30 GMT 2009

from neuron import h
import ecellControl as eC
import math


class Spine():
    """Class spine. Create a spine with head and neck"""
    
    def __init__(self):
        """ Create a spine with a standard volume of ~0.11 um
        the h is the reference to the main hoc interpreter"""
        
        self.neck = self.createNeck()
        self.head = self.createHead(self.neck)
        self.parent = None # the parent section connected to the neck
        
        # TODO Reorganize the synapse in a proper object
        self.synapses = {}
        ampa = self.createAMPASyn()
        self.synVecs = self.createSynapseVecs(ampa)
        self.synapses['ampa'] = ampa
        
        # Setting up the vector
        self.createCalciumVector()
        
        
        # Setting up the biochemical simulator
        self.ecellMan = self.setupBioSim()
    
    def setupBioSim(self):
        """Initialize the Biochemical Simulator creating the instance of 
        the object to control the simulation"""
        
        ecellMan = eC.EcellManager("biochemical_circuits/biomd183_noCalcium.eml")
        ecellMan.createLoggers()
        return ecellMan
        
    def createNeck(self):
        """ Create the neck with the Grunditz value"""
        neck = h.Section()
        neck.L = 1 # um
        neck.diam = 0.0394
        neck.nseg = 2
        neck.Ra = 150.0 # Used by Grunditz et al 2008 (see supplemental material)
        return neck
        
    def createHead(self, neck):
        """Create the head of the spine and populate it with the right channels"""
        head = h.Section()
        vol = 0.11 #um
        head.L = 1
        head.diam = math.sqrt(vol / head.L * math.pi ) * 2
        self.Ra = 150.0
        neck.nseg = 7
        head.connect(self.neck)
        ### Insert the appropriate channels
        head.insert("caL")
        head.insert("caL13")
        head.insert("can")
        head.insert("skkca")
        head.insert("caq")
        
        return head
                
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
        
        syn["syn"] = h.ampa(position, sec = self.head)
        
        syn["netCon"] = h.NetCon(syn["netStim"], syn["syn"])
        syn["netCon"].weight[0] = 1
        
        return syn
    
    def createSynapseVecs(self, syn):
        """Create the vector to measure the activity of the synapse"""
        
        synVecs = {}
        synVecs["stimul"] = h.Vector()
        syn["netCon"].record(synVecs["stimul"]) # Record the input 
        
        synVecs["i"] = h.Vector()
        synVecs["i"].record(syn["syn"]._ref_i)
        
        return synVecs
    
    def createCalciumVector(self):
        """Create the vector for the calcium"""
        vecs = {}
        vecs['ca'] = h.Vector()
        vecs['ca'].record(self.head(0.5)._ref_cai)
        vecs['cai'] = h.Vector()
        vecs['cai'].record(self.head(0.5)._ref_cali)
        self.vecs = vecs
    
    def attach(self, parentSec, parentx, childx):
        """Attach a spine to a parentSec and store the parentSec into an attribute.
        Just an handy variation of the connect method"""
        self.neck.connect(parentSec, parentx, childx)
        self.parent = parentSec
        
if __name__ == "__main__":
    import neuron
    import numpy
    from spine import *
    import pylab
    
    h = neuron.h
    
    
    sp1 = Spine()
    sp1_syn = sp1.createAMPASyn()
    sp1_synVecs = sp1.createSynapseVecs(sp1_syn)
    vecs = {}
    
    for var in ['t', 'sp1_head_v', 'sp1_neck_v']:
        vecs[var] = h.Vector()
    
    vecs['t'].record(h._ref_t)
    vecs['sp1_head_v'].record(sp1.head(0.5)._ref_v)
    vecs['sp1_neck_v'].record(sp1.neck(0.5)._ref_v)
    
    import neuron.gui
    h.tstop = 1000
    h.run()
    pylab.plot(vecs['t'], vecs['sp1_head_v'], label='sp1_head_v')
    pylab.plot(vecs['t'], vecs['sp1_neck_v'], label='sp1_neck_v')
    pylab.legend(loc=0)
    
    pylab.show()