# Author Michele Mattioni
# Wed Sep 16 12:26:40 BST 2009

import sqlite3
import matplotlib.pyplot as plt
import cPickle


import helpers
from neuron import h
import neuronControl
from neuronControl.spine import Spine
from neuronvisio.controls import Controls
from neuronvisio.manager import VecRef


def plot_bio(spine, var):
    """Plot the biochemical variable"""
    var_timecourse = spine[var]
    plt.plot(var_timecourse[:,0], var_timecourse[:,1], label=var)

def plot_calcium_conc(spine_timecourses, spine_vol):
    
    ca_tc = spine_timecourses['ca']
    ca_molecules = ca_tc[:,1]
    
    ca_conc = ca_molecules / (spine_vol * 1e-15 * 6.022 * 1e23)
    ca_conc = ca_conc * 1e3 # Transform in mM]
    plt.plot(ca_tc[:,0], ca_conc)
    

def plot_syn(syn_vecs, var):
    """Plot the variable of the synapse"""
    pylab.figure()
    plt.plot(sto.t, syn_vecs[var])
    
def get_vecRefs(path_to_sqlite):
    conn = sqlite3.connect(path_to_sqlite)
    cursor = conn.cursor()
    
    sql_stm = """SELECT * from Vectors""" 
    
    cursor.execute(sql_stm)
    vecRefs = []
    time = None
    
    for row in cursor:
        # vecrRef
        sec_name = str(row[1])
        
        if sec_name != 'NULL':
            
            var = str(row[0])
            array = cPickle.loads(str(row[2]))
            
            found = False
            for vecRef in vecRefs:
                if vecRef.sec_name == sec_name:
                    found = True
                    break
            if found:
                vecRef.vecs[var] = array
                
                continue #Move to next record
            else:
                nrn_sec = eval('h.' + sec_name)        
                vecRef = VecRef(nrn_sec)
                vecRef.vecs[var] = array
            
            vecRefs.append(vecRef)
    conn.close()
    return vecRefs

def get_spines(path_to_sqlite):
    conn = sqlite3.connect(path_to_sqlite)
    cursor = conn.cursor()
    
    sql_stm = """SELECT * from Timeseries""" 
    
    cursor.execute(sql_stm)
    
    for row in cursor:
        for sec in h.allsec():
            if sec.name() == str(row[2]):
                spine_name = str(row[3])
                # Check if the spine is already there in one section
                if not hasattr(h, spine_name + "_head"):
                    spine = Spine(spine_name, biochemical=False) # Not loading E-cell
                    spine_pos = float(row[1])
                    spine.attach(sec, spine_pos, 0)
                    nrnSim.spines.append(spine)
                    break # Stopping adding the same spine

def get_time(path_to_sqlite):
    
    conn = sqlite3.connect(path_to_sqlite)
    cursor = conn.cursor()
    sql_stm = """SELECT * FROM Vectors WHERE var='t'"""
    cursor.execute(sql_stm)
    for row in cursor:
        array = cPickle.loads(str(row[2]))
    return array

if __name__ == "__main__":
        
    from optparse import OptionParser
    usage = "usage: %prog [options] path/to/storage"
    parser = OptionParser(usage)
    (options, args) = parser.parse_args()
    
    
    if len(args) != 1:
        parser.error("Incorrect number of arguments")
        parser.usage()
        
    
    # Loading Neuronvisio
    controls = Controls()
    
    # Loading the geometry of the neuron
    
    nrnSim = neuronControl.NeuronSim(mod_path="mod", hoc_path="hoc", 
                              spines=False, # We load without spines!  
                              biochemical=False)
    # Picking up the spines
    get_spines(args[0])
    print "In this simulation there were %i spines" % len (nrnSim.spines)
    
    controls.manager.load_db(args[0])
    # Attaching the vecRef_properly
    controls.update_tree_view() # Showing the vectors in the treeview