# Author: Michele Mattioni
# Tue Nov 11 11:54:40 GMT 2008

import neuron
import mediumSpinyNeuron

class neuronSim():
    def __init__(self):
        h = neuron.h
        self.setup()
        
    def setup(self):
        msn = mediumSpinyNeuron.mediumSpinyNeuron()

if __name__ == "__main__":
    nrnSim = neuronSim()