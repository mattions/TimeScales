# Author: Michele Mattioni
# Mon Jan 26 05:54:30 GMT 2009


class Spine():
    
    def __init__(self, h):
        """ Create a spine"""
        spine = h.Section()
        # Volume of a spine ~ 0.11 um 
        # dia = (sqrt (V/(pi*h))) * 2
        spine.L = 1
        spine.diam =  0.3742
        debug = True
        if debug:
            import math
            vol = spine.L * (spine.diam/2) * (spine.diam/2) * math.pi
            print "Volume of the spine %f" % vol
        
        # synapse in the spine
        ampa = h.ampa(0.5, sec = spine)
        