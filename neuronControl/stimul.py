# Author Michele Mattioni   
# Tue Oct  6 08:01:52 BST 2009

class Stimul(object):
    """Store the inputs we are going to deliver to the different synapses"""
    def __init__(self, time, number, interval, chan_type, noise=0):
        
        self.time = time
        self.number = number
        self.chan_type = chan_type
        self.noise = noise
        self.interval = interval
        
#        self.spine = None #Used for logging
    
    def to_log(self):
        s = "spine %s, time %s [ms], number %s\n" %(self.spine, self.time, self.number)
        return s 