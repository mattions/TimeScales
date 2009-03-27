from neuron import h
import neuron.gui
import pylab
import os


def createVecs(section, var, vecs):
    key = section.name()
    if hasattr(section(0.5), var):
        if vecs is None or not vecs.has_key(key):
            key = key + "_" + var 
            vecs[key] = h.Vector()
            var = '_ref_' + var
            vecs[key].record(getattr(section(0.5), var))
    return vecs

def plotVecs(vecs, var):
    for k,v in vecs.iteritems():
        if var in k:
            pylab.plot(t,v,label=k)
    pylab.legend(loc=0)

def plotCaTogether(sections, vecs):
    for section in sections:
        key = section.name() + '_cai'
        cai = numpy.array(vecs[key])
        key = section.name() + '_cali'
        cali = numpy.array(vecs[key]) 
        ca = cai + cali
        pylab.plot(t, ca, label=section.name() + "_ca")
        pylab.xlabel("Time [ms]")
        pylab.ylabel("Concentration [mM]")


neuron.load_mechanisms("../mod")


h.load_file("spine_syninput.hoc")

t = h.Vector()
t.record(h._ref_t)

vecs = {}
sections = [h.spina[0], h.spinh[0], h.spins[0]]

for section in sections:
    vecs = createVecs(section, 'cai', vecs)
    vecs = createVecs(section, 'cali', vecs)
    vecs = createVecs(section, 'v', vecs)

h.run()

plotVecs(vecs, 'v')
pylab.xlabel("Time [ms]")
pylab.ylabel("Voltage [mV]")

pylab.figure()
plotVecs(vecs, 'cai')
pylab.xlabel("Time [ms]")
pylab.ylabel("Concentration [mM]")
ax = pylab.gca()
ax.set_ylim([0, 0.0008])

pylab.figure()
plotVecs(vecs, 'cali')
pylab.xlabel("Time [ms]")
pylab.ylabel("Concentration [mM]")

pylab.show()


