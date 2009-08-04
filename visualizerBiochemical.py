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
        
    def loadTimecourse(self):
        """Load the timecourses numpy object"""
        l = helpers.Loader()
        success = True
        try:
            self.timeCourses = l.load(os.path.join(self.directory, 'timeCourses'))
        except IOError:
            success = False
            print "IMPORT ERROR: timeCourse not well formed.\
             Skipping %s" % self.directory
        return success
        
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
            #zoom 1
            pylab.xlim((149.8, 151))
            pylab.savefig(os.path.join(self.directory, "caInput_zoom1.png"))
            #zoom 2
            pylab.xlim((160.0, 161.0))
            pylab.ylim((6,15))
            pylab.savefig(os.path.join(self.directory, "caInput_zoom2.png"))
        
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
    
    def write_interval(self, interval):
        open(os.path.join(self.directory, interval), 'w')
        
    def main(self):
        """Run the application"""
        success = self.loadTimecourse()
        if success:
            interval = self.scanfile()
            self.plotTimeCourses(interval)
            self.write_interval(interval)

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
         