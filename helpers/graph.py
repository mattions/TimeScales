# Author Michele Mattioni
# Thu Mar 19 18:51:30 GMT 2009

from neuron import h
import numpy
import pylab

class Graph:
    
    def __init__(self, batch=False):
        t = h.Vector()
        t.record(h._ref_t)
        self.t = t
    
    def createVecs(self, vecs, spine, var):
        """Create the vector for the spine and the parent of the spine exist
        :params
            vecs - dict for the vecs
            spine - spine where to create the vecs
            var - variable to record (i.e. v, cai, ica, etc ...)"""
        
        
        
        #vecs = self.initVec(vecs, h.MSP_Cell[0].soma, var)
        
        if spine.parent is not None:
            vecs = self.initVec(vecs, spine.parent, var)
        
        vecs = self.initVec(vecs, spine.psd, var)
        vecs = self.initVec(vecs, spine.head, var)
        vecs = self.initVec(vecs, spine.neck, var)
        
        return vecs

    def initVec(self, vecs, section, var):
        """ Create a new vector and add it to the vecs dict using as key the name of the section"""
        key = section.name()
        
        if len (key.split('.')) > 1:
            key = key.split('.')[1] # Get rid of the MSP_Cell[0] prefix
        else:
            key = section.id # Custom section 
            
        key = key + "_" + var    
        if hasattr(section(0.5), var):
            if vecs is None or not vecs.has_key(key):
                vecs[key] = h.Vector()
                var = '_ref_' + var
                vecs[key].record(getattr(section(0.5), var))
        return vecs

    def stimulGraph(self, stimul):
        """Create a vector of the inputs given to the synapse"""
            # Transforming the vector in numpy
        t = numpy.array(self.t)
        t = numpy.round(t, decimals=9) # round
        
        inputs_event = numpy.zeros_like(t)
        for indx, x in enumerate (t):
            for y in stimul:
                if x == y:
                    inputs_event[indx] = 1
                    
        masked = numpy.ma.masked_where(inputs_event == 0, inputs_event)
        #pylab.figure()
        pylab.plot(t, masked, 'k.', label = "stimul")
        return masked
          

    def plotVoltage(self, vecsVolt, synVecs=None, drawLegend=True):
        
        fig = pylab.figure()
        pylab.ax1 = fig.add_subplot(111) #sub for the two scales
        for key,vec in vecsVolt.iteritems():
            pylab.plot(self.t , vec, label=key)
        pylab.ylabel("Voltage [mV]")
        pylab.xlabel("Time [ms]")
        if drawLegend:
            pylab.legend(loc=0)
        
        if synVecs is not None:
            ax2 = pylab.ax1.twinx()
            self.stimulGraph(synVecs["stimul"])
            ax2.set_ylim(0,4)
            ax2.set_axis_off()
            t = numpy.array(self.t)
            t = numpy.round(t, decimals=9) # round
            pylab.ax1.set_xlim(t[0],t[-1])
            if drawLegend:
                pylab.ax1.legend(loc=0)
            return pylab.ax1 # No really needed but handy

    
    def plotCalcium(self, vecsCa, var):
        
        "Plot the calcium current (both together or only one)"
        pylab.figure()
        for key,vec in vecsCa.iteritems():
            if var in key:
                pylab.plot(self.t , vec, label=key)
        pylab.xlabel("Time [ms]")
        pylab.ylabel("Concentration [mM]")
        pylab.legend(loc=0)
        
    def plotCalciumCurrent(self, vecsCur):
        
        pylab.figure()
        for key,vec in vecsCur.iteritems():
            pylab.plot(self.t , vec, label=key)
        pylab.xlabel("Time [ms]")
        pylab.ylabel("Current [nA]")
        pylab.legend(loc=0)