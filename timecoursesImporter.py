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
        ca_tc = self.timeCourses['ca'] 
        pylab.figure()
        pylab.plot(ca_tc[:,0], ca_tc[:,1], label="Calcium")
        pylab.xlabel("Time [s]")
        pylab.legend(loc=0)
        if interval is not None:
            title = "Flux of Calcium Interval: %s [s]" %interval
            pylab.title(title)
        
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
        success = self.loadTimecourse()
        if success:
            interval = self.scanfile()
            if self.plot == True:
                self.plotTimeCourses(interval)

class Loader(object):
    """Just an handy loader"""
    
    def __init__(self):
        
        self.dirRoot = None 
        
    def create_new_dir(self, prefix="./"):
        """
            Create the directory where to put the simulation
        """
        self.dirRoot = os.path.join(prefix, "Sims")
        
        today = datetime.date.today()
        free = False
        index = 0
        
        dirDate = today.strftime("%d-%m-%Y")
        
        dirComp = os.path.join(self.dirRoot, dirDate)
        dir = os.path.join(dirComp, "Sim_" + str(index))
        while not free :
            if os.path.exists(dir):
                index = index + 1
                simNum = "Sim_" + str(index)
                dir = os.path.join(dirComp, simNum )
            else:
                free = True
                os.makedirs(dir)
        return dir
    
    def save(self, obj, dir, name):
        """ Save The object in binary form with the given name
        
        params:
        obj - The python object
        name - the name to give to the saved object"""
        
        filepath = os.path.join (dir, name)
        FILE = open(filepath, 'w')
        cPickle.dump(obj, FILE, 1)
        FILE.close()
        print "Python object saved in %s" %os.path.abspath(filepath)
    
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
    usage= "usage: %prog [options] path/to/dir_sim"
    parser = OptionParser(usage)
    parser.add_option("-p", "--plot", action="store_true", 
                      help= "If True will plot the graphs")
    
    (options, args) = parser.parse_args()
    
    if len(args) != 1:
        parser.error("Incorrect number of arguments")
        parser.usage()
    else:
        directory = args[0]
    
    visualBio = VisualizerBiochemical(directory, plot=options.plot)
    visualBio.main()
    
    # We extract the calcium_tc
    ca_tc = visualBio.timeCourses['ca']
    time = ca_tc[:,0] # time equal for everybody.
    ca_values = ca_tc[:,1]
    
    # We extract the CAMKII values
    CaMKIIbar_tc = visualBio.timeCourses['CaMKIIbar']
    CaMKIIbar_values = CaMKIIbar_tc[:,1]
    
    print "Loaded the values of Calcium and CAmKIIbar (active form)"
    
    