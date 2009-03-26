from neuron import h
import neuron.gui

def createVecs(section, var, vecs):
    key = section.name()
    if hasattr(section(0.5), var):
        if vecs is None or not vecs.has_key(key):
            key = key + "_" + var 
            vecs[key] = h.Vector()
            var = '_ref_' + var
            vecs[key].record(getattr(section(0.5), var))
    return vecs

neuron.load_mechanisms("../mod")
h.load_file("spine_syninput.hoc")

t = h.Vector()
t.record(h._ref_t)

vecs = {}
sections = [h.spina[0], h.spinh[0], h.spins[0]]

for section in sections:
    vecs = createVecs(section, 'cai', vecs)
    vecs = createVecs(section, 'cali', vecs)

def plotVecs(vecs, var):
    for k,v in vecs.iteritems():
    if var in k:
        plot(t,v,label=k)
    
#vecs['cai'] = h.Vector()
#vecs['cali'] = h.Vector()
#
#vecs['cai'].record(h.spina[0](0.5)._ref_cai)
#vecs['cali'].record(h.spina[0](0.5)._ref_cali)

