# Author: Michele Mattioni
# Thu May 14 16:48:10 BST 2009

def logGeometry(dir, nrnSim):
    
    logFile = os.path.join(dir, 'log.txt')
    f = open(logFile, 'w')
    #Prox Dend
    f.write("Prox_Dend\n")
    for i,s in enumerate(nrnSim.h.MSP_Cell[0].Prox_Dend):
        line = "%d %f %f\n" %(i, s.L, s.diam)
        f.write(line)
    
    #Mid Dend
    f.write("Mid_Dend\n")
    for i,s in enumerate(nrnSim.h.MSP_Cell[0].Mid_Dend):
        line = "%d %f %f\n" %(i, s.L, s.diam)
        f.write(line)
    
    #Dist Dend
    f.write("Dist_Dend:\n")
    for i,s in enumerate(nrnSim.h.MSP_Cell[0].Dist_Dend):
        line = "%d %f %f\n" %(i, s.L, s.diam)
        f.write(line)
    #Spine
    f.write("Number of spines: %d\n" %len(nrnSim.spines))
    for spine in nrnSim.spines:
        line = "%s \n" %(spine.name)
        f.write(line)
        
    print "Log written in %s" %os.path.realpath(logFile)

def iClampExp(nrnSim, tstop):
    """Test the Iclamp model"""
    
    print "Test the IClamp one, no spines"
    vecs = {}
    vecs['t'] = h.Vector()
    vecs['t'].record(h._ref_t)
    vecs['v_soma'] = h.Vector()
    vecs['v_soma'].record(h.MSP_Cell[0].soma(0.5)._ref_v)
    vecs['v_dend'] = h.Vector()
    vecs['v_dend'].record(h.MSP_Cell[0].dend1_1[0](0.5)._ref_v)
    h.v_init =(-87.75)
    
    # Reverting to the old dimensions Used in the paper with no spines.
    # in the case we changed that
    for sec in h.MSP_Cell[0].Mid_Dend:
        sec.L= 24.23
        #sec.L= 15.0
        sec.diam = 1.10
    
    for sec in h.MSP_Cell[0].Dist_Dend:
        sec.L= 395.2
        #sec.L=390.0
        sec.diam = 0.72
        
    h.load_file(os.path.join(hoc_path,"iclamp_0.248.ses"))
    h.tstop = tstop
    h.run()
    print "Only the model with no spines attached"
    print "Reproduce the result on the Wolf 2005 paper"
    nrnSim.vecs = vecs
    nrnSim.h = h # Hoc Interpreter
    
    pylab.plot(nrnSim.vecs['t'], nrnSim.vecs['v_soma'])
    pylab.xlabel("Time [s]")
    pylab.ylabel("Voltage [mV]")
    pylab.title("iclamp exp 0.248 nA -- no spines -- No Correction")
    pylab.show()

    
def testDistSpines(nrnSim, tstop, batch, amplitude):
    """Test the distribution of the spines in the model."""

    vecs = {}
    g = helpers.Graph()
    spine1 = nrnSim.spines[0] #Grabbing the first one for testing
    vecs = g.createVecs(vecs, spine1, "v")
    vecs = g.createSpineSiblingVecs(nrnSim.spines, spine1, vecs, "v")
    print "Vectors Created: %d" %len (vecs)
    
    h.dt =0.005
    h.v_init =(-87.75)
    iclamp = nrnSim.iClampPointProcess(amp=amplitude)
    print "iClamp point processes created: amp: %f, delay: %f, duration: %f" %(iclamp.amp, iclamp.delay, iclamp.dur)
    
    g.vecs = vecs # Vectors dict
    nrnSim.g = g # Plotting facilities object
    nrnSim.h = h # Pointer to the hoc Intepreter
    nrnSim.iclamp = iclamp # To return the point process 
    
    if not batch:
        h.load_file(os.path.join(hoc_path, "runControl_somaVoltage.ses"))
        h.tstop = tstop
        
    else:
        # Execution on the Cluster with no display.
        h.tstop = tstop
        h.run()
        loader = helpers.Loader()
        # Converting to numpy so I can save it
        g.t = numpy.array(g.t)
        g.vecs = loader.convertToNumpy(g.vecs)
        dir = loader.saveObj(g, "graphObj.pickle")
        
        # Saving the dend results
        dendAndSomaVecs = g.vecsSubSelection(vecs, "spine", matching=False)
        g.plotVoltage(dendAndSomaVecs)
        pylab.title("iClamp_%s" % iclamp.amp)
        figureName = "dendAndSoma_iClamp_%s.png" % iclamp.amp
        pylab.savefig(os.path.join(dir,figureName))
        print "figure Saved in %s" %os.path.realpath(os.path.join(dir,figureName))
        
        # Saving the spines results
        spinesVecs = g.vecsSubSelection(vecs, "head")
        g.plotVoltage(spinesVecs)
        figureName = "spines_iClamp_%s.png" % iclamp.amp
        pylab.savefig(os.path.join(dir,figureName))
        print "figure Saved in %s" %os.path.realpath(os.path.join(dir,figureName))
        
        logGeometry(dir, nrnSim)

def testSpineInput():
    """Method to test an ESPS in the spine and the result in the soma"""
    spine1 = nrnSim.spines[0]
    ampa = spine1.synapses['ampa']
    ampa.netStim.start = 60
    ampa.netStim.number = 1
    print spine1.name
    h.run()
    nrnSim.g.plotVoltage(nrnSim.g.vecs)
    return spine1


if __name__ == "__main__":

    from optparse import OptionParser
    import os
    
    usage= "usage: %prog [options] tstop"
    parser = OptionParser(usage)
    parser.add_option("-b", "--batch", action="store_true", default=False, 
                      help= "Run in batch mode. No gui is shown")
    
    parser.add_option("-a", "--amplitude", default=0.248, 
                  help= "The intensity of the iClamp experiment. Default is 0.248")
    
    parser.add_option("-n", "--nospines", action="store_true", default=False, 
                  help= "Run the test without spines in the neuron")
    
    
    (options, args) = parser.parse_args()
    
    # Checking the correct num of args
    
    if len(args) != 1:
        parser.error("Incorrect number of arguments")
        parser.usage()
    else:
        tstop = float (args[0])
    
    # Processing the options
    
    if options.batch:
        import matplotlib
        matplotlib.use('Agg')
        os.system("bash -c 'unset DISPLAY'") # Unsetting the display to import neuron in batch mode
        print "Switching backend to Agg. Batch execution"
    else:
        import neuron.gui
    
    from neuron import h        
    import pylab
    import neuronControl as nC
    import helpers
    import numpy
    
    hoc_path = "hoc"
    mod_path="mod"
    nrnSim = nC.NeuronSim(mod_path=mod_path, hoc_path=hoc_path)
    nrnSim.distributeSpines()
    
        
    if options.nospines:
        import neuronControl as nC
        nC.nrnSim = iClampExp(tstop)
    else:
        testDistSpines(nrnSim,tstop, batch=options.batch, amplitude=options.amplitude)
    
    # Introduce an option for one spine only.    
    #spine = testSpineInput()