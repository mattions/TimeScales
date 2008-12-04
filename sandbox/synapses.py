#!/usr/bin/env python
import neuron
import numpy
from pylab import *

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

def insertTestSyn():
    syn = h.Exp2Syn(0.5, sec = dend)
    syn.tau1 = 3 # rise time
    syn.tau2 = 15 # decay time
    syn.e = 0 # reversal potential
    return syn

def insertAMPASyn():
    ampa = h.AMPA(0.5, sec = dend)
    return ampa

syn = insertTestSyn()
#ampa = insertAMPASyn()

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





def run(tStop, initialized):
    """Run the simulation untill tStop"""
    if not initialized: 
        h.finitialize(-87.75)
        initialized = True
    
    while (h.t < tStop):
        h.fadvance()




for s in h.allsec():
    h.psection()




# run
initialized = False
run (1000, initialized)

#=+++++++++ Plotting ++++++++=#

# Transforming the vecotr in numpy
t = numpy.array(t_vec)
t = numpy.round(t, decimals=9) # round

v_soma = numpy.array(v_soma_vec)
v_dend = numpy.array(v_dend_vec)
inputs = numpy.array(inputs_vec)



def inputsGraph(t, inputs):
    
    inputs_event = numpy.zeros_like(t)
    for indx, x in enumerate (t):
        for y in inputs:
            if x == y:
                inputs_event[indx] = 1
    masked = numpy.ma.masked_where(inputs_event == 0, inputs_event)
    #figure()
    plot(t, masked, 'ro')

    
#plot
figure()
plot(t,v_soma, label = "soma")
legend()
figure()
plot(t,v_dend, label = "dend")
legend()

inputsGraph(t, inputs)
show()





#figure()
#plot(t,input, label = "input")



