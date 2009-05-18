# Author: Michele Mattioni
# Tue Nov 11 11:54:40 GMT 2008

import neuron
from neuron import h
import numpy
from spine import *
import os
import sys
from synapse import Synapse


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
        head, tail  = os.path.split(os.path.realpath(hoc_path))

        preface_pos = head
        
        h('strdef preface, dirstr') # preface and dirstr used in each hoc
        preface_string = "preface = \"" + preface_pos + "\""
        h(preface_string)
        h.load_file(os.path.join(hoc_path, "nacb_main.hoc"))
        
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
        
        # Distal:
        spine_positions = [0.1, 0.21, 0.23, 0.25, 0.27, 0.29, 0.30, 0.50, 0.7]
        self.populateDend(spine_positions, h.MSP_Cell[0].Dist_Dend)
        
        #spine_positions = [0.5]
        #self.populateDend(spine_positions, [h.MSP_Cell[0].dend3_1[1]])

        # Mid
        print "Adding the Mid spines"
        spine_positions = [0.3, 0.7, 0.9]
        self.populateDend(spine_positions, h.MSP_Cell[0].Mid_Dend)
    
    def populateDend(self, spine_positions, dendList):
        """Distribuete the psines among the dends"""
        
        for sec in dendList :
            for pos in spine_positions:
                tmpName = sec.name()
                tmpName = tmpName.split('.')[1] # Get rid of the MSP_Cell[0] prefix
                spine = Spine("spine" + "-" + tmpName + "-" + str(pos))
                spine.attach(sec, pos, 0) # Attaching the spine in the right pos
                self.spines.append(spine)
                print "Addedd spine: %s" %spine.name
                
    def updateSpines(self):
        "HERE WE UPDATE THE SPINE CALCIUM"
        for spine in self.spines:
            ca_from_NEURON = spine.vecs['ca'].x[-1] 
            spine.ecellMan.ca['Value'] = ca_from_NEURON 
            spine.ecellMan.ses.run(caSamplingInterval)
            print "Equilibrium for spine: %s, dend: %s, bio sim time: %f" % (spine.head.name(), 
                                                                     spine.parent.name(),
                                                                     spine.ecellMan.ses.getCurrentTime())    
    
    def iClampPointProcess(self, delay=100, dur=500, amp=0.2480):
        """Creating an IClamp in the soma"""
        # Creating an ICLAMP just for testing
        
        iClamp = h.IClamp(0.5, sec = h.MSP_Cell[0].soma)
        
        iClamp.delay = delay
        iClamp.dur = dur
        iClamp.amp = amp
        
        return iClamp