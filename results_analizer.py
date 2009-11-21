# Author Michele Mattioni
# Wed Sep 16 12:26:40 BST 2009

import helpers
import pylab


def plot_bio(spine, var):
    """Plot the biochemical variable"""
    var_timecourse = spine[var]
    pylab.plot(var_timecourse[:,0], var_timecourse[:,1], label=var)

def plot_calcium_conc(spine_timecourses, spine_vol):
    
    ca_tc = spine_timecourses['ca']
    ca_molecules = ca_tc[:,1]
    
    ca_conc = ca_molecules / (spine_vol * 1e-15 * 6.022 * 1e23)
    ca_conc = ca_conc * 1e3 # Transform in mM]
    pylab.plot(ca_tc[:,0], ca_conc)
    

def plot_syn(syn_vecs, var):
    """Plot the variable of the synapse"""
    pylab.figure()
    pylab.plot(sto.t, syn_vecs[var])
    
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
    
    from neuronvisio.controls import Controls
    controls = Controls()
    from neuron import h
    import neuronControl
    import helpers
    from neuronControl.spine import Spine
    
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
    for i, id in enumerate(sto.spines_id):
        spine_pos = sto.spines_pos[i]
        spine_parent_sec = sto.spines_parent[i]
        for sec in h.allsec():
            if sec.name() == spine_parent_sec:
                spine = Spine(id, biochemical=False) # Not loading E-cell
                spine.attach(sec, spine_pos, 0)
                nrnSim.spines.append(spine)
    print "In this simulation there were %i spines" % len (sto.spines_id)
    # Attaching the vecRef_properly
    for sec in h.allsec():
        for vecRef in sto.vecRefs:
            if sec.name() == vecRef.sec_name:
                vecRef.sec = sec
                break