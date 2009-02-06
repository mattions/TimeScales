# Author: Michele Mattioni
# Thu Jan 29 09:20:14 GMT 2009

import pysces
import sys
import numpy


def test1():
    mod = pysces.model('BIOMD0000000183.xml.psc', 
                       dir="/home/mattions/Work/model/MSN/Time_scales/trunk/biochemical_circuits")
    mod.doLoad()
    
    mod.mode_integrator = "CVODE"
    
    name2sbmlId = {"CaMKIIbar" : "parameter_28",
                              "PP2Bbar" : "parameter_34",
                              "Ca" : "species_1"
                              }
    
    #c2i = pysces.PyscesInterfaces.Core2interfaces()
    
    mod.doSim()

def setupTest():
    mod = pysces.model("testSimple.xml.psc")
    mod.doLoad()
    mod.sim_end = 10
    mod.Simulate(userinit=0)
    
    return mod
    # Get speces
    
#def changeSpecies(mod):
#    data = mod.data_sim.getSpecies()
#    species = data[:,1:] # grab everything except the time
#    species[-1:,1] = 1000
#    mod.data_sim.setSpecies(species)
#
#def changeSpecies1(mod):
#    mod.s1 = 1000
#    
    
    
mod = setup()    
#changeSpecies(mod)
#mod.sim_end = 10
#mod.Simulate(userinit=3)
    
    