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
        spine_positions = [0.1, 0.3, 0.5, 0.7, 0.9]
        self.populateDend(spine_positions, h.MSP_Cell[0].Dist_Dend)
        
        #spine_positions = [0.5]
        #self.populateDend(spine_positions, [h.MSP_Cell[0].dend3_1[1]])

        # Mid
#        print "Adding the Mid spines"
        spine_positions = [0.3, 0.7]
        self.populateDend(spine_positions, h.MSP_Cell[0].Mid_Dend)
    
    def populateDend(self, spine_positions, dendList):
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


# Test code


def iClampExp(tstop):
    """Test the Iclamp model"""
    import pylab
    import neuron.gui
    from neuron import h
    print "Test the IClamp one, no spines"
    hoc_path = "../hoc"
    nrnSim = NeuronSim(mod_path="../mod", hoc_path=hoc_path)
    vecs = {}
    vecs['t'] = h.Vector()
    vecs['t'].record(h._ref_t)
    vecs['v_soma'] = h.Vector()
    vecs['v_soma'].record(h.MSP_Cell[0].soma(0.5)._ref_v)
    vecs['v_dend'] = h.Vector()
    vecs['v_dend'].record(h.MSP_Cell[0].dend1_1[0](0.5)._ref_v)
    h.v_init =(-87.75)
    
    # Reverting to the old dimensions Used in the paper with no spines.
    # in the case we changed that
    for sec in h.MSP_Cell[0].Mid_Dend:
        sec.L= 24.23
        #sec.L= 15.0
        sec.diam = 1.10
    
    for sec in h.MSP_Cell[0].Dist_Dend:
        sec.L= 395.2
        #sec.L=390.0
        sec.diam = 0.72
    
    
    h.load_file(os.path.join(hoc_path,"iclamp_0.248.ses"))
    h.tstop = tstop
    h.run()
    print "Only the model with no spines attached"
    print "Reproduce the result on the Wolf 2005 paper"
    nrnSim.vecs = vecs
    nrnSim.h = h # Hoc Interpreter
    
    pylab.plot(nrnSim.vecs['t'], nrnSim.vecs['v_soma'])
    pylab.xlabel("Time [s]")
    pylab.ylabel("Voltage [mV]")
    pylab.title("iclamp exp 0.248 nA -- no spines -- No Correction")
    pylab.show()
    
    return nrnSim
    
def testDistSpines(tstop, batch, amplitude):
    """Test the distribution of the spines in the model."""
    if not batch:
        import neuron.gui
    else:
        import ecellControl.ioHelper as ioHelper
    from graph import Graph
    from neuron import h
    if batch:
        import matplotlib
        matplotlib.use('Agg')
        print "Switching backend to Agg. Batch execution"    
    import pylab
    
    hoc_path = "../hoc"
    nrnSim = NeuronSim(mod_path="../mod", hoc_path=hoc_path)
    nrnSim.distributeSpines()
    vecs = {}
    vecs['v_soma'] = h.Vector()
    vecs['v_soma'].record(h.MSP_Cell[0].soma(0.5)._ref_v)
    g = Graph()
    spine = nrnSim.spines[0] #Grabbing the first one for testing
    vecs = g.createVecs(vecs, spine, "v")
    h.dt =0.005
    h.v_init =(-87.75)
    iclamp = nrnSim.iClampPointProcess(amp=amplitude)
    print "iClamp point processes created: amp: %f, delay: %f, duration: %f" %(iclamp.amp, iclamp.delay, iclamp.dur)
    
    g.vecs = vecs # Vectors dict
    nrnSim.g = g # Plotting facilities object
    nrnSim.h = h # Pointer to the hoc Intepreter
    nrnSim.iclamp = iclamp # To return the point process 
    
    if not batch:
        h.load_file(os.path.join(hoc_path, "runControl_somaVoltage.ses"))
        h.tstop = tstop
        
    else:
        # Execution on the Cluster with no display.
        h.tstop = tstop
        h.run()
        g.plotVoltage(vecs)
        pylab.title("iClamp_%s" % iclamp.amp)
        figureName = "iClamp_%s.png" % iclamp.amp
        ioH = ioHelper.IOHelper()
        g.vecs = ioH.convertToNumpy(g.vecs)
        dir = ioH.saveObj(g, "graphObj.bin")
        pylab.savefig(os.path.join(dir,figureName))
        print "figure Saved in %s" %os.path.realpath(os.path.join(dir,figureName))
        logGeometry(dir, nrnSim)
        
    return nrnSim

def logGeometry(dir, nrnSim):
    
    logFile = os.path.join(dir, 'log.txt')
    f = open(logFile, 'w')
    #Prox Dend
    f.write("Prox_Dend\n")
    for i,s in enumerate(nrnSim.h.MSP_Cell[0].Prox_Dend):
        line = "%d %f %f\n" %(i, s.L, s.diam)
        f.write(line)
    
    #Mid Dend
    f.write("Mid_Dend\n")
    for i,s in enumerate(nrnSim.h.MSP_Cell[0].Mid_Dend):
        line = "%d %f %f\n" %(i, s.L, s.diam)
        f.write(line)
    
    #Dist Dend
    f.write("Dist_Dend:\n")
    for i,s in enumerate(nrnSim.h.MSP_Cell[0].Dist_Dend):
        line = "%d %f %f\n" %(i, s.L, s.diam)
        f.write(line)
    #Spine
    f.write("Number of spines: %d\n" %len(nrnSim.spines))
    for spine in nrnSim.spines:
        line = "%s \n" %(spine.name)
        f.write(line)
        
    print "Log written in %s" %os.path.realpath(logFile)

def testSpineInput():
    
    nrnSim.iclamp = None
    spine1 = nrnSim.spines[0]
    ampa = spine1.synapses['ampa']
    ampa.netStim.start = 60
    ampa.netStim.number = 1
    print spine1.name
    h.run()
    nrnSim.g.plotVoltage(nrnSim.g.vecs)
    return spine1
    
    
    
if __name__ == "__main__":
    from optparse import OptionParser
    usage= "usage: %prog [options] tstop"
    parser = OptionParser(usage)
    parser.add_option("-b", "--batch", action="store_true", default=False, 
                      help= "Run in batch mode. No gui is shown")
    
    parser.add_option("-a", "--amplitude", default=0.248, 
                  help= "The intensity of the iClamp experiment. Default is 0.248")
    
    parser.add_option("-n", "--nospines", action="store_true", default=False, 
                  help= "Run the test without spines in the neuron")
    
    
    (options, args) = parser.parse_args()
    
    if len(args) != 1:
        parser.error("Incorrect number of arguments")
        parser.usage()
    else:
        tstop = float (args[0])
        
    if options.nospines:
        nrnSim = iClampExp(tstop)
    else:
        nrnSim = testDistSpines(tstop, batch=options.batch, amplitude=options.amplitude)
        #spine = testSpineInput()
    
