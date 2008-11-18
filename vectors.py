# Useful vector to measure things

import numpy
from pylab import *
from neuron import h

time = h.Vector()
time.record(h._ref_t)

ca_in_s = h.Vector()
ca_in_s.record(h.MSP_Cell[0].soma(0.5)._ref_cai)

ca_in_d = h.Vector()
ca_in_d.record(h.MSP_Cell[0].dend1_1[0](0.5)._ref_cai)

