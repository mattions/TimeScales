import helpers
import os
import sys

import matplotlib
matplotlib.use('Agg')
import pylab

def plotCalcium(root, spine_id, ca_tc):
    """plotting the calcium concentration"""
    ca_molecules = ca_tc[:,1]
    
    ca_conc = ca_molecules / (0.11 * 1e-15 * 6.022 * 1e23)
    ca_conc = ca_conc * 1e3 # Transform in mM]
    
    pylab.figure()
    pylab.plot(ca_tc[:,0], ca_conc)
    t = "Calcium %s" %spine_id
    pylab.ylabel("Concentration [mM]")
    pylab.xlabel("Time [s]")
    pylab.title(t)
    pylab.savefig(os.path.join(root, t + ".png"))

def plottingCaMKIIbar(root, spine_id, CaMKIIbar_tc):
    """Plotting the CaMKIIbar"""
    pylab.figure()
    pylab.plot(CaMKIIbar_tc[:,0], CaMKIIbar_tc[:,1], label='CaMKIIbar')
    pylab.ylabel("Occupied fraction")
    pylab.xlabel("Time [s]")
    t = "CaMKIIbar %s" %spine_id
    pylab.title(t)
    pylab.savefig(os.path.join(root, t + '.png'))
        
def plotting_synaptic_weights(root, synVecRefs):
    "plotting the weight for all the synapses"
    for synVec in synVecRefs:
        pylab.figure()
        pylab.plot(synVec.syn_vecs['weight'])
        pylab.xlabel("Time [ms]")
        pylab.ylabel("Synapse's Weight")
        t= "%s %s" %(synVec.section_name, synVec.chan_type)
        pylab.title(t)
        pylab.savefig(os.path.join(root, t + ".png"))


top = sys.argv[1] 
        
for root, dirs, files in os.walk(top, topdown=False):
    if len(dirs) == 0:
        l = helpers.Loader()
        sto = l.load(root +"/storage")
        
        for spine_id in sto.time_courses.keys():
            spine_tc = sto.time_courses[spine_id]

            # calcium
            ca_tc = spine_tc['ca']
            plotCalcium(root, spine_id, ca_tc)
            
            # CaMKIIbar
            CaMKIIbar_tc = spine_tc['CaMKIIbar']
            plottingCaMKIIbar(root, spine_id, CaMKIIbar_tc)
            
        
        plotting_synaptic_weights(root, sto.synVecRefs)
 
        
 