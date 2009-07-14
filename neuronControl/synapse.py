# Author Michele Mattioni
# Thu Mar 19 10:40:51 GMT 2009

from neuron import h

class Synapse():
    
    def __init__(self, type, section, position=0.5):
        
        self.type = type
        self.section = section
        self.chan = self.createChannel(type, position)
        self.synVecs = None # Space for the vecs of the synapse
        
    def createChannel(self, type, position):
        """Create the NMDA or AMPA channel"""
        if type == 'ampa':
            chan = h.AMPA(position, sec = self.section)
        elif type == 'nmda':
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
        
        # Create handy vectors
        self.synVecs = self.createVecs()
    
    def createVecs(self):
        """Create the vector to measure the activity of the synapse"""
    
        synVecs = {}
        
        # Record the stimuls
        synVecs["stimul"] = h.Vector()
        self.netCon.record(synVecs["stimul"]) 
        
        # Record the current into the synaptic chan 
        synVecs["i"] = h.Vector()
        synVecs["i"].record(self.chan._ref_i)
        
        # Record the weight
        synVecs['weight'] = []
    
        return synVecs
        