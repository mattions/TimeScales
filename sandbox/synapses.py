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

stim.number = 50
stim.start = 5
stim.noise = 0

def insertTestSyn():
    syn = h.Exp2Syn(0.5, sec = dend)
    syn.tau1 = 3 # rise time
    syn.tau2 = 15 # decay time
    syn.e = -60 # reversal potential
    return syn

def insertAMPASyn():
    ampa = h.AMPA(0.5, sec = dend)
    return ampa

#syn = insertTestSyn()
ampa = insertAMPASyn()

nc = h.NetCon(stim, ampa)
nc.weight[0] = 1
input_vec = h.Vector()


# vector
t = h.Vector()
t.record(h._ref_t)

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
v_soma = numpy.array(v_soma_vec)
v_dend = numpy.array(v_dend_vec)

#plot
plot(t,v_soma, label = "soma")
plot(t,v_dend, label = "dend")
legend()
show()





#figure()
#plot(t,input, label = "input")



