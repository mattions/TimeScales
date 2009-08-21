# Author Michele Mattioni
# date Fri Aug 21 10:28:21 BST 2009

"""Used to run the test on one spine only.

usage: 
ipython -pylab

run test_spine.py"""

import nrnvisio
import os
import numpy
import pylab

from neuron import h
import neuron

from neuronControl import Synapse, Spine
from helpers import graph

# Starting neuronVisio
controls = nrnvisio.Controls()

mod_path = "mod"
hoc_path = "hoc"
    
    # Mod file are always in a mod directory
if not os.path.exists(mod_path) :
    print "ERROR mod path %s doesn't exist" %os.path.realpath(mod_path)
    sys.exit(1)
neuron.load_mechanisms(mod_path)

if not os.path.exists(hoc_path):
    print "ERROR hoc path %s doesn't exist" %os.path.realpath(hoc_path)
    sys.exit(1)
# Hoc file assumes all the file are launched from a top directory
head, tail  = os.path.split(os.path.realpath(hoc_path))

preface_pos = head

h('strdef preface, dirstr') # preface and dirstr used in each hoc
preface_string = "preface = \"" + preface_pos + "\""
h(preface_string)
h.load_file(os.path.join(hoc_path, "all_tau_vecs.hoc"))
h.load_file('stdrun.hoc')
spine1 = Spine("1", 
               filename_bioch_mod ="biochemical_circuits/biomd183_noCalcium.eml")

# AMPA Syn
ampaSyn = spine1.synapses['ampa']
ampaSyn.createStimul(start = 200, number = 5, interval = 5, noise = 0)

#NMDA Syn


# Vectors
#    manager = nrnvisio.Manager()
#    vars = ['v', #voltage 
#            'cai', #first calcium pool
#            'cali' #second calcium pool
#            ]
#    for var in vars:
#        manager.add_all_vecRef(var)
#        
#    graph = graph.Graph()

#import neuron.gui
h.v_init = -87.75 # Setting the initial vm
h.dt = 0.005

h.tstop = 300
#    h.run()
#    secs = [spine1.neck, spine1.head, spine1.psd]
#        
#    cai_vecs = manager.get_vectors(secs, 'cai')
#    cali_vecs = manager.get_vectors(secs, 'cali')
#    v_vecs = manager.get_vectors(secs, 'v')
#    
#    manager.plotVecs(cai_vecs, 'cai')
#    manager.plotVecs(cali_vecs, 'cali')
#    manager.plotVecs(cali_vecs, 'v')


#        
#    graph.plotCalcium(cai_vecs, "cai")
#    graph.plotCalcium(cali_vecs, "cali")
#    vecs_volt = graph.vecsSubSelection(manager.vecRefs, 'v')
#    graph.plotVoltage(vecsVolt)
##    graph.plotVoltage(vecsVolt, spine1.synapses['ampa'].synVecs)
##    pylab.title("AMPA syn")
###    graph.plotVoltage(vecsVolt, spine1.synapses['nmda'].synVecs)
##    pylab.title("NMDA syn")
#    pylab.show()
