#!/usr/bin/env python
import neuron

h = neuron.h

soma = h.Section()
print "soma name: %s" %soma.name()
dend = h.Section()
print "dend name: %s" %dend.name()
soma.connect(dend)

stim = h.NetStim()

AMPA = neuron.new_point_process('AMPA')
ampa_syn1 = AMPA(dend, 0.5)

nc = h.NetCon(stim, ampa_syn1)

for s in h.allsec():
    h.psection()


