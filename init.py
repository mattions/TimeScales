# This file load the simulation with the python interface
# Usage: open ipython shell and the run the file

import neuron
import numpy
from pylab import *
h = neuron.h

class MyNetStim(neuron.hclass(h.NetStim)):
    """NetStim that allows setting the parameters on the creation"""
    
    def __init__(self, start=50, noise=0, interval=10, number=10):
        self.start = start
        self.interval = interval
        self.noise = noise
        self.number = number
    
    def printPars(self):
        print "Start: %d\tInterval:%d\tNoise:%d\tNumber:%d" %(self.start, self.interval,
                                                              self.noise, self.number)

h.load_file("my_init.hoc")

#def createSpine():
#    """ Create a spine"""
#    import spine
#    spine = spine.Spine(h)
#    return spine

#def createSpine():
#    """Create a spine"""
#    spine = h.Section()
#    # Volume of a spine ~ 0.11 um 
#    # dia = (sqrt (V/(pi*h))) * 2
#    spine.L = 1
#    spine.diam =  0.3742
#    debug = True
#    if debug:
#        import math
#        vol = spine.L * (spine.diam/2) * (spine.diam/2) * math.pi
#        print "Volume of the spine %f" % vol
#    
#    return spine

#def createAMPASyn(section, position=0.5):
#    """Insert an ampa synapse in the section
#    
#    return syn dictionary where there are:
#    stim -> MyNetStim class
#    ampa -> h.ampa class
#    nc -> h.NetCon class"""
#    
#    syn = {}
#    syn["netStim"] = h.NetStim()
#    syn["netStim"].number = 10
#    syn["netStim"].start = 50
#    syn["netStim"].noise = 0
#    
#    syn["syn"] = h.ampa(position, sec = section)
#    
#    syn["netCon"] = h.NetCon(syn["netStim"], syn["syn"])
#    syn["netCon"].weight[0] = 10
#    
#    return syn

#def createSynapseVecs(syn):
#    """Create the vector to measure the activity of the synapse"""
#    
#    synVecs = {}
#    synVecs["stimul"] = h.Vector()
#    syn["netCon"].record(synVecs["stimul"]) # Record the input 
#    
#    synVecs["i"] = h.Vector()
#    synVecs["i"].record(syn["syn"]._ref_i)
#    
#    return synVecs

def stimulGraph(t, stimul):
    """Create a vector of the inputs given to the synapse"""
        # Transforming the vecotr in numpy
    t = numpy.array(t)
    t = numpy.round(t, decimals=9) # round
    
    inputs_event = numpy.zeros_like(t)
    for indx, x in enumerate (t):
        for y in stimul:
            if x == y:
                inputs_event[indx] = 1
                
    masked = numpy.ma.masked_where(inputs_event == 0, inputs_event)
    #figure()
    #return masked
    plot(t, masked, 'k.', label = "stimul")   
    

from spine import *   
spine = Spine()
spine.connect(h.MSP_Cell[0].dend1_1[0], 0.5, 0)

ampa = spine.createAMPASyn()
synVecs = spine.createSynapseVecs(ampa)



####### RIG 

def createVecs(spine):
    """Spine taken as an argument. This has to change somehow"""
    
    vecs = {}
    
    vecs["t"] = h.Vector()
    vecs["t"].record(h._ref_t)
    
    vecs["v_soma"] = h.Vector()
    vecs["v_soma"].record(h.MSP_Cell[0].soma(0.5)._ref_v)
    
    vecs["ca_soma"] = h.Vector()
    vecs["ca_soma"].record(h.MSP_Cell[0].soma(0.5)._ref_cai)
    
    vecs["ca_dend"] = h.Vector()
    vecs["ca_dend"].record(h.MSP_Cell[0].dend1_1[0](0.5)._ref_cai)

    vecs["v_dend"] = h.Vector()
    #vecs["v_dend"].record(spine.parent(0.5)._ref_v)
    vecs["v_dend"].record(h.MSP_Cell[0].dend1_1[0](0.5)._ref_v)
    
    vecs["v_spine"] = h.Vector()
    vecs["v_spine"].record(spine(0.5)._ref_v)
    
    return vecs
    
    
def plotVoltage(vecs, synVecs):
    fig = figure()
    ax1 = fig.add_subplot(111) #sub for the two scales
    plot(vecs["t"], vecs["v_soma"], label="soma voltage")
    plot(vecs["t"], vecs["v_dend"], label="dendrite voltage")
    plot(vecs["t"], vecs["v_spine"], label="spine voltage")
    ylabel("voltage [mV]")
    xlabel("time [ms]")
    ax2 = ax1.twinx()
    stimulGraph(vecs["t"], synVecs["stimul"])
    ax2.set_ylim(0,4)
    ax2.set_axis_off()
    t = numpy.array(vecs["t"])
    t = numpy.round(t, decimals=9) # round
    ax1.set_xlim(t[0],t[-1])
    ax1.legend(loc=0)
    return ax1 # No really needed but handy

import neuron.gui
h.load_file("guiRig2.ses")


vecs = createVecs(spine)
h.run()

plotVoltage(vecs, synVecs)
show()
