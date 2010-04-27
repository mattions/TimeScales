from neuronvisio.controls import Controls
controls = Controls()
from neuron import h
import neuronControl
nrnSim = neuronControl.NeuronSim(mod_path="mod", hoc_path="hoc", 
                              spines_dist='zero', 
                              biochemical_filename="biochemical_circuits/biomd183_noCalcium.eml")
                              
