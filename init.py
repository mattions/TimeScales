# This file load the simulation with the python interface
# Usage: open ipython shell and the run the file


import neuron

h = neuron.h

h.load_file("my_init.hoc")

####### RIG 



t = h.Vector()
t.record(h._ref_t)
print "Created vectors t"

v_soma = h.Vector()
v_soma.record(h.MSN[0].soma(0.5)._ref_v)
print "Created vectors v_soma"

ca_in_s = h.Vector()
ca_in_s.record(h.MSN[0].soma(0.5)._ref_cai)
print "Created vectors ca_in_s"

ca_in_d = h.Vector()
ca_in_d.record(h.MSN[0].dend1_1[0](0.5)._ref_cai)


import neuron.gui
#h.load_file("guiRig.ses")

