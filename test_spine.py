# Author Michele Mattioni
# date Fri Aug 21 10:28:21 BST 2009

"""Used to run the test on one spine only.

usage: 
ipython -pylab

run test_spine.py"""


from neuronvisio.controls import Controls
import os
import numpy
import matplotlib.pyplot as plt

from neuron import h
import neuron

from neuronControl import Synapse, Spine, Stimul

def test_ampa(itmp, ical, g_tmp_ampa, scale):
    h.tstop = 300
    syn_ampa = None

    for syn in spine1.synapses:
        if syn.chan_type == 'ampa':
            syn_ampa = syn
    
    for sec in h.allsec():  
        for seg in sec:
            for mech in seg:
                if mech.name() == 'kir':
                    mech.gkbar = 0.00016
    h.finitialize()
    while h.t < h.tstop:
        h.fadvance()
        itmp.append(syn_ampa.chan.itmp)
        ical.append(syn_ampa.chan.ical)
        g_tmp_ampa.append(syn_ampa.chan.g)
        scale.append(syn_ampa.chan.scale)
    
    old = syn_ampa.netCon.weight[0]
    syn_ampa.netCon.weight[0] = 1.2
    print "changing the weight in the synapses. \
    Old: %s, New: %s" %(old, syn_ampa.netCon.weight[0])
    h.tstop = 700
    while h.t < h.tstop:
        h.fadvance()
        syn_ampa.netCon.weight[0] = h.t
        itmp.append(syn_ampa.chan.itmp)
        ical.append(syn_ampa.chan.ical)
        g_tmp_ampa.append(syn_ampa.chan.g)
        scale.append(syn_ampa.chan.scale)  
    #h.tstop = 700
    #h.run()
    


def go():
    
#    graph = Graph()
    h.run()
    secs = [spine1.neck, spine1.head, spine1.psd]
        
    cai_vecs = controls.manager.get_vectors(secs, 'cai')
    cali_vecs = controls.manager.get_vectors(secs, 'cali')
    v_vecs = controls.manager.get_vectors(secs, 'v')
    
#    controls.manager.plotVecs(cai_vecs, 'cai')
#    plt.title('cai')
#    controls.manager.plotVecs(cali_vecs, 'cali')
#    plt.title('cali')
#    controls.manager.plotVecs(v_vecs, 'v')
#    plt.title('voltage')
        
#    graph.plotVoltage(vecsVolt, spine1.synapses['ampa'].synVecs)
#    pylab.title("AMPA syn")
#    graph.plotVoltage(vecsVolt, spine1.synapses['nmda'].synVecs)
#    pylab.title("NMDA syn")
    plt.show()







#from helpers.graph import Graph

# Starting neuronVisio
controls = Controls()

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
        stim = Stimul(time = 0.100, number = 4, interval = 0.05, chan_type = 'ampa')
        synapse.stims.append(stim)
        stim2 = Stimul(time = 0.500, number = 4, interval = 0.05, chan_type = 'ampa')
        synapse.stims.append(stim2)


#NMDA Syn
#for synapse in spine1.synapses:
#    if synapse.chan_type == 'nmda':
#        stim = Stimul(time = 110, number = 5, interval = 5, chan_type = 'ampa', noise = 0)
#        synapse.createStimul(stim, 0.1)


spine1.deploy_stims(0.1)

# Vectors

vars = ['v', #voltage 
        'cai', #first calcium pool
        'cali' #second calcium pool
        ]
for var in vars:
    controls.manager.add_all_vecRef(var)
    
for synapse in spine1.synapses:
    controls.manager.add_synVecRef(synapse)


controls.update_tree_view()

#import neuron.gui
h.v_init = -87.75 # Setting the initial vm
h.dt = 0.025

h.tstop = 300

itmp = []
ical = []
g_tmp_ampa = []
scale = []

test_ampa(itmp, ical, g_tmp_ampa, scale)
