# Author Michele Mattioni
# Thu Mar 19 18:51:30 GMT 2009

from neuron import h

class Graph:
    
    def __init__(self):
        t = h.Vector()
        t.record(h._ref_t)
        self.t = t
    
    def createVecs(self, vecs, spine, var):
        """Create the vector for the spine and the parent of the spine and the soma if they don't exist
        :params
            vecs - dict for the vecs
            spine - spine where to create the vecs
            var - variable to record (i.e. v, cai, ica, etc ...)"""
        
        #CHECK IF THE SECTION HAS THE MECHANISM THAN CREATE THE VECTOR
        
        vecs = self.initVec(vecs, h.MSP_Cell[0].soma, var)
        
        vecs = self.initVec(vecs, spine.parent, var)
        
        vecs = self.initVec(vecs, spine.head, var)
        vecs = self.initVec(vecs, spine.neck, var)
        
        return vecs

    def initVec(self, vecs, section, var):
        """ Create a new vector and add it to the vecs dict using as key the name of the section"""
        key = section.name()
        
        if len (key.split('.')) > 1:
            key = key.split('.')[1] # Get rid of the MSP_Cell[0] prefix
        
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
        #figure()
        #return masked
        plot(t, masked, 'k.', label = "stimul")  

    def plotVoltage(self, vecsVolt, synVecs):
        
        fig = figure()
        ax1 = fig.add_subplot(111) #sub for the two scales
        for key,vec in vecsVolt.iteritems():
            plot(self.t , vec, label=key)
        ylabel("Voltage [mV]")
        xlabel("Time [ms]")
        
        ax2 = ax1.twinx()
        stimulGraph(self.t, synVecs["stimul"])
        ax2.set_ylim(0,4)
        ax2.set_axis_off()
        t = numpy.array(vecs["t"])
        t = numpy.round(t, decimals=9) # round
        ax1.set_xlim(t[0],t[-1])
        ax1.legend(loc=0)
        return ax1 # No really needed but handy
    
    def plotCalcium(self, vecsCa):
        
        figure()
        for key,vec in vecs.iteritems():
            plot(self.t , vec, label=key)
        xlabel("Time [ms]")
        ylabel("Concentration [mM]")
        legend(loc=0)
        
    def plotCalciumCurrent(self, vecsCur):
        
        figure()
        for key,vec in vecs.iteritems():
            plot(self.t , vec, label=key)
        xlabel("Time [ms]")
        ylabel("Current [nA]")
        legend(loc=0)