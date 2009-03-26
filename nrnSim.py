# Author: Michele Mattioni
# Tue Nov 11 11:54:40 GMT 2008

from neuron import h
import numpy
from spine import *
import os


class Event():
    """Event will be added to the cvode queue list"""
    def __init__(self, eventTime, cvode, nrnSim):
        self.eventTime = eventTime
        self.cvode = cvode
        self.fih = h.FInitializeHandler(1, self.callback)
        
    def callback(self, eventTime, nrnSim) :
        print "event at %f " %h.t
        self.cvode.event(self.eventTime, self.callback(eventTime, nrnSim))



class NeuronSim():
    """Class to control the NeuroSim"""
    def __init__(self, hoc_path="hoc", mod_path="mod"):
        self.gcw = os.getcwd()
        neuron.load_mechanisms(mod_path)
        h('strdef preface, dirstr') # preface and dirstr used in each hoc
        preface_string = "preface = \"" + self.gcw + "\""
        h(preface_string)
        h.load_file(os.path.join(hoc_path, "nacb_main.hoc"))
        
        h.load_file("stdrun.hoc") # loading the standard run NEURON system
        self.distributeSpines()
        os.chdir(self.gcw) # Revert back to the original working directory. 
        #(eCell change the cwd don't know why)
        
            
    def run(self, tStop):
        """Run the simulation until tStop"""
        h.tstop = tStop
        h.run()
            
    def init(self, v_init=-87.75):
        """Initialize the cell"""
        h.v_init = v_init
        
        
    def initAndRun(self, tStop):
        """Initialize and run the simulation until tStop""" 
        self.init()
        self.run(tStop)
    
    def distributeSpines(self):
        """Attach spines to the dendrites"""
        
        # Now just a test spine
        spine = Spine("spine1")
        spine.attach(h.MSP_Cell[0].dend1_1[1], 0.5, 0)
        self.spines = [spine]
    
    def updateSpines(self):
        "HERE WE UPDATE THE SPINE CALCIUM"
        for spine in self.spines:
            ca_from_NEURON = spine.vecs['ca'].x[-1] 
            spine.ecellMan.ca['Value'] = ca_from_NEURON 
            spine.ecellMan.ses.run(caSamplingInterval)
            print "Equilibrium for spine: %s, dend: %s, bio sim time: %f" % (spine.head.name(), 
                                                                     spine.parent.name(),
                                                                     spine.ecellMan.ses.getCurrentTime())    
    def usingVariableTimeStep(self):
        cvode = h.CVode()
        cvode.active(1)
        cvode.atol(0.0001)
        # Vector with the derivate
        #dstates = h.Vector()
        #cvode.dstates(dstates)
        return cvode

    def iClampExp(self):
        """Creating an IClamp in the soma"""
        # Creating an ICLAMP just for testing
        
        iClamp = h.IClamp(0.5, sec = h.MSP_Cell[0].soma)
        
        iClamp.delay = 100
        iClamp.dur = 500
        iClamp.amp = 0.2481
        
        return iClamp


# Test code


if __name__ == "__main__":
    import pylab
    import neuron.gui
    from neuron import h
    nrnSim = NeuronSim()
    cvode = nrnSim.usingVariableTimeStep()
    vecs = {}
    vecs['t'] = h.Vector()
    vecs['t'].record(h._ref_t)
    vecs['v_soma'] = h.Vector()
    vecs['v_soma'].record(h.MSP_Cell[0].soma(0.5)._ref_v)
    #h.load_file("../guiRig2.ses")
    iClamp = nrnSim.iClampExp()
    

    # The run 
#    nrnSim.init()
    nrnSim.initAndRun(800)
    pylab.plot(vecs['t'],vecs['v_soma'], label='v_soma')
    pylab.legend(loc=0)
    pylab.show()
    
    