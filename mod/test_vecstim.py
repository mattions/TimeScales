from neuron import h
import neuron.gui

soma = h.Section(name='soma')
soma.insert('hh')


ampa = h.AMPA(0.5, sec=soma)
#ampa.gbar = 1 # Just increasing, for testing purpose
nmda = h.NMDA(0.5, sec=soma)



vecStim = h.VecStim()
vec = h.Vector([2])
vecStim.play(vec)

# vecStim2 = h.VecStim()
# vec2 = h.Vector([1])
# vecStim2.play(vec2)

netCon = h.NetCon(vecStim, ampa)
netCon.weight[0] = 1
# netCon2 = h.NetCon(vecStim2, nmda)
# netCon2.weight[0] = 1

