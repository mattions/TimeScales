# Author Michele Mattioni
# date Fri Aug 21 10:28:21 BST 2009

"""Used to run the test on one spine only.

usage: 
ipython -pylab

run test_spine.py"""


#from neuronvisio.controls import Controls
import os
import numpy

from neuron import h
import neuron

from synapse import Synapse
from stimul import Stimul
from spine import Spine

# Starting neuronVisio
#controls = Controls()


h.load_file('stdrun.hoc')
spine1 = Spine("spine1", 
               filename_bioch_mod ="biochemical_circuits/biomd183_noCalcium.eml")

#Setting the gbar
for synapse in spine1.synapses:
    if synapse.chan_type == 'ampa':
        synapse.chan.gbar = 8.5e-4
    elif synapse.chan_type == 'nmda':
        synapse.chan.gbar = 12.2e-5

# AMPA Syn


for synapse in spine1.synapses:
    if synapse.chan_type == 'ampa':
        stim = Stimul(time = 150, number = 5, interval = 5, chan_type = 'ampa')
        synapse.createStimul(stim.get_stims_time(), 0.1)

#NMDA Syn
#for synapse in spine1.synapses:
#    if synapse.chan_type == 'nmda':
#        stim = Stimul(time = 110, number = 5, interval = 5, chan_type = 'ampa', noise = 0)
#        synapse.createStimul(stim, 0.1)



# Vectors

vars = ['v', #voltage 
        'cai', #first calcium pool
        'cali' #second calcium pool
        ]
#for var in vars:
#    controls.manager.add_all_vecRef(var)
#    
#for synapse in spine1.synapses:
#    controls.manager.add_synVecRef(synapse)


#controls.update_tree_view()

import neuron.gui

h.v_init = -87.75 # Setting the initial vm
h.dt = 0.025

h.tstop = 200
