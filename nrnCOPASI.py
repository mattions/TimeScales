#!/usr/bin/env python

# Author: Michele Mattioni
# Sat Nov  8 12:34:55 GMT 2008

#import neuron

import pylab
import CopasiSim



if __name__ == "__main__":
    
    copSim = CopasiSim.COPASISim(useConc=True)
    initialCondition = True # use initial Condition
    tStop = 10.0
    data = copSim.createGraph(tStop, initialCondition)
    
    pylab.show()    