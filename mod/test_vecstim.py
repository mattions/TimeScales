from neuron import h
import neuron.gui

soma = h.Section(name='soma')
soma.insert('hh')
ampa = h.AMPA(0.5, sec=soma)
ampa.gbar = 1 # Just increasing, for testing purpose

expSyn = h.ExpSyn(0.5, soma)
expSyn.e = 10
expSyn.i = 3
expSyn.tau = 3

vecStim = h.VecStim()
vec = h.Vector([1, 2])
vecStim.play(vec)

vecStim2 = h.VecStim()
vec2 = h.Vector([1, 2])
vecStim2.play(vec2)

netCon = h.NetCon(vecStim, ampa)
netCon.weight[0] = 1
netCon2 = h.NetCon(vecStim2, expSyn)
netCon2.weight[0] = 1

