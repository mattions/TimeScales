# This file load the simulation with the python interface
# Usage: open ipython shell and the run the file

import numpy
from pylab import *
import neuron

h = neuron.h

h.load_file("baseline_values.txt")
#h('load_file("msp_template.hoc")')
h('load_file("all_tau_vecs_mod.hoc")')
h.load_file("MSN_cell.hoc")
#h.load_template("msp_template2.hoc")


h('load_file("IClamp.ses")')

####### RIG 



t = h.Vector()
t.record(h._ref_t)
print "Created vectors t"

v_soma = h.Vector()
v_soma.record(h.soma(0.5)._ref_v)
print "Created vectors v_soma"

ca_in_s = h.Vector()
ca_in_s.record(h.soma(0.5)._ref_cai)
print "Created vectors ca_in_s"

ca_in_d = h.Vector()
#ca_in_d.record(h.MSP_Cell[0].dend1_1[0](0.5)._ref_cai)


