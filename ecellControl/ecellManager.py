# Author Michele Mattioni
# Fri Jan 30 15:57:01 GMT 2009

#import ecell.Session as Session
import mySession as Session
import ecell.ecs
import ecell.config
import ecell.emc
import os
import numpy

class EcellManager():
    """Control and instatiate the ecell simulator embedding it in an handy python object"""
    
    def __init__(self, filename="../biochemical_circuits/biomd183.eml"):
        ecell.ecs.setDMSearchPath( os.pathsep.join( ecell.config.dm_path ) )
        self.sim = ecell.emc.Simulator()
        if ecell.config.version < '3.2.0':
            self.ses = Session.Session(self.sim, changeDirectory=False)
        else:
            self.ses = Session.Session(self.sim)
        
        # Load the model
        self.ses.loadModel(filename)
        self.molToTrack = ('ca','moles_bound_ca_per_moles_cam',
                           'Rbar','PP2Bbar','CaMKIIbar')
        # Tracking the calcium
        self.ca =  self.ses.createEntityStub( 'Variable:/Spine:ca' )
        self.CaMKIIbar = self.ses.createEntityStub( 'Variable:/Spine:CaMKIIbar' )
        
        
    def createLoggers(self):
        """Create the logger to track the speces"""
        loggers = {}
        #log = ecell.LoggerStub()
        
        for mol in self.molToTrack:
            
            loggers[mol]  = self.ses.createLoggerStub( "Variable:/Spine:" + mol 
                                                       + ":Value" )
            loggers[mol].create() # This creat the Logger Object in the backend
        
        self.loggers = loggers
        
    
    def calcium_peak(self, k_value, duration):
        """
        Mimic the calcium peak
        
        :Parameters
            k_value: the rate of calcium to enter
            duration: Duration of the spike
        """
        
        basal = self.ca_in['k']
        self.ca_in['k'] = k_value
        self.ses.run(duration)
        self.ca_in['k'] = basal
        
    def calciumTrain(self, spikes=30, interval=0.1):
        """Create a train of calcium with the specified number of spikes and interval
        
        :Parameter
            spikes: number of spikes
            interval: Interval between spikes
        """
        for i in range(spikes):
            self.calcium_peak(4.0e8, # Magic number from Lu
                         0.00001 #Really fast spike to avoid the overlap
                         )
            self.ses.run(interval)
    
    def plotTimeCourses(self, interval=None, save=False, dir=None):
        """Plot the default timecourses"""
        ca_tc = self.timeCourses['ca'] 
        pylab.figure()
        pylab.plot(ca_tc[:,0], ca_tc[:,1], label="Calcium")
        pylab.xlabel("Time [s]")
        pylab.legend(loc=0)
        if interval is not None:
            title = "Flux of Calcium Interval: %s [s]" %interval
            pylab.title(title)
        
        if save :
            pylab.savefig(os.path.join(dir, "caInput.png"))
            print "figure saved in: %s" % os.path.join(dir, "caInput.png")
        
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
        
        if save :
            pylab.savefig(os.path.join(dir, "PP2B_and_CaMKII_activation.png"))
            print "figure saved in: %s" % os.path.join(dir, 
                                                       "PP2B_and_CaMKII_activation.png")
        else:
            pylab.show()
        
    def converToTimeCourses(self):
        timeCourses = {}
        for key in self.loggers:
            timeCourses[key] = self.loggers[key].getData()
        
        self.timeCourses = timeCourses
        

        
##############################################
# Testing method

def testCalciumTrain(filename="../biochemical_circuits/biomd183.eml"):
    """Run a test simulation wit a train of calcium input"""
    
    print "Test the results of a train of calcium"""
    ecellManager = EcellManager(filename)
    ecellManager.createLoggers()
    ecellManager.ca_in = ecellManager.ses.createEntityStub('Process:/Spine:ca_in')
    print "Model loaded, loggers created. Integration start."
    ecellManager.ses.run(200)
    print "Calcium Train"
    ecellManager.calciumTrain(spikes=5, interval=0.005)
    ecellManager.ses.run(400)
    ecellManager.converToTimeCourses()
    print "CalciumTrain Test Concluded\n##################"
    return ecellManager
    




def testChangeCalciumValue(interval, caValue, filename="../biochemical_circuits/biomd183_noCalcium.eml"):
    """Run a test simulation changing the calcium value on the fly"""
    print "Show case of the possibilities to change the level of calcium on the fly"
    ecellManager = EcellManager(filename)
    ecellManager.createLoggers()
    print "Loggers created"
    print "Running with the updating interval of : %f" %interval
    
    tstop = 150
    while(ecellManager.ses.getCurrentTime() < tstop):
        ecellManager.ca['Value'] = caValue
        ecellManager.ses.run(interval)
        #ecellManager.ses.run(1)
        #print ecellManager.ses.getCurrentTime()
    
    print "immision of Calcium"
    print "Value of Calcium %f" %ecellManager.ca.getProperty('Value')
    spikes = 4
    for i in range(spikes):
        ecellManager.ca['Value'] = 7200
        ecellManager.ses.run(0.020)
        ecellManager.ca['Value'] = caValue
        ecellManager.ses.run(0.010)
    
    tstop = tstop+500
    while(ecellManager.ses.getCurrentTime() < tstop):
        ecellManager.ca['Value'] = caValue
        ecellManager.ses.run(interval)
        #ecellManager.ses.run(1)
        #print ecellManager.ses.getCurrentTime()
        
    ecellManager.converToTimeCourses()
    print "ChangeCalciumValue Test Concluded\n##################"
    return ecellManager
        
if __name__ == "__main__":
    
    import os
    from optparse import OptionParser
    usage= "usage: %prog [options] interval calciumValue.\n\
    Run the simulator using the interval [s] to update the calcium between different run\
    \ninterval - The interval between the stop of the simulators. Used to sample tha calcium\
    \ncalciumValue - The value of the calcium to pump into the system\
                      The frequency of the spike and the duration are hardcoded."
    parser = OptionParser(usage)
    parser.add_option("-s", "--save", action="store_true", 
                      help= "If True save the graphs and the log")

    (options, args) = parser.parse_args()
     
    
    if len(args) != 2:
        parser.error("Incorrect number of arguments")
        parser.usage()
    else:
        interval = float(args[0])
        caValue = float(args[1])
        print "Interval %f, Save option %s" %( interval, options.save)
    
    ## Setting the mat plotlib backend
    import matplotlib
    if options.save == True:
        matplotlib.use('Agg')
        print "Switching backend to Agg. Batch execution"
    import pylab
    import helpers     
    loader = helpers.Loader()

    #ecellManager = testChangeCalciumValue(interval, caValue)
    ecellManager = testCalciumTrain()
    
    if options.save == True:
        dir = loader.create_new_dir(prefix=os.getcwd())
        loader.save(ecellManager.timeCourses,  dir, "timeCourses")
        ecellManager.plotTimeCourses(interval, save=options.save, dir=dir)
        f = open(os.path.join(dir, 'log.txt'), 'w') 
        f.write("Test of the supply of the calcium to the biochemical model\n\
        Interval used in this simulation: %f\n" % (interval))
        f.close()
    else:
        ecellManager.plotTimeCourses()