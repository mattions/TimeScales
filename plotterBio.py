import helpers
import os
import sys

import matplotlib
matplotlib.use('Agg')
import pylab


top = sys.argv[1] 

for root, dirs, files in os.walk(top, topdown=False):
    if len(dirs) == 0:
        l = helpers.Loader()
        try:
            sto = l.load(root +"/storage")
        except:
            pass
        spine1_tc = sto.time_courses['spine1']
        ca_tc = spine1_tc['ca']
        ca_molecules = ca_tc[:,1]
        
        ca_conc = ca_molecules / (0.11 * 1e-15 * 6.022 * 1e23)
        ca_conc = ca_conc * 1e3 # Transform in mM]
        
        pylab.figure()
        pylab.plot(ca_tc[:,0], ca_conc)
        pylab.ylabel("Concentration [mM]")
        pylab.xlabel("Time [s]")
        pylab.savefig(root + "/calcium_tc.png")
        
        pylab.figure()
        CaMKIIbar_tc = spine1_tc['CaMKIIbar']
        pylab.plot(CaMKIIbar_tc[:,0], CaMKIIbar_tc[:,1], label='CaMKIIbar')
        pylab.ylabel("Occupied fraction")
        pylab.xlabel("Time [s]")
        pylab.savefig(root + '/CamKIIbar.png')
        
        for synVec in sto.synVecsRefs:
            pylab.figure()
            pylab.plot(synVec.syn_vecs['weight'])
            pylab.xlabel("Time [ms]")
            pylab.ylabel("Synapse's Weight")
            t= "%s %s" %(synVec.section_name, synVec.chan_type)
            pylab.title()
            pylab.savefig(t + ".png")