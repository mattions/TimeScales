from neuron import h
import neuron.gui
soma = h.Section(name='soma')
soma.insert('hh')
ampa = h.AMPA(0.5, sec=soma)
netStim = h.NetStim()
netStim.start = 1
netStim.interval= 1 
netStim.number = 3
#vecStim = h.VecStim()
#vec = h.Vector(3)
#vec.printf()
#vec.indgen()
#vec.printf()
netCon = h.NetCon(netStim, ampa)
netCon.weight[0] = 1 
#vecStim.play(vec)
#vecStim.play(vec)
