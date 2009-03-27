# Author: Michele Mattioni
# Mon Jan 26 05:54:30 GMT 2009

from neuron import h, nrn
import ecellControl as eC
import math


class mySection(nrn.Section):
    """Extend the Section object with the overriding then name"""
    def __init__(self, id):
        nrn.Section.__init__(self)
        sec = h.Section()
        self.id = id

class Spine():
    """Class spine. Create a spine with head and neck"""
    
    def __init__(self, name, filename_bioch_mod="biochemical_circuits/biomd183_noCalcium.eml"):
        """ Create a spine with a standard volume of ~0.11 um
        the h is the reference to the main hoc interpreter"""
        self.name = name
        self.neck = self.createNeck()
        self.head = self.createHead(self.neck)
        self.parent = None # the parent section connected to the neck
        self.synapses = {} # Dict to save the pointer to the synapses
        
        # Setting up the vector
        self.createCalciumVector()
        
        # Setting up the biochemical simulator
        self.ecellMan = self.setupBioSim(filename_bioch_mod)
    
    def updateName(self):
        """Update the name of the sections. Call this method only when you will not change the section"""
        self.neck.rename()
        self.head.rename()
        
    def setupBioSim(self, filename):
        """Initialize the Biochemical Simulator creating the instance of 
        the object to control the simulation"""
        
        ecellMan = eC.EcellManager(filename)
        ecellMan.createLoggers()
        return ecellMan
        
    def createNeck(self):
        """ Create the neck with the Grunditz value"""
        neck = mySection(self.name + "_neck")
        neck.L = 1 # um
        neck.diam = 0.0394
        neck.nseg = 2
        neck.Ra = 150.0 # Used by Grunditz et al 2008 (see supplemental material)
        return neck
        
    def createHead(self, neck):
        """Create the head of the spine and populate it with the right channels"""
        head = mySection(self.name + "_head")
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
        
        # Calcium dynamics
        head.insert("cadyn")
        head.insert("caldyn")
        
        return head
    
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
    from spine import *
    from synapse import *
    from neuron import h
    import neuron
    from graph import *
    import numpy
    import pylab
   
    neuron.load_mechanisms("../mod")
    
    spine1 = Spine("spine1", filename_bioch_mod ="../biochemical_circuits/biomd183_noCalcium.eml")
    ampaSyn = Synapse('ampa', spine1.head)
    ampaSyn.createStimul(start=30, number=10, interval=10, noise=0)
    spine1.synapses = [ampaSyn]
    
    
    vecsVolt = {}
    vecsCai = {}
    vecsCali = {}
    
    g = Graph()
    vecsVolt = g.createVecs(vecsVolt, spine1, 'v')
    vecsCai = g.createVecs(vecsCai, spine1, 'cai')
    vecsCali = g.createVecs(vecsCali, spine1, 'cali')
    
    import neuron.gui
    h.tstop = 1000
    h.run()
    g.plotVoltage(vecsVolt, ampaSyn.synVecs)
    g.plotCalcium(vecsCai)
    g.plotCalcium(vecsCali)
    pylab.show()