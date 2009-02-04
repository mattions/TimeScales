# Author: Michele Mattioni
# Thu Jan 29 09:20:14 GMT 2009

import pysces
import sys



mod = pysces.model('BIOMD0000000183.xml.psc', 
                   dir="/home/mattions/Work/model/MSN/Time_scales/trunk/biochemical_circuits")
mod.doLoad()

#mod.mode_integrator = "CVODE"

name2sbmlId = {"CaMKIIbar" : "parameter_28",
                          "PP2Bbar" : "parameter_34",
                          "Ca" : "species_1"
                          }

mod.doSim()