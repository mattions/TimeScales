# Simple file to test an hoc implementation

from neuron import h

# loading the gui
h('load_file("nrngui.hoc")')


h('create soma')
h('insert hh') # Insert the HH channel just for have something moving
# insert concTest
h('load_file("conc.ses")')

h('objref time, k_conc')

h('time = new Vector()')
h('k_conc = new Vector()')

h('time.record(&t)')
h('k_conc.record(&soma.ki(0.5))')


