# Author: Michele Mattioni
# Mon Jan 26 05:54:30 GMT 2009

from neuron import h, nrn
import ecellControl as eC
import math
import os


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
        self.psd = self.createPSD(self.head)
        self.parent = None # the parent section connected to the neck
        self.synapses = {} # Dict to save the pointer to the synapses
        
        # Setting up the biochemical simulator
        self.gcw = os.getcwd()
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
        neck.nseg = 3
        neck.L = 1.5 # um
        neck.diam = 0.1
        #neck.Ra = 150.0 # Used by Grunditz et al 2008 (see supplemental material)
        neck.Ra = 100.0 #
        
        neck.insert("pas")
        
        h.factors_catrack() # Called on the NMOD
        neck.insert("catrack")
        
        h.factors_caltrack()
        neck.insert("caltrack") 
                
        return neck
        
    def createHead(self, neck):
        """Create the head of the spine and populate it with the right channels"""
        head = mySection(self.name + "_head")
        vol = 0.11 #um
        head.L = 1
        head.diam = math.sqrt(vol / head.L * math.pi ) * 2
        self.Ra = 150.0
        head.nseg = 7
        head.connect(neck)
        

        head.insert("pas")
        head.insert("cansp")
        head.insert("caqsp")
        head.insert("carsp")
        head.insert("skkcasp")

        

        h.factors_caltrack()
        head.insert("caltrack")
        
        h.factors_catrack()
        head.insert("catrack")
        
        return head
    
    def createPSD(self, head):
        """Create the Post Synaptic Density of the spine to model the different \
        location of the different channel"""
        psd = mySection(self.name + "_psd")
        psd.L = 0.05        # um, Holmes & Levy 1990
        psd.diam = 0.5      # Wilson 1998 (Shepherd book)
        psd.Ra =100
        psd.connect(head)
        
        psd.insert("caL13sp")
        psd.insert("caLsp")
        psd.insert("rubin")
        
        h.factors_catrack()
        psd.insert("catrack")
        h.factors_caltrack()
        psd.insert("caltrack")
        
        return psd
        
        
    
    def attach(self, parentSec, parentx, childx):
        """Attach a spine to a parentSec and store the parentSec into an attribute.
        Just an handy variation of the connect method"""
        self.neck.connect(parentSec, parentx, childx)
        self.parent = parentSec
        
    def addSynapse(self, synapseName, synapseObj):
        """Add a synapese to the internal dictionary"""
        self.synapses[synapseName] = synapseObj
    
    def getSynapse(self, synapseName):
        """Return the synapse object"""
        if synapseName in self.synapses.keys():
            return self.synapses[synapseName]
        else:
            return None

        
if __name__ == "__main__":
    from spine import *
    from synapse import *
    from neuron import h
    import neuron
    from graph import *
    import numpy
    import pylab
    import os
    
    mod_path = "../mod"
    hoc_path = "../hoc"
        
    if not os.path.exists(mod_path) :
        print "ERROR mod path %s doesn't exist" %os.path.realpath(mod_path)
        sys.exit(1)
    neuron.load_mechanisms(mod_path)
    
    if not os.path.exists(hoc_path):
        print "ERROR hoc path %s doesn't exist" %os.path.realpath(hoc_path)
        sys.exit(1)
    
    # Hoc file assumes all the file are launched from a top directory
    head, tail  = os.path.split(hoc_path)
    print head, tail
    if head is not '':
        os.chdir(head)
    preface_pos = os.getcwd()
        
    h('strdef preface, dirstr') # preface and dirstr used in each hoc
    preface_string = "preface = \"" + preface_pos + "\""
    h(preface_string)
    h.load_file(os.path.join(tail, "all_tau_vecs.hoc"))
        
    print "Testing the spine. Current directory %s" %os.getcwd()
    spine1 = Spine("spine1", 
                   filename_bioch_mod ="biochemical_circuits/biomd183_noCalcium.eml")
    ampaSyn = Synapse('ampa', spine1.psd)
    ampaSyn.createStimul(start=30, number=10, interval=10, noise=0)
    spine1.addSynapse("ampa", ampaSyn)

    # Plotting stuff
    
    graph = Graph()
    vecs = {}
    vecs = graph.createVecs(vecs, spine1, "cai")
    vecs = graph.createVecs(vecs, spine1, "cali")
    
    vecsVolt = {}
    vecsVolt = graph.createVecs(vecsVolt, spine1, "v")
    
    
    import neuron.gui
    h.v_init = -87.75 # Setting the initial vm
    h.tstop = 1000
    h.run()
    
    graph.plotCalcium(vecs, "cai")
    graph.plotCalcium(vecs, "cali")
    graph.plotVoltage(vecsVolt, spine1.getSynapse('ampa').synVecs)
    pylab.show()