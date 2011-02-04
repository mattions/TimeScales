# Author Michele Mattioni
# date Tue Aug  4 10:05:48 BST 2009

import re
import os
import cPickle
import datetime

import pylab

#import helpers


class VisualizerBiochemical(object):
    """Open a directory where the simulation is stored and replot the result with 
    the interval in the title""" 
    def __init__(self, directory, plot=False):
        """Construct the Object
        
        :param directory: The directory where the sim results are stored."""
        
        self.directory = directory
        self.plot = plot
        self.main()
        
        
    def loadTimecourse(self):
        """Load the timecourses numpy object"""
        l = Loader()
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
        try:
            for line in open(os.path.join(self.directory, file), 'r'):
                m = re.search('\d+\.\d+', line)
            interval = m.group(0)
            self.interval = interval
            return interval
        except IOError:
            print "No interval present."
    
    def plotTimeCourses(self, interval=None):
        """Plot the default timecourses
        :param interval: Used in the title"""
        
        # Plotting the Calcium 
        pylab.figure()
        pylab.plot(self.time, self.ca_values, label="Calcium")
        pylab.xlabel("Time [s]")
        pylab.legend(loc=0)
        if interval is not None:
            title = "Flux of Calcium Interval: %s [s]" %interval
            pylab.title(title)
        
        
        # Plotting the CamKII
        pylab.figure()
        pylab.plot(self.time , self.CaMKIIbar_values, label='CaMKIIbar')
        pylab.xlabel("Time [s]")
        pylab.legend(loc=0)
        if interval is not None:
            title = "Flux of Calcium Interval: %s [s]" %interval
            pylab.title(title)
        pylab.show()
        
    def main(self):
        """Run the application"""
        success = self.loadTimecourse()
        if success:
            interval = self.scanfile()
            # We extract the calcium_tc
            self.ca_tc = self.timeCourses['ca']
            self.time = self.ca_tc[:,0] # time equal for everybody.
            self.ca_values = self.ca_tc[:,1]
    
            # We extract the CAMKII values
            self.CaMKIIbar_tc = self.timeCourses['CaMKIIbar']
            self.CaMKIIbar_values = self.CaMKIIbar_tc[:,1]
            if self.plot == True:
                self.plotTimeCourses(interval)

class Loader(object):
    """Just an handy loader"""
    def __init__(self):
        pass
    
    def load(self, filename):
        """Load the python object into memory from the filename
        
        params:
        filename - path to the binary python object"""
        
        FILE = open(filename, 'r')
        obj = cPickle.load(FILE)
        FILE.close()
        print "loaded file %s" %os.path.abspath(filename)
        return obj
                
                
if __name__ == "__main__":
    from optparse import OptionParser
    usage= """usage: %prog [options] path/to/dir_sim or 
    %progs [options] path/to/dir_sim1 path/to/dir_sim_2
    
    To load the two timecourses pass both the directory where
     the simulations' results are stored."""
     
    parser = OptionParser(usage)
    parser.add_option("-p", "--plot", action="store_true", 
                      help= "If True will plot the graphs")
    
    (options, args) = parser.parse_args()
    
    if len(args) == 1:
        directory = args[0]
        visualBio = VisualizerBiochemical(directory, plot=options.plot)
        
    elif len(args) == 2:
        visualBio1 = VisualizerBiochemical(args[0], plot=options.plot)
        visualBio2 = VisualizerBiochemical(args[1], plot=options.plot)
        
        # You can access to values from the object:
        print """Loaded two simulations results in the objects:
        visualBio1 and visualBio2"""
        
        print """visualBio1: 
        Time in variable %s,
        Calcium values in the variable %s, 
        CaMKIIbar values in the variable %s""" %(visualBio1.time,
                                                     visualBio1.ca_values,
                                                     visualBio1.CaMKIIbar_values)
        print """visualBio2: 
        Time in variable %s,
        Calcium values in the variable %s, 
        CaMKIIbar values in the variable %s""" %(visualBio1.time,
                                                     visualBio1.ca_values,
                                                     visualBio1.CaMKIIbar_values)
        
    else:
        parser.usage()
    
    
    