# Author: Michele Mattioni
# Mon Jan 26 05:54:30 GMT 2009

from neuron import h, nrn
import ecellControl as eC
import math
import os
from synapse import Synapse
import math


class mySection(nrn.Section):
    """Extend the Section object with the overriding then name"""
    def __init__(self, id):
        nrn.Section.__init__(self)
        sec = h.Section()
        self.id = id

class Spine():
    """Class spine. Create a spine with head and neck"""
    
    def __init__(self, id, filename_bioch_mod="../biochemical_circuits/biomd183_noCalcium.eml"):
        """ Create a spine with a standard volume of ~0.11 um
        the h is the reference to the main hoc interpreter"""
        self.id = id
        self.neck = self.createNeck()
        self.head = self.createHead(self.neck)
        self.psd = self.createPSD(self.head)
        self.parent = None # the parent section connected to the neck
        self.synapses = self.createSynapses() # Dict to save the pointer to the synapses
        
        # Setting up the biochemical simulator
        #self.ecellMan = self.setupBioSim(filename_bioch_mod)
        
    def setupBioSim(self, filename):
        """Initialize the Biochemical Simulator creating the instance of 
        the object to control the simulation"""
        
        ecellMan = eC.EcellManager(filename)
        ecellMan.createLoggers()
        return ecellMan
        
    def createNeck(self):
        """ Create the neck with the Grunditz value"""
        neck = mySection(self.id + "_neck")
        neck.nseg = 3
        neck.L = 1.5 # um
        neck.diam = 0.1
        #neck.Ra = 150.0 # Used by Grunditz et al 2008 (see supplemental material)
        neck.Ra = 100.0 #
        
        neck.insert("pas")
        
        h.factors_catrack() # Called on the NMOD catrack
        neck.insert("catrack")
        
        h.factors_caltrack() # Called on the NMOD caltrack
        neck.insert("caltrack") 
                
        return neck
        
    def createHead(self, neck):
        """Create the head of the spine and populate it with the right channels"""
        head = mySection(self.id + "_head")
        vol = 0.11 #um
        head.L = 1
        head.diam = math.sqrt(vol / head.L * math.pi ) * 2
        self.Ra = 150.0
        head.nseg = 7
        head.connect(neck)
        
        head.insert("pas")
        head.insert("can")
        head.insert("caq")
        head.insert("car")
        head.insert("skkca")

        h.factors_caltrack()
        head.insert("caltrack")
        
        h.factors_catrack()
        head.insert("catrack")
        
        return head
    
    def createPSD(self, head):
        """Create the Post Synaptic Density of the spine to model the different \
        location of the different channel"""
        psd = mySection(self.id + "_psd")
        psd.L = 0.05        # um, Holmes & Levy 1990
        psd.diam = 0.5      # Wilson 1998 (Shepherd book)
        psd.Ra =100
        psd.connect(head)
        
        psd.insert("caL13")
        psd.insert("caL")
        psd.insert("rubin")
        
        h.factors_catrack()
        psd.insert("catrack")
        h.factors_caltrack()
        psd.insert("caltrack")
        
        return psd
        
    def createSynapses(self):
        "Create an AMPA and an NMDA synapse in the spine"
        synapses = {}
        # AMPA Syn
        
        ampaSyn = Synapse('ampa', self.psd)
        ampaSyn.createStimul()
        synapses['ampa'] = ampaSyn
        
        #NMDA Syn
        nmdaSyn = Synapse('nmda', self.psd)
        nmdaSyn.createStimul()
        synapses['nmda'] = nmdaSyn
        
        return synapses    
    
    def attach(self, parentSec, parentx, childx):
        """Attach a spine to a parentSec and store the parentSec into an attribute.
        Just an handy variation of the connect method"""
        self.neck.connect(parentSec, parentx, childx)
        self.parent = parentSec
    
    def calcAreaSpine(self):
        """Calculate the surface of the spine"""
        surface_neck_cyl = 2 * math.pi * (self.neck.diam/2) * (self.neck.diam/2 + self.neck.L)
        surface_head_cyl = 2 * math.pi * (self.head.diam/2) * (self.head.diam/2 + self.head.L)
        tot_surf = surface_head_cyl + surface_neck_cyl
        
        return tot_surf
        
if __name__ == "__main__":
    from spine import *
    from synapse import *
    from neuron import h
    import neuron
    from helpers import graph
    import numpy
    import pylab
    import os
    
    mod_path = "../mod"
    hoc_path = "../hoc"
        
        # Mod file are always in a mod directory
    if not os.path.exists(mod_path) :
        print "ERROR mod path %s doesn't exist" %os.path.realpath(mod_path)
        sys.exit(1)
    neuron.load_mechanisms(mod_path)
    
    if not os.path.exists(hoc_path):
        print "ERROR hoc path %s doesn't exist" %os.path.realpath(hoc_path)
        sys.exit(1)
    # Hoc file assumes all the file are launched from a top directory
    head, tail  = os.path.split(os.path.realpath(hoc_path))

    preface_pos = head
    
    h('strdef preface, dirstr') # preface and dirstr used in each hoc
    preface_string = "preface = \"" + preface_pos + "\""
    h(preface_string)
    h.load_file(os.path.join(hoc_path, "all_tau_vecs.hoc"))
        
    print "Testing the spine. Current directory %s" %os.getcwd()
    spine1 = Spine("spine1", 
                   filename_bioch_mod ="../biochemical_circuits/biomd183_noCalcium.eml")
    
    # AMPA Syn
    ampaSyn = spine1.synapses['ampa']
    ampaSyn.netStim.start = 200
    ampaSyn.netStim.number = 1
    ampaSyn.netStim.interval = 5
    ampaSyn.netStim.noise = 0
    
    #NMDA Syn
    

    # Plotting stuff
    
    graph = graph.Graph()
    vecs = {}
    vecs = graph.createVecs(vecs, spine1, "cai")
    vecs = graph.createVecs(vecs, spine1, "cali")
    
    vecsVolt = {}
    vecsVolt = graph.createVecs(vecsVolt, spine1, "v")
    
    
    import neuron.gui
    h.v_init = -87.75 # Setting the initial vm
    h.dt = 0.005
    
    h.tstop = 400
    h.run()
    graph.plotCalcium(vecs, "cai")
    graph.plotCalcium(vecs, "cali")
    graph.plotVoltage(vecsVolt, spine1.synapses['ampa'].synVecs)
    pylab.title("AMPA syn")
    graph.plotVoltage(vecsVolt, spine1.synapses['nmda'].synVecs)
    pylab.title("NMDA syn")
    pylab.show()