# Author: Michele Mattioni
# Tue Nov 11 11:54:40 GMT 2008

import neuron
from neuron import h
import numpy
from spine import *
import os
import sys


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
        
        # Mod file are always in a mod directory
        if not os.path.exists(mod_path) :
            print "ERROR mod path %s doesn't exist" %os.path.realpath(mod_path)
            sys.exit(1)
        neuron.load_mechanisms(mod_path)
        
        if not os.path.exists(hoc_path):
            print "ERROR hoc path %s doesn't exist" %os.path.realpath(hoc_path)
            sys.exit(1)
        # Hoc file assumes all the file are launched from a top directory
        head, tail  = os.path.split(hoc_path)
        if head is not '':
            os.chdir(head)
            preface_pos = os.getcwd()
        else: 
            preface_pos = self.gcw
            
        h('strdef preface, dirstr') # preface and dirstr used in each hoc
        preface_string = "preface = \"" + preface_pos + "\""
        h(preface_string)
        h.load_file(os.path.join(tail, "nacb_main.hoc"))
        
        h.load_file("stdrun.hoc") # loading the standard run NEURON system
            
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
        self.spines = []
        # Now just a test spine
        i=1
        for i in xrange (9):
            spine = Spine("spine" + "-" + str(i))
            #spine.attach(h.MSP_Cell[0].dend1_1[1], 0.5, 0)
            spine.attach(h.MSP_Cell[0].dend3_1[1], i/10.0 , 0)
            self.createSynapses(spine)
            self.spines.append(spine)
    
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

    def iClampExp(self, delay=100, dur=500, amp=0.2375):
        """Creating an IClamp in the soma"""
        # Creating an ICLAMP just for testing
        
        iClamp = h.IClamp(0.5, sec = h.MSP_Cell[0].soma)
        
        iClamp.delay = delay
        iClamp.dur = dur
        iClamp.amp = amp
        
        return iClamp

    def createSynapses(self, spine):
        "Create an AMPA and an NMDA synapse in the spine"
        
        # AMPA Syn
        ampaSyn = Synapse('ampa', spine.psd)
        ampaSyn.createStimul(start=130, number=5, interval=2, noise=0)
        spine.addSynapse("ampa", ampaSyn)
        
        #NMDA Syn
        nmdaSyn = Synapse('nmda', spine.psd)
        nmdaSyn.createStimul(start=150, number=5, interval=2, noise=0)
        spine.addSynapse("nmda", nmdaSyn)

# Test code


def go(tstop):
    
    nrnSim.initAndRun(tstop)
    pylab.plot(vecs['t'],vecs['v_soma'], label='v_soma')
    pylab.legend(loc=0)
    pylab.show()

if __name__ == "__main__":
    import pylab
    import neuron.gui
    from neuron import h
    from synapse import Synapse
    nrnSim = NeuronSim(mod_path="../mod", hoc_path="../hoc")
    nrnSim.distributeSpines()
    
    # Create the synapses for all the spines
    
#    for spine in nrnSim.spines:
#    
#        # AMPA Syn
#        ampaSyn = Synapse('ampa', spine.psd)
#        ampaSyn.createStimul(start=130, number=10, interval=10, noise=0)
#        spine.addSynapse("ampa", ampaSyn)
#        
#        #NMDA Syn
#        nmdaSyn = Synapse('nmda', spine.psd)
#        nmdaSyn.createStimul(start=130, number=10, interval=10, noise=0)
#        spine.addSynapse("nmda", nmdaSyn)
    
    #cvode = nrnSim.usingVariableTimeStep()
    vecs = {}
    vecs['t'] = h.Vector()
    vecs['t'].record(h._ref_t)
    vecs['v_soma'] = h.Vector()
    vecs['v_soma'].record(h.MSP_Cell[0].soma(0.5)._ref_v)
    h.dt =0.005
    h.v_init =(-87.75)
    
    #go(100) # Just a way to advance the simulator and get the plot back
    

    # The run
     

    
    