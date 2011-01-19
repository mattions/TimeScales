# Author Michele Mattioni
# Thu Mar 19 18:51:30 GMT 2009

#from neuron import h
import numpy as np
import matplotlib.pyplot as plt



class StimulPlotter():
    """Helps to plot stimuli"""
    
    def __init__(self):
        pass
    
    def build_stimul_vec(self, time, stimul, height_in_the_graph):
        """Return a masked array which has `height_in_the_graph` value
        for each point recorded in stimul array.
        
        time - the time array of the simulation
        stimul - the synvecRef vectors with the synapstic inputs
        height_in_graph"""
        
        inputs_event = np.zeros_like(time)
        indxs = np.searchsorted(time, stimul)
        inputs_event[indxs] = height_in_the_graph
        masked = np.ma.masked_where(inputs_event == 0, inputs_event)
        return masked
    
    def plot_input(self, spine, manager, style='k.', height_in_the_graph=-88):
        
        spine += '_psd'
        stimul = manager.get_vector(spine, 'stimul_ampa', 'SynVecRef')
        
        if stimul is None:
            print "Error - Stimul not Plotted. No stim found for %s." %spine
        else:
            time = manager.groups['t']
            print "Buiding stim array for %s" %spine
            m_array = self.build_stimul_vec(time, stimul, height_in_the_graph)
            plt.plot(time, m_array, 'k.', label = "stimul")
            return m_array
            

#class Graph:
#    
#    def __init__(self, batch=False):
#        if batch:
#            matplotlib.use('Agg')
#        import matplotlib.pyplot as plt
#        t = h.Vector()
#        t.record(h._ref_t)
#        self.t = t
#    
#    def createVecs(self, vecs, spine, var):
#        """Create the vector for the spine and the parent of the spine exist
#        :params
#            vecs - dict for the vecs
#            spine - spine where to create the vecs
#            var - variable to record (i.e. v, cai, ica, etc ...)"""
#        
#        
#        
#        #vecs = self.initVec(vecs, h.MSP_Cell[0].soma, var)
#        
#        if spine.parent is not None:
#            tree = self.createTree(spine.neck)
#            for sec in tree:
#                vecs = self.initVec(vecs, sec, var)
#        
#        vecs = self.initVec(vecs, spine.psd, var)
#        vecs = self.initVec(vecs, spine.head, var)
#        vecs = self.initVec(vecs, spine.neck, var)
#        
#        return vecs
#
#    def initVec(self, vecs, section, var):
#        """ Create a new vector and add it to the vecs dict using as key the name of the section"""
#        key = section.name()
#        
#        if len (key.split('.')) > 1:
#            key = key.split('.')[1] # Get rid of the MSP_Cell[0] prefix
#        else:
#            key = section.name() 
#            
#        key = key + "_" + var    
#        if hasattr(section(0.5), var):
#            if vecs is None or not vecs.has_key(key):
#                vecs[key] = h.Vector()
#                var = '_ref_' + var
#                vecs[key].record(getattr(section(0.5), var))
#        return vecs
#
#    def stimulGraph(self, stimul):
#        """Create a vector of the inputs given to the synapse"""
#            # Transforming the vector in numpy
#        t = numpy.array(self.t)
#        t = numpy.round(t, decimals=9) # round
#        
#        inputs_event = numpy.zeros_like(t)
#        for indx, x in enumerate (t):
#            for y in stimul:
#                if x == y:
#                    inputs_event[indx] = 1
#                    
#        masked = numpy.ma.masked_where(inputs_event == 0, inputs_event)
#        #plt.figure()
#        plt.plot(t, masked, 'k.', label = "stimul")
#        return masked
#          
#
#    def plotVoltage(self, vecsVolt, synVecs=None, drawLegend=True):
#        
#        fig = plt.figure()
#        plt.ax1 = fig.add_subplot(111) #sub for the two scales
#        for key,vec in vecsVolt.iteritems():
#            plt.plot(self.t , vec, label=key)
#        plt.ylabel("Voltage [mV]")
#        plt.xlabel("Time [ms]")
#        if drawLegend:
#            plt.legend(loc=0)
#        
#        if synVecs is not None:
#            ax2 = plt.ax1.twinx()
#            self.stimulGraph(synVecs["stimul"])
#            ax2.set_ylim(0,4)
#            ax2.set_axis_off()
#            t = numpy.array(self.t)
#            t = numpy.round(t, decimals=9) # round
#            plt.ax1.set_xlim(t[0],t[-1])
#            if drawLegend:
#                plt.ax1.legend(loc=0)
#            return plt.ax1 # No really needed but handy
#
#    
#    def plotCalcium(self, vecsCa, var):
#        """Plot the calcium current (both together or only one)"""
#        plt.figure()
#        for key,vec in vecsCa.iteritems():
#            if var in key:
#                plt.plot(self.t , vec, label=key)
#        plt.xlabel("Time [ms]")
#        plt.ylabel("Concentration [mM]")
#        plt.legend(loc=0)
#        
#    def plotCalciumCurrent(self, vecsCur):
#        
#        plt.figure()
#        for key,vec in vecsCur.iteritems():
#            plt.plot(self.t , vec, label=key)
#        plt.xlabel("Time [ms]")
#        plt.ylabel("Current [nA]")
#        plt.legend(loc=0)
#        
#    def vecsSubSelection(self, vecs, nameOfInterest, matching=True):
#      
#        """Return a dictionary which is a subset of the given one, 
#        chosen in the matching of the namenOfInterest
#        
#        :param vecs: Dictionary from where to extract the subset
#        :param nameOfInterest: key to be matched
#        :param matching: If set to true the record is included, 
#        otherwise it's excluded and all the non matching are included."""
#        
#        matchingKeys = []
#        notMatchingKeys = []
#        keys = vecs.keys()
#        for k in keys:
#          if nameOfInterest in k:
#              matchingKeys.append(k)
#          else:
#              notMatchingKeys.append(k)
#        # Creating a set to avoid duplicate
#        notMatchingKeys = set(notMatchingKeys)
#        selectedVecs = {}
#
#        if matching:
#          for k in matchingKeys:
#              selectedVecs[k] = vecs[k]
#        else:
#          for k in notMatchingKeys:
#              selectedVecs[k] = vecs[k]
#          
#        return selectedVecs
#    
#    def createSpineSiblingVecs(self, spines, spineOfInterest, vecs, varToRecord):
#        "Create the vectors for all the siblings spines"
#        spine_sibilings = []
#        for spine in spines:
#            if spine.parent == spineOfInterest.parent:
#                spine_sibilings.append(spine)
#        for spine in spine_sibilings:
#            vecs = self.createVecs(vecs, spine, varToRecord)
#        return vecs