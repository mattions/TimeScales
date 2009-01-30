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
    
####### RIG 

def createVecs(spine):
    """Spine taken as an argument. This has to change somehow"""
    
    vecs = {}
    
    vecs["t"] = h.Vector()
    vecs["t"].record(h._ref_t)
    
    vecs["v_soma"] = h.Vector()
    vecs["v_soma"].record(h.MSP_Cell[0].soma(0.5)._ref_v)
    
    vecs["cai_soma"] = h.Vector()
    vecs["cai_soma"].record(h.MSP_Cell[0].soma(0.5)._ref_cai)
    
    vecs["cai_dend"] = h.Vector()
    vecs["cai_dend"].record(spine.parent(0.5)._ref_cai)

    vecs["v_dend"] = h.Vector()
    vecs["v_dend"].record(spine.parent(0.5)._ref_v)
    
    vecs["v_spine"] = h.Vector()
    vecs["v_spine"].record(spine(0.5)._ref_v)
    
    return vecs
    
    
def plotVoltage(vecs, synVecs):
    fig = figure()
    ax1 = fig.add_subplot(111) #sub for the two scales
    plot(vecs["t"], vecs["v_soma"], label="soma voltage")
    plot(vecs["t"], vecs["v_dend"], label="dendrite voltage")
    plot(vecs["t"], vecs["v_spine"], label="spine voltage")
    ylabel("Voltage [mV]")
    xlabel("Time [ms]")
    ax2 = ax1.twinx()
    stimulGraph(vecs["t"], synVecs["stimul"])
    ax2.set_ylim(0,4)
    ax2.set_axis_off()
    t = numpy.array(vecs["t"])
    t = numpy.round(t, decimals=9) # round
    ax1.set_xlim(t[0],t[-1])
    ax1.legend(loc=0)
    return ax1 # No really needed but handy

def plotCalcium(vecs):
    figure()
    plot(vecs["t"], vecs["cai_soma"], label = "soma")
    plot(vecs["t"], vecs["cai_dend"], label = "dend")
    xlabel("Time [ms]")
    ylabel("Concentration [mM]")
    legend(loc=0)
        
def go():
    """Just run the model for the time"""
    h.run()
    plotVoltage(vecs, synVecs)
    plotCalcium(vecs)
    show()



if __name__ == "__main__":
    
    h.load_file("my_init.hoc")
    from spine import *   
    spine = Spine()
    spine.attach(h.MSP_Cell[0].dend1_1[1], 0.5, 0)
    ampa = spine.createAMPASyn()
    synVecs = spine.createSynapseVecs(ampa)
    
    import neuron.gui
    h.load_file("guiRig2.ses")
    
    vecs = createVecs(spine)
    
    ampa["netCon"].weight[0] = 1000