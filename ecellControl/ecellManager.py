# Author Michele Mattioni
# Fri Jan 30 15:57:01 GMT 2009

import ecell.Session as Session
#import mySession as Session
import ecell.ecs
import ecell.config
import ecell.emc
import os
import numpy
from sumatra.external.NeuroTools import parameters

class EcellManager():
    """Control and instatiate the ecell simulator embedding it in an handy python object"""
    
    def __init__(self, filename=None):
        ecell.ecs.setDMSearchPath( os.pathsep.join( ecell.config.dm_path ) )
        self.sim = ecell.emc.Simulator()
        if ecell.config.version < '3.2.0':
            self.ses = Session.Session(self.sim, changeDirectory=False)
        else:
            self.ses = Session.Session(self.sim)
        
        # Load the model
        self.ses.loadModel(filename)
        self.molToTrack = ('ca',
                           'moles_bound_ca_per_moles_cam',
                           'Rbar',
                           'PP2Bbar', 
                           'CaMKIIbar', 
                           'PP1abar', # Active PP1/Total PP1
                           'AMPAR', # 
                           'AMPAR_P'
                           )
        # Tracking the calcium
        self.ca =  self.ses.createEntityStub( 'Variable:/Spine:ca' )
        self.CaMKIIbar = self.ses.createEntityStub( 'Variable:/Spine:CaMKIIbar' )
        self.ampar_P = self.ses.createEntityStub('Variable:/Spine:AMPAR_P')
        
        
    def createLoggers(self):
        """Create the logger to track the speces"""
        loggers = {}
        #log = ecell.LoggerStub()
        
        for mol in self.molToTrack:
            
            loggers[mol]  = self.ses.createLoggerStub( "Variable:/Spine:" + mol 
                                                       + ":Value" )
            loggers[mol].create() # This creat the Logger Object in the backend
        
        self.loggers = loggers
        
        
    def calcWeight(CaMKIIbar, PP2Bbar, alpha, beta, n=3, k=0.5):
        """Calc the weight of the synapses according to the CaMKII and Pospahtases
        PP2B and PP1"""
    
        # CaMKII term
        CaMKII_factor = math.pow(CaMKIIbar, n) / (math.pow(k, n) + 
                                                  math.pow(CaMKIIbar, n))
        Phosphatase_factor = math.pow(PP2Bbar, n) / (math.pow(k, n) + 
                                                     math.pow(PP2Bbar, n))
        scaled_CaMKII_factor = alpha * CaMKII_factor
        scaled_Phospatese_factor = beta * Phosphatase_factor 
        weight = 1 + scaled_CaMKII_factor - scaled_Phospatese_factor
        s = "Weight: %s CaMKII factor %s, Phosphatase factor %s" %(weight,
                                                                   scaled_CaMKII_factor,
                                                                   scaled_Phospatese_factor)
        return weight
        
    
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
        
    def converToTimeCourses(self):
        timeCourses = {}
        for key in self.loggers:
            timeCourses[key] = self.loggers[key].getData()
        
        self.timeCourses = timeCourses
        

        
##############################################
# Testing method

def testCalciumTrain(spikes_number, interval, filename):
    """Run a test simulation wit a train of calcium input"""
    
    print "Test the results of a train of calcium"""
    ecellManager = EcellManager(filename)
    ecellManager.createLoggers()
    ecellManager.ca_in = ecellManager.ses.createEntityStub('Process:/Spine:ca_in')
    print "Model loaded, loggers created. Integration start."
    ecellManager.ses.run(300)
    print "Calcium Train"
    ecellManager.calciumTrain(spikes=spikes_number, interval=interval)
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
    print "ChangeCalciumValue Test Concluded"
    return ecellManager

def plotTimeCourses(timeCourses, save=False, dir=None):
     """Plot the default timecourses"""
     import matplotlib.pyplot as plt
     ca_tc = timeCourses['ca'] 
     plt.figure()
     plt.plot(ca_tc[:,0], ca_tc[:,1], label="Calcium")
     plt.xlabel("Time [s]")
     plt.legend(loc=0)
     
     if save :
         plt.savefig(os.path.join(dir, "caInput.png"))
         print "figure saved in: %s" % os.path.join(dir, "caInput.png")
     
     bars = ['PP2Bbar', 'CaMKIIbar', 'PP1abar']
     plt.figure()
     for bar in bars:
         bar_tc = timeCourses[bar]
         plt.plot(bar_tc[:,0], bar_tc[:,1], label=bar)
         plt.xlabel("Time [s]")
         plt.legend(loc=0)
     
     if save :
         plt.savefig(os.path.join(dir, "PP2B_and_CaMKII_activation.png"))
         print "figure saved in: %s" % os.path.join(dir, 
                                                    "PP2B_and_CaMKII_activation.png")



        
def plotWeight(timecourses, dir=None):
    import matplotlib.pyplot as plt
    scaled_CaMKII = []
    time = timecourses['AMPAR'][:,0] # time equal for everything



    plt.figure()
    plt.plot(time, timecourses['AMPAR_P'][:,1], label='AMPAR_P')
    #plt.plot(time, weight_baseline, label='w_b')
    title = "AMPA weight, calculated from E-Cell"
    plt.title(title)
    plt.legend(loc=0)
    if dir is not None:
        plt.savefig(os.path.join(dir, "weight.png"))
    plt.plot(time, timecourses['AMPAR'][:,1], label='AMPAR')
    plt.legend(loc=0)
    if dir is not None:
        plt.savefig(os.path.join(dir, "weight_both.png"))
        
if __name__ == "__main__":
    
    import sys
    if len(sys.argv) != 2:
        print("No parameter file supplied. Abort.")
        usage = 'python ecellManager.py ecellControl.param'
        print usage
        sys.exit()
        
    parameter_file = sys.argv[1]
    param = parameters.ParameterSet(parameter_file)
    
    ## Setting the mat plotlib backend
    import matplotlib
    if param['interactive'] == False:
        matplotlib.use('Agg')
        print "Switching backend to Agg. Batch execution"
    import matplotlib.pyplot as plt
    import helpers
    loader = helpers.Loader()

#    ecellManager = testChangeCalciumValue(interval, caValue)
    if param['running_type'] == 'train':
        ecellManager = testCalciumTrain(param['num_spikes'],
                                        param['delay'],
                                        param['biochemical_filename'])
    

    
    if param['interactive'] == False:
        dir = loader.create_new_dir(prefix=os.getcwd())
        loader.save(ecellManager.timeCourses,  dir, "timeCourses")
        plotTimeCourses(ecellManager.timeCourses, save=True, dir=dir)
        plotWeight(ecellManager.timeCourses, dir=dir)
    else:
        plotTimeCourses(ecellManager.timeCourses)
        plotWeight(ecellManager.timeCourses)
        plt.show()
