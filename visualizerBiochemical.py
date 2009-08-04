# Author Michele Mattioni
# date Tue Aug  4 10:05:48 BST 2009

import re
import os

import pylab

import helpers


class VisualizerBiochemical(object):
    """Open a directory where the simulation is stored and replot the result with 
    the interval in the title""" 
    def __init__(self, directory, save=False):
        """Construct the Object
        
        :param directory: The directory where the sim results are stored.
        :param save: Boolean. False: graphs saved to the disk. 
                    True: graph showed"""
        
        self.directory = directory
        self.save = save
        l = helpers.Loader()
        self.timeCourses = l.load(os.path.join(self.directory, 'timeCourses'))
        ## Setting the mat plotlib backend
        
        
    def scanfile(self, file='log.txt'):
        """scan the file to get the interval
        
        :param file: File to scan"""
        for line in open(os.path.join(self.directory, file), 'r'):
            m = re.search('\d+\.\d+', line)
        interval = m.group(0)
        return interval
    
    def plotTimeCourses(self, interval=None):
        """Plot the default timecourses
        :param interval: Used in the title"""
        ca_tc = self.timeCourses['ca'] 
        pylab.figure()
        pylab.plot(ca_tc[:,0], ca_tc[:,1], label="Calcium")
        pylab.xlabel("Time [s]")
        pylab.legend(loc=0)
        if interval is not None:
            title = "Flux of Calcium Interval: %s [s]" %interval
            pylab.title(title)
        
        
        if self.save :
            pylab.savefig(os.path.join(self.directory, "caInput.png"))
            print "figure saved in: %s" % os.path.join(self.directory, "caInput.png")
        
        bars = ['PP2Bbar', 'CaMKIIbar']
        pylab.figure()
        for bar in bars:
            bar_tc = self.timeCourses[bar]
            pylab.plot(bar_tc[:,0], bar_tc[:,1], label=bar)
            pylab.xlabel("Time [s]")
            pylab.legend(loc=0)
            if interval is not None:
                title = "Flux of Calcium Interval: %s [s]" %interval
                pylab.title(title)
        
        if self.save :
            pylab.savefig(os.path.join(self.directory, "PP2B_and_CaMKII_activation.png"))
            print "figure saved in: %s" % os.path.join(self.directory, "PP2B_and_CaMKII_activation.png")
        else:
            pylab.show()
        
    def main(self):
        """Run the application"""
        interval = self.scanfile()
        self.plotTimeCourses(interval)

if __name__ == "__main__":
    from optparse import OptionParser
    usage= "usage: %prog [options] path/to/dir_sim"
    parser = OptionParser(usage)
    parser.add_option("-s", "--save", action="store_true", 
                      help= "If True save the graphs")
    
    
    
    (options, args) = parser.parse_args()
    
    if len(args) != 1:
        parser.error("Incorrect number of arguments")
        parser.usage()
    else:
        directory = args[0]
    
    import matplotlib
    if options.save:
        matplotlib.use('Agg')
        print "Switching backend to Agg. Batch execution"
    import pylab
    
    visualBio = VisualizerBiochemical(directory, save=options.save)
    visualBio.main()
         