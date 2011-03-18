# Author Michele Mattioni
# Thu Mar 19 10:40:51 GMT 2009

from neuron import h

class Synapse(object):
    """Synapse object class. Usually created in the spine"""
    
    def __init__(self, chan_type, section, position=0.5):
        
        self.chan_type = chan_type
        self.section = section
        self.chan = self.createChannel(chan_type, position)
        self.vecs = {} # Dictionary to record all the vectors 
        self.weight =  [[],[]]
        self.stims = []
            
    def createChannel(self, chan_type, position):
        """Create the NMDA or AMPA channel"""
        if chan_type == 'ampa':
            chan = h.AMPA(position, sec = self.section)
        elif chan_type == 'nmda':
            chan = h.NMDA(position, sec = self.section)
        elif chan_type == 'gaba':
            chan = h.GABA(position, sec = self.section)
            
        return chan    
    
    def createStimul(self, array_inputs, neuron_time_resolution):
        """Create a netStim object and assign it to the synapse together with 
        a NetConnect one.
        
        :params
            array_inputs - Array which holds the inputs time
            neuron_time_resolution - resolution of the vectors when saving results"""
        
        # NetStim obj    
#        netStim = h.NetStim()
#        netStim.number = stim.number
#        netStim.start = stim.time
#        netStim.interval = stim.interval
#        netStim.noise = stim.noise
#        self.netStimList.append(netStim) # assign the point to the class as attribute
        
        # Removing duplicates
        array_inputs = list(set(array_inputs))
        # Ordering the inputs
        array_inputs.sort()
        print "Creating vecStim for syn. Array input: %s" %array_inputs
        vecStim = h.VecStim()
        self.vec = h.Vector(array_inputs)
        vecStim.play(self.vec)
        self.vecStim = vecStim
        
        # NetCon obj
        netCon = h.NetCon(vecStim, self.chan, 0, 0, 1) #Setting the weight
        #netCon.weight[0] = 1
        self.netCon = netCon # assign the point to the class as attribute
        
        self.createVec(neuron_time_resolution) # Recording the synapse

        
    def createVec(self, neuron_time_resolution):
        """Create the vector to measure the activity of the synapse
        
        :param syn -  The synapse to record
        Remember: The weight on the synapse is a special one and holds the time 
        (from Neuron) and the corrispondent value.
        """
        
        # Record the stimuls
        # The NetCon needs a record allocated to use to record the stuff
        stimul = "stimul_" + self.chan_type
        self.vecs[stimul] = h.Vector()
        self.netCon.record(self.vecs[stimul])
        # Record the current into the synaptic chan
        i = "i_" + self.chan_type
        g = "g_" + self.chan_type
        itmp = "itmp_" + self.chan_type
        scale = "scale_" + self.chan_type
        scale_ref = "scale_ref_" + self.chan_type
        self.vecs[i] = h.Vector()
        self.vecs[g] = h.Vector()
        self.vecs[itmp] = h.Vector()
        self.vecs[scale] = h.Vector()
        self.vecs[scale_ref] = h.Vector()
        if neuron_time_resolution is None:
            self.vecs[i].record(self.chan._ref_i)
            self.vecs[g].record(self.chan._ref_g)
            self.vecs[itmp].record(self.chan._ref_itmp)
            self.vecs[scale].record(self.chan.scale)
            self.vecs[scale_ref].record(self.chan._ref_scale)
        else:
            self.vecs[i].record(self.chan._ref_i, neuron_time_resolution)
            self.vecs[g].record(self.chan._ref_g, neuron_time_resolution)
            self.vecs[itmp].record(self.chan._ref_itmp, neuron_time_resolution)
            self.vecs[scale].record(self.chan.scale, neuron_time_resolution)
            self.vecs[scale_ref].record(self.chan._ref_scale, neuron_time_resolution)
             
        
        
        