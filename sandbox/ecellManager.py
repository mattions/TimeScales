# Author Michele Mattioni
# Fri Jan 30 15:57:01 GMT 2009

import ecell.Session
import ecell.ecs
import ecell.config
import ecell.emc
import os
import numpy
import pylab

class EcellManager():
    
    def __init__(self, filename="../biochemical_circuits/biomd183.eml"):
        ecell.ecs.setDMSearchPath( os.pathsep.join( ecell.config.dm_path ) )
        self.sim = ecell.emc.Simulator()
        self.ses = ecell.Session.Session(self.sim)
        
        # Load the model
        self.ses.loadModel(filename)
        self.molToTrack = ('ca','moles_bound_ca_per_moles_cam',
                           'Rbar','PP2Bbar','CaMKIIbar')
        # Tracking the calcium
        self.ca =  self.ses.createEntityStub( 'Variable:/Spine:ca' )
    
    def createLoggers(self):
        """Create the logger to track the speces"""
        loggers = {}
        #log = ecell.LoggerStub()
        
        for mol in self.molToTrack:
            
            loggers[mol]  = self.ses.createLoggerStub( "Variable:/Spine:" + mol + ":Value" )
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
    
    def plotTimeCourses(self):
        
        ca_tc = self.loggers['ca'].getData() 
        pylab.figure()
        pylab.plot(ca_tc[:,0], ca_tc[:,1], label="Calcium")
        pylab.xlabel("Time [s]")
        pylab.legend(loc=0)
        
        bars = ['PP2Bbar', 'CaMKIIbar']
        pylab.figure()
        
        for bar in bars:
            bar_tc = self.loggers[bar].getData()
            pylab.plot(bar_tc[:,0], bar_tc[:,1], label=bar)
            pylab.xlabel("Time [s]")
            pylab.legend(loc=0)
        pylab.show()
        

        
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
    ecellManager.calciumTrain()
    ecellManager.ses.run(400)
    print "Integration concluded, Plotting..."
    ecellManager.plotTimeCourses()
    print "CalciumTrain Test Concluded\n##################"
    return ecellManager
    




def testChangeCalciumValue(filename="../biochemical_circuits/biomd183_noCalcium.eml"):
    """Run a test simulation changing the calcium value on the fly"""
    print "Show case of the possibilities to change the level of calcium on the fly"
    ecellManager = EcellManager(filename)
    ecellManager.createLoggers()
    print "Loggers created"
    ecellManager.ses.run(200)
    print "immision of Calcium"
    print "Value of Calcium %f" %ecellManager.ca.getProperty('Value')
    ecellManager.ca.setProperty('Value', 7200)
    print "Value of Calcium %f" %ecellManager.ca.getProperty('Value')
    ecellManager.ses.run(0.020)
    ecellManager.ca.setProperty('Value', 7)
    ecellManager.ses.run(200)
    ecellManager.plotTimeCourses()
    print "ChangeCalciumValue Test Concluded\n##################"
    return ecellManager
    


    
if __name__ == "__main__":

    ecellManager = testChangeCalciumValue()
    
    ecellManager2 = testCalciumTrain()
    
    
