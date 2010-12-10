from neuron import h
import neuron.gui

soma = h.Section(name='soma')
soma.insert('hh')
ampa = h.AMPA(0.5, sec=soma)
ampa.gbar = 1 # Just increasing, for testing purpose

#expSyn = h.ExpSyn(0.5, soma)
#expSyn.e = 10
#expSyn.i = 3
#expSyn.tau = 3

netStim = h.NetStim()
netStim.start = 1
netStim.interval= 1 
netStim.number = 3

netCon = h.NetCon(netStim, ampa)
#netCon = h.NetCon(netStim, expSyn)
netCon.weight[0] = 1 

