# Author Michele Mattioni
# Mon May 18 14:25:41 BST 2009



class Visualizer(object):
    
    def __init__(self, graphObj):
        import helpers 
        l = helpers.Loader()
        self.g = l.loadObj(graphObj)
    
    def showSim(self):
        # Saving the dend results
        dendAndSomaVecs = self.g.vecsSubSelection(self.g.vecs, "spine", matching=False)
        self.g.plotVoltage(dendAndSomaVecs, drawLegend=False)
        
        
        # Saving the spines results
        spinesVecs = self.g.vecsSubSelection(self.g.vecs, "head")
        self.g.plotVoltage(spinesVecs, drawLegend=False)
    
    
if __name__ == "__main__":
    
    
    from optparse import OptionParser
    import os
    import pylab
    
    usage= "usage: %prog [options] path/to/graphObj.pickle"
    parser = OptionParser(usage)
    
    
    (options, args) = parser.parse_args()
    
    if len(args) != 1:
        parser.error("Incorrect number of arguments")
        parser.usage()
    else:
        graphObj = args[0]
    
    visualizer = Visualizer(graphObj)
    visualizer.showSim()
    pylab.show()
    