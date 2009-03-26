#!/usr/bin/evn python

import neuron
import numpy
from pylab import *

h = neuron.h

soma = h.Section()

h.load_file('all_tau_vecs_mod.hoc')

# Membrane mech present in all the section
mechs = [
         'pas', # done
         'naf', # done
         'nap', # done
         'kir', # done
         'kas', # done
         'kaf', # done
         #'krp', # done
         #'bkkca', # done
         #'skkca', # done
         #'caldyn', # pump set in NMOL
         #'caL',  #done
         #'caL13', #done
         #'can', # done
         #'caq', # done
         #'car', # done
         #'cat' # done
         ]


# Inserting the mechanism in all the section
for sec in h.allsec():
    
    for mec in mechs:
        sec.insert(mec)
        
    # Value common for all the section
    
    sec(0.5).pas.g =  1.15e-5 # S/cm2
    sec(0.5).pas.e = -70 # mV
    sec(0.5).kir.gkbar = 0.00015 # S/cm2
#            sec(0.5).bkkca.gkbar = 0.001 # S/cm2
#            sec(0.5).skkca.gkbar = 0.145
#            sec(0.5).can.pbar = 1.0e-5 # cm/s
#            sec(0.5).caq.pcaqbar = 6.0e-6 # cm/s
#            sec(0.5).car.pcarbar = 2.6e-5 # cm/s
#            sec(0.5).cat.pcatbar = 4e-7 # m/s
#            sec(0.5).caL.pbar = 6.7e-6 # cm/s
#            sec(0.5).caL13.pcaLbar = 4.25e-7 # cm/s


# Soma Only
#        self.soma.insert('krp') # Inserting this only in the soma.
#        self.soma(0.5).krp.gkbar = 0.001 # 0.004 # S/cm2

soma(0.5).naf.gnabar = 1.5 # S/cm2
soma(0.5).nap.gnabar = 4e-5 # S/cm2
soma(0.5).ek = -90
# Dends only
#allDends = []
#somaAndProx = [self.soma]
#midAndDist = []
#for branch in self.branches: 
#   allDends.append(branch.prox) # Append because is a Section not a ListOF
#   allDends.extend(branch.mid)
#   allDends.extend(branch.dist)
#
#   somaAndProx.append(branch.prox) # Append because is a Section not a ListOF
#   midAndDist.extend(branch.mid)
#   midAndDist.extend(branch.dist)
   
#        for sec in allDends:
#            sec(0.5).naf.gnabar = 0.0195
#            sec(0.5).nap.gnabar = 1.3802e-7
    
# Soma + Prox
#        for sec in somaAndProx:
soma(0.5).kas.gkbar = 0.0104 # S/cm2
soma(0.5).kaf.gkbar = 0.225 # S/cm2
    
# Mid + Dist
#        for sec in midAndDist:
#            sec(0.5).kas.gkbar = 0.00095142 # S/cm2
#            sec(0.5).kaf.gkbar = 0.020584 # S/cm2





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


run(500)
t, v_soma = plotVecs(t_vec, v_soma_vec)
plot(t, v_soma)
show()