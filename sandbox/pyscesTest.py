# Author: Michele Mattioni
# Thu Jan 29 09:20:14 GMT 2009

import pysces
import sys
import numpy
import pylab

name2sbmlId = {"CaMKIIbar" : "parameter_28",
                              "PP2Bbar" : "parameter_34",
                              "Ca" : "species_1"
                              }

def test1():
    """Run the time course for the real model and plot it"""
#    mod = pysces.model('BIOMD0000000183_altered.xml.psc', 
#                       dir="/home/mattions/Work/model/MSN/\
#                       Time_scales/trunk/biochemical_circuits")
    mod = pysces.model('BIOMD0000000183_altered_no_par.psc', 
                       dir="/home/mattions/Work/model/MSN/\
                       Time_scales/trunk/biochemical_circuits")
    mod.doLoad()
    
    mod.mode_integrator = "CVODE"
    mod.CVODE_extra_output= [name2sbmlId["CaMKIIbar"], name2sbmlId["PP2Bbar"]]
    mod.sim_end = 80
    mod.sim_points = 1000
    mod.Simulate()
    data = mod.data_sim.getSimData(name2sbmlId["PP2Bbar"], name2sbmlId["CaMKIIbar"], 
                               name2sbmlId['Ca'])
    pylab.plot(data[:,0], data[:,1], label= "PP2Bbar")
    pylab.plot(data[:,0], data[:,2], label= "CaMKIIbar")
    pylab.plot(data[:,0], data[:,3], label= "Ca")
    pylab.legend(loc=0)
    pylab.title("PySCeS")    
    return mod
    

def test2():
    """Test the change of speces"""
    mod = pysces.model("testSimple.xml.psc")
    mod.doLoad()
    mod.sim_end = 10
    mod.Simulate(userinit=0)
    
    # Change the species
    data = mod.data_sim.getSpecies()
    species = data[:,1:] # grab everything except the time
    species[-1:,1] = 10
    mod.data_sim.setSpecies(species)
    mod.__settings__['mod_sim_init'] = 3
    mod.sim_start = mod.sim_end
    mod.sim_end = 20
    mod.Simulate(userinit=0)
    
    data2 = mod.data_sim.getSpecies()
    pylab.plot(data[:,0], data[:,1])
    pylab.plot(data[:,0], data[:,2])
    pylab.plot(data2[:,0], data2[:,1])
    pylab.plot(data2[:,0], data2[:,2])

    return mod
    


        
mod = test1() #Unpacking to work in ipython
pylab.show()