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
    mod.mode_integrator = "CVODE"

    mod.sim_end = 20
    mod.Simulate(userinit=0)
    
    #Change the specie with an event

    time = 30
    newConcentration = 50
    assignments = { "s1" : str(newConcentration)}
    addEvent("ev1", time, assignments, mod)
    mod.sim_end = 100
    mod.Simulate()

    data = mod.data_sim.getSimData("s1", "s3")
    pylab.plot(data[:,0], data[:,1], label="s1")
    pylab.plot(data[:,0], data[:,2], label="s3")
    pylab.legend(loc=0)

    return mod

def addEvent(name, time, assignments, mod, delay=0):
    """Add the event to the list of following event"""
    mod.__eDict__.update ( {name : {'delay' : delay, 
                                   'name' : name,
                                   'trigger' : '_TIME_ >= ' + str(time),
                                   'assignments' : assignments,
                                   'tsymb' : None} 
                                   })
    mod.InitialiseEvents()


        
#mod = test1() #Unpacking to work in ipython
mod = test2()
pylab.show()