# Author Michele Mattioni
# Thu Mar 19 10:40:51 GMT 2009

from neuron import h

class Synapse(object):
    """Synapse object class. Usually created in the spine"""
    
    def __init__(self, chan_type, section, position=0.5):
        
        self.chan_type = chan_type
        self.section = section
        self.chan = self.createChannel(chan_type, position)
        self.syn_vecs = {} # Dictionary to record all the vectors 
        
    def createChannel(self, chan_type, position):
        """Create the NMDA or AMPA channel"""
        if chan_type == 'ampa':
            chan = h.AMPA(position, sec = self.section)
        elif chan_type == 'nmda':
            chan = h.NMDA(position, sec = self.section)
            
        return chan    
    
    def createStimul(self, start=0, number=0, interval=0, noise=0):
        """Create a netStim object and assign it to the synapse together with 
        a NetConnect one.
        
        :params
            start -  the initial delivery of the first stimul 
            number - number of times the stimul has to be delivered
            noise - noise that want to be introduced"""
        
        # NetStim obj    
        netStim = h.NetStim()
        netStim.number = number
        netStim.start = start
        netStim.interval = interval
        netStim.noise = noise
        self.netStim = netStim # assign the point to the class as attribute
        
        # NetCon obj
        netCon = h.NetCon(netStim, self.chan)
        netCon.weight[0] = 1
        self.netCon = netCon # assign the point to the class as attribute
        
    def createVec(self, syn):
        """Create the vector to measure the activity of the synapse
        
        :param syn -  The synapse to record
        """
        
        # Record the stimuls
        # The NetCon needs a record allocated to use to record the stuff
        self.syn_vecs["stimul"] = h.Vector()
        syn.netCon.record(self.syn_vecs["stimul"])
        
        # Record the current into the synaptic chan 
        self.syn_vecs["i"] = h.Vector()
        self.syn_vecs["i"].record(syn.chan._ref_i)        
        
        # Record the weight with a list. No doable with a Vector
        # It's filled in the main loop.
        self.syn_vecs['weight'] = []
        