from neuron import h
import os
import neuron.gui
import pylab

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
        
if __name__ == "__main__":        
    neuron.load_mechanisms("../mod")
    os.chdir("../input_params")
    h.load_file("spine_syninput.hoc")
    
    t = h.Vector()
    t.record(h._ref_t)
    
    vecs = {}
    sections = [h.spina[0], h.spinh[0], h.spins[0]]
    
    for section in sections:
        vecs = createVecs(section, 'cai', vecs)
        vecs = createVecs(section, 'cali', vecs)
    
    
    h.run()
    # plot results
    plotVecs(vecs, "cai")
    pylab.legend(loc=0)
    
    pylab.figure()
    plotVecs(vecs, "cali")
    pylab.legend(loc=0)
    
    # Show everything
    pylab.show()
