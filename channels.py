#!/usr/bin/evn python

import neuron
import numpy
from pylab import *

h = neuron.h

soma = h.Section()
soma.insert('pas')

t_vec = h.Vector()
v_soma_vec = h.Vector()

t_vec.record(h._ref_t)
v_soma_vec.record(soma(0.5)._ref_v)

h.finitialize(-87.75)

def run(tStop):
    """Run the simulation untill tStop"""
    while (h.t < tStop):
        h.fadvance()

def plotVecs(t_vec, v_soma_vec):
    t = numpy.array(t_vec)
    v_soma = numpy.array(v_soma_vec)
    return t, v_soma


run(100)
t, v_soma = plotVecs(t_vec, v_soma_vec)
plot(t, v_soma)