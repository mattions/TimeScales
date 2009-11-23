# Author Michele Mattioni
# date Sat Nov 21 19:06:01 GMT 2009

cdef extern from "math.h":
    double pow(double, double)

cdef calc(double CaMKIIbar, int n, int k):
    """Calc the math function down to the C for performance reason"""
    return pow(CaMKIIbar, n) / (pow(k, n) + pow(CaMKIIbar, n))
    
cpdef calcWeight(double old_weight, double CaMKIIbar, int n, int k):
    """Calc the weight of the synapses according to the CaMKII"""
    
    # Dummy function should be changed
    cdef double delta, weight
    delta = calc(CaMKIIbar, n, k)
    weight = old_weight + delta
#    s = "Old weight %f, CAMKIIbar value: %e,\
#    calculated delta: %e" %(old_weight, CaMKIIbar, delta)
    #print s
    return weight
