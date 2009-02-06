# Author: Michele Mattioni
# Wed Nov 12 17:50:52 GMT 2008

import COPASI
import numpy
import pylab

class COPASISim:
    """Wrapper Class to use the COPASI Simulator"""
    def __init__(self, filename="testSimple.xml"):
        """Load the SBML file"""
        self.datamodel = COPASI.CCopasiDataModel.GLOBAL
        # BUG submitted
        # Complex path not submitted ex.: biochemical_circuits/testSimple.xml
        # http://www.copasi.org/tracker/show_bug.cgi?id=1112
        #filename = "testSimple.xml" 
        self.datamodel.importSBML(filename)
        
        
    def advance(self, tStop, initialCondition = False):
        """Advanced the simulation until tStepStop
            :param:
                tStepStop 
                    Final Step up to the simulation has to run
                initialCondition
                    Boolean value: True use initial condition 
                    False extend the model
                
            return
                timeSeries: COPASI data structure that holds the simulation result
            
        """
        task = self.getTask()
        if (task != None):
            self.problem = task.getProblem()
            # Storing everything in memory
            timesSeriesRequest = self.problem.getParameter("TimeSeriesRequested")
            timesSeriesRequest.setValue(True)

#             #NumSteps

                
            if (task.setMethodType(COPASI.CCopasiMethod.deterministic)):
                # setting the parameters
                self.setDuration(tStop)
                task.process(initialCondition) #Using intial values
                return task.getTimeSeries()
            else:
                print "The simulation was not performed, the method was not available\n"
    
    def setNumTimeStep(self, numTimeStep):
        numSteps = self.problem.getParameter("StepNumber")
        if numSteps  != None:
            numSteps.setIntValue(numpy.int( numTimeStep))
            print "Number of StepNumber %d" %numSteps.getValue()
        
    def setDuration(self, tStop):
        duration = self.problem.getParameter("Duration")
        if (duration != None):
            
            duration.setDblValue(tStop) #Forced cast
            print duration, duration.getValue()
            print "TStop for the simulation %f, value of Duration: %f" \
            % (tStop, duration.getValue())
            #BUG: http://www.copasi.org/tracker/show_bug.cgi?id=1113
            
            nTimeStep = tStop * 100                  
            self.setNumTimeStep(nTimeStep)
        
    def getTask(self, taskType=COPASI.CCopasiTask.timeCourse):
        """Iterate over all the task available
            task: return the task
        """
        i = 0
        
        iMax = self.datamodel.getTaskList().size()
        task = None

        while (i < iMax):
            
            if (self.datamodel.getTask(i).getType() == taskType) :
                task = self.datamodel.getTask(i)
                return task
            i += 1
            
            # TODO Raise an Error if the task is not found or return None?
    
    def createVector(self, timeSeries, useConc=True):
        """Data vector in numpy
        The shape steps x (row) and num of variables (column)
        
        :Parameters
            timeSeries: the timeSeries to conver in numpy format
        """
        variables = timeSeries.getNumVariables()
        steps = timeSeries.getRecordedSteps()
        data = numpy.zeros( (steps, variables) ) 
        for var in xrange(variables): #iterate over the values
            for step in xrange(steps): #iterate over the time
                if useConc:
                    data[step,var] = timeSeries.getConcentrationData(step, var)
                else:
                    data[step,var] = timeSeries.getData(step, var)
                
        return data

    def plotSim(self, data ):
        """
        Just to plot some interesting data
        """
        pylab.plot(data[:,0],data[:,1])
        pylab.plot(data[:,0],data[:,2])
        pylab.plot(data[:,0],data[:,3])
        
    def createSBML2Var(self, timeSeries):
        """Get the species of the SBML we want to plot"""
        # We build a dictionary to do that
        sbmlId2Var = {}
        variables = timeSeries.getNumVariables()
        for var in range(variables):
            sbmlId = timeSeries.getSBMLId(var)
            sbmlId2Var[sbmlId] = var
        self.sbmlId2Var = sbmlId2Var # store as class attribute
        
        
        
        
    def createGraph(self, tStop, initialCondition):
        """
        Main routine to plot the simulation data
        
        :params:
            tStop 
                The duration of the simulation
            initialCondition
                If the simulation has to be extended or has to be restarted.
        """
        timeSeries = self.advance(tStop, initialCondition)
        data = self.createVector(timeSeries)
        self.plotSim(data)
        return data
    
    def plotSBMLId(self, data, sbmlId, name):
        """Plot the sbmlId"""
        time = data[:,0] # Selecting the column of the time
        var = data[:,self.sbmlId2Var[sbmlId]] # Selecting the column of the sbml var
        pylab.plot(time,var, label = name)
        
    def stackData(self, data, data2):
        """Stacking data together"""
        dataTot = numpy.vstack((data, data2))
        return dataTot
    
    def updateModel(self, data):
        pass
    
if __name__ == "__main__":
    
    def plotSpecies(interestingSpecies, data):
        for sbmlId, name in interestingSpecies.iteritems():
            cop.plotSBMLId(data, sbmlId, name)
            
            
    cop = COPASISim(filename="BIOMD0000000183.xml")
    interestingSpecies = {"parameter_28" : "CaMKIIbar",
                          "parameter_34": "PP2Bbar",
                          "species_1" : "Ca"
                          }
    
    timeSeries = cop.advance(10, initialCondition=True)
    cop.createSBML2Var(timeSeries)
    data = cop.createVector(timeSeries)
    plotSpecies(interestingSpecies, data)
    
    
    ## Insert the Calcium
    model = cop.datamodel.getModel()

    
#    timeSeries2 = cop.advance(5)
#    data2 = cop.createVector(timeSeries2)
#    
#    dataTot = cop.stackData(data, data2)
#    plotSpecies(interestingSpecies, dataTot)
    
    
    
    pylab.show()
    

    