from neuronvisio.controls import Controls
controls = Controls()
from neuron import h

from neuronControl.nrnManager import NeuronManager

 
import time


bio_filename = "biochemical_circuits/biomd183_loop.eml"
big_spine = True
dt_neuron = 0.025


nrnManager =NeuronManager(bio_filename,
                          big_spine, 
                          dt_neuron, 
                          mod_path="mod", 
                          hoc_path="hoc", 
                          spines_dist='two')

#start= time.time()
#                  
#controls.manager.add_all_vecRef('v') # Adding vector for the variable v
#
#print "Starting time: %s" % start            
#h.load_file('parcom.hoc')
#p = h.ParallelComputeTool()
#p.nthread(4)
#p.multisplit(True)
#
#h.finitialize()
#while h.t < h.tstop:
#    h.fadvance()
#
#end= time.time()
#
#run_time = end-start
#
#print "Ending time: %s. Total time with no parallel: %s" %(end, run_time)
#print "Tstop: %s" %(h.tstop)
#
## file where to save the results
#filename = 'storage.h5'
## Saving the vectors
#controls.manager.save_to_hdf(filename)
