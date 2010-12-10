from neuron import h
import neuron.gui

soma = h.Section(name='soma')
soma.insert('hh')
ampa = h.AMPA(0.5, sec=soma)
ampa.gbar = 1 # Just increasing, for testing purpose

vecStim = h.VecStim()
vec = h.Vector([1, 2])

vecStim.play(vec)

netCon = h.NetCon(vecStim, ampa)
netCon.weight[0] = 1
