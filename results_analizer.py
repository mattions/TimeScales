# Author Michele Mattioni
# Wed Sep 16 12:26:40 BST 2009

import helpers 
    
if __name__ == "__main__":
        
    from optparse import OptionParser
    usage = "usage: %prog [options] path/to/storage"
    parser = OptionParser(usage)
    (options, args) = parser.parse_args()
    
    
    if len(args) != 1:
        parser.error("Incorrect number of arguments")
        parser.usage()
    else:
        storage = args[0]
    
    from nrnvisio.controls import Controls
    controls = Controls()
    from neuron import h
    import neuronControl
    import helpers
    
    # Loading the geometry of the neuron
    nrnSim = neuronControl.NeuronSim(mod_path="mod", hoc_path="hoc", 
                              spines=False, biochemical=False, 
                              biochemical_filename="biochemical_circuits/biomd183_noCalcium.eml")
    # We load without spines!
    l = helpers.Loader()
    sto = l.load(storage)
    
    # Loading in read_only mode in Neuronvisio
    controls.read_only(sto)
    
    # Picking up the spines
    for i, spine in sto.spines_is:
        spine_pos = sto.spine_pos[i]
        spine_parent = sto.spines_parent[i]
        
        
    
    
    