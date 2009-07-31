import nrnvisio
from neuron import h
controls = nrnvisio.Controls()
import neuronControl
nrnSim = neuronControl.NeuronSim(mod_path="mod", hoc_path="hoc", 
                              spines=True, biochemical=False, 
                              biochemical_filename="biochemical_circuits/biomd183_noCalcium.eml")
                              
