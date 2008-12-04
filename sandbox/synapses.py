#!/usr/bin/env python
import neuron
import numpy
from pylab import *



def insertTestSyn():
    syn = h.Exp2Syn(0.5, sec = dend)
    syn.tau1 = 3 # rise time
    syn.tau2 = 15 # decay time
    syn.e = 0 # reversal potential
    return syn

def insertAMPASyn():
    ampa = h.AMPA(0.5, sec = dend)
    return ampa
def insertMyExp2Syn():
    syn = h.my_exp2syn(0.5, sec = dend)
    print "Inserted syn: tau1 %f tau2 %f e %f" %(syn.tau1, syn.tau2, syn.e)
    return syn

def initialize(initVm=-87.75):
    h.finitialize(initVm)
    print h.t 

def run(interval):
    """Run the simulation untill tStop"""
    tStart = h.t # current Neuron Time
    print "tStart: %f interval: %f tStop: %f" %(tStart, interval, tStart + interval) 
    while (h.t < (tStart + interval) ):
        h.fadvance()
        
        
# run
def testExperiment():
    initialize()
    run (50)
    # change the weight of the synapses
    nc.weight[0] = 0.1
    run(50)

#=+++++++++ Plotting ++++++++=#

def plotVecs():
    """Transform the vectors in numpy array and display it"""
    
    
    # Transforming the vecotr in numpy
    t = numpy.array(t_vec)
    t = numpy.round(t, decimals=9) # round
    
    v_soma = numpy.array(v_soma_vec)
    v_dend = numpy.array(v_dend_vec)
    inputs = numpy.array(inputs_vec)
    #plot
    figure()
    plot(t,v_soma, label = "soma")
    legend(loc = 'lower right')
    figure()
    plot(t,v_dend, label = "dend")
    inputsGraph(t, inputs)
    legend(loc = 'lower right')
    show()

def inputsGraph(t, inputs):
    """Create a vector of the inputs given to the synapse"""
    
    inputs_event = numpy.zeros_like(t)
    for indx, x in enumerate (t):
        for y in inputs:
            if x == y:
                inputs_event[indx] = 1
    masked = numpy.ma.masked_where(inputs_event == 0, inputs_event)
    #figure()
    plot(t, masked, 'r|', label = "stimul")

    
#plot(t,input, label = "input")

if __name__ == "__main__":
    h = neuron.h

    soma = h.Section()
    print "soma name: %s" %soma.name()
    dend = h.Section()
    print "dend name: %s" %dend.name()
    soma.connect(dend)
    
    stim = h.NetStim()
    
    stim.number = 10
    stim.start = 5
    stim.noise = 0
    syn = insertTestSyn()
    #syn = insertAMPASyn()
    #syn = insertMyExp2Syn()

    nc = h.NetCon(stim, syn)
    nc.weight[0] = 0.01
    inputs_vec = h.Vector()
    nc.record(inputs_vec)
    
    
    # vector
    t_vec = h.Vector()
    t_vec.record(h._ref_t)
    
    v_soma_vec = h.Vector()
    v_soma_vec.record(soma(0.5)._ref_v)
    
    
    v_dend_vec = h.Vector()
    v_dend_vec.record(dend(0.5)._ref_v)
    
    
    testExperiment()
    plotVecs()


