# Author Michele Mattioni
# date Sat Nov 21 19:06:01 GMT 2009

cdef extern from "math.h":
    double pow(double, double)
    
cpdef calcWeight(double old_weight, double CaMKIIbar, int n, int k):
    """Calc the weight of the synapses according to the CaMKII"""
    
    # Dummy function should be changed
    cdef double delta, weight
    delta = pow(CaMKIIbar, n) / (pow(k, n) + pow(CaMKIIbar, n))
    weight = old_weight + delta
#    s = "Old weight %f, CAMKIIbar value: %e,\
#    calculated delta: %e" %(old_weight, CaMKIIbar, delta)
    #print s
    return weight
