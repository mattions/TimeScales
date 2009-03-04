# Author: Michele Mattioni
# Wed Feb 11 17:34:02 GMT 2009

import os
import ctypes as CT
import numpy
import pylab


class SOSWrap:
    """Wrapper class built around the SBMLOdeSolver Library"""
    
    def __init__(self):
        
        # in theory this whole thing should be platform independent
        # note: Change the name of the library
        if os.sys.platform == 'win32':
            print 'Opening windows.'
            self.soslib = CT.CDLL('c://windows//system32//libODES.dll')
        # Also available for MacOS although I don't know all the details.
        # if you are using a Mac please check the results of 'os.sys.platform'
        # and set your absolute path to libsbml3 and let me know if it works
        elif os.sys.platform == 'darwin' or os.name == 'mac':
            print 'Here be apples.'
            self.soslib = CT.CDLL('/usr/lib/libODES.dylib', CT.RTLD_GLOBAL)
        else:
            print 'Here be penguins.'
            self.soslib = CT.CDLL('/usr/local/lib/libODES.so')
        self.setReturnType()
            
        
        ########################################################
    
    def setReturnType(self): 
        """Set the return type in an appropriate way"""
        
        self.soslib.TimeCourse_getName.restype = CT.c_char_p # Return a string
        self.soslib.TimeCourse_getValue.restype = CT.c_double # Return a double
        self.soslib.IntegratorInstance_getVariableValue.restype = CT.c_double
        self.soslib.IntegratorInstance_getTime.restype = CT.c_double
    
    
    
        
    def retrieveTimecourses(self, results, sbmlId):
        """Return the time and the values of the sbml Variable.
        :Parameter
            results: the integration results
            sbmlId: the sbml variable to retrieve
        :Return
            timecourse: numpy array with: 
                first column: the time points
                second column: the values"""
            
        timeCourse = self.soslib.SBMLResults_getTimeCourse(results, sbmlId)
        timePoints = self.soslib.TimeCourse_getNumValues(timeCourse)
        #print "number of timepoints: %d" %timePoints
        
        values = []
    
        for i in range(timePoints):
            values.append(self.soslib.TimeCourse_getValue(timeCourse, CT.c_int(i)))
        time = numpy.arange(timePoints)
        
        val = numpy.array(values)
        return numpy.column_stack((time, val)) # timecourse
        
        
    def changeValue(self, odemodel, settings, var_idx):
        print "Creating the integrator instance"
        integratorInstance = self.soslib.IntegratorInstance_create(odeModel, settings)
        
        vars = var_idx.keys()
        vars_val = {}
        for var in vars:
            vars_val[var] = []
        printstep = self.soslib.CvodeSettings_getPrintsteps(settings)
        #caInput = calciumTrain(6000)
        
        print "integration running till: %d" %printstep
        #print caInput
        for i in range (printstep):
            self.soslib.IntegratorInstance_setVariableValue(integratorInstance, var_idx["species_1"], 
                                                            CT.c_double(0.0))
            self.soslib.IntegratorInstance_integrateOneStep(integratorInstance)
            
            #Calcium conc coming from the conc.
            #self.soslib.IntegratorInstance_setVariableValue( integratorInstance, var_idx["species_1"], 
            #calciumDynamics(i, caInput))
            
        #print s1_value, self.soslib.IntegratorInstance_getTime(integratorInstance)
    #        if i == 5000:
    #           self.soslib.IntegratorInstance_setVariableValue(integratorInstance, var_idx["species_1"], CT.c_double(0.008))
           # if i in caInput:
             #   self.soslib.IntegratorInstance_setVariableValue(integratorInstance, var_idx["species_1"], CT.c_double(0.08))
            #    print "input Calcium at time: %d" %i
    #            
            for var in var_idx:
                var_value = self.soslib.IntegratorInstance_getVariableValue(integratorInstance, 
                                                                              var_idx[var])
                vars_val[var].append(var_value)
    
            
        print "Out of the for loop"
        self.soslib.IntegratorInstance_dumpSolver(integratorInstance)
        return vars_val
    
    def plotVars(self, vars_val, endTime, resolution):
        """Plot the results."""
        printstep = endTime * resolution
        time = numpy.arange(printstep)
        time_in_sec = time/ float(resolution)
        # The Bars    
        bars = ['PP2Bbar', 'CaMKIIbar']
        for bar in bars:
            var_tc = numpy.array(vars_val[name2id[bar]])
            pylab.plot(time_in_sec, var_tc, label=bar)
        pylab.title("Activation of PP2B and CamKII")
        pylab.xlabel("Time [s]")
        pylab.legend(loc=0)
        
        # Calcium input
        pylab.figure()
        var_tc = numpy.array(vars_val[name2id['Ca']])
        pylab.plot(time_in_sec, var_tc, label='Ca')
        pylab.title("Calcium input")
        pylab.xlabel("Time [s]")
        pylab.legend(loc=0)
        
        pylab.show()
        
    def calciumTrain(self, start, spikes=30, interval=100):
        caInput = [start]
        for spike in range(spikes):
            caInput.append(caInput[-1] + interval)
        return caInput
    
    def calciumDynamics(self, t, caInput):
        if t in caInput:
            pass
            

    def calciumSpike(self):
        ca_tc =[]
        for t in range(100):
            ca = self.calciumPeak(7200, t, k)
            ca_tc.append(ca_tc)
        return ca_tc
    
    def calciumPeak(self, ca0, t, k = 4.0e8):
        """
        7200 molecules have to go in.
        Simple exponential decay
        k coming from Lu model"""
        
        ca = ca0 * k  * pylab.exp(-t)
        return ca
        
    def setSettings(self, endtTime, resolution):
        settings = self.soslib.CvodeSettings_create()
        
        printstep = endTime * resolution
        self.soslib.CvodeSettings_setTime(settings, CT.c_double(endTime), 
                                            CT.c_int(printstep))
        
        absoluteErrorTollerance = CT.c_double(1e-9)
        relativeErrorTollerance = CT.c_double(1e-4)
        mxStep = CT.c_int(1000)
        self.soslib.CvodeSettings_setErrors(settings, absoluteErrorTollerance, 
                                              relativeErrorTollerance, mxStep)
        self.soslib.CvodeSettings_setSwitches(settings, 1, 0, 0, 0, 1, 0, 0)
        return settings    
    
if __name__ == "__main__":
    sosWrap = SOSWrap()
    id2name = {"parameter_28" : "CaMKIIbar", 
               "parameter_34" : "PP2Bbar",
               "species_1" : "Ca"
                              }
    name2id = {"CaMKIIbar" : "parameter_28", 
               "PP2Bbar" : "parameter_34",
               "Ca" : "species_1"
                              }


    filename="../biochemical_circuits/BIOMD0000000183_altered.xml"
    #filename="../biochemical_circuits/BIOMD0000000183_altered_no_Calcium.xml"
    variables = id2name.keys()
    
    #filename="../biochemical_circuits/testSimple.xml"
    #variables = ["s1","s3"]

    odeModel = sosWrap.soslib.ODEModel_createFromFile(filename)

    var_idx = {}
    for var in variables:
        var_idx[var] = sosWrap.soslib.ODEModel_getVariableIndex(odeModel, var)
    
    endTime = 100
    resolution = int(1e3) # This determine the timesteps of the model. 1e3 = ms
    settings = sosWrap.setSettings(endTime, resolution)
    vars_val = sosWrap.changeValue(odeModel, settings, var_idx)
    printstep = sosWrap.soslib.CvodeSettings_getPrintsteps(settings)
    sosWrap.plotVars(vars_val, endTime, resolution)
    
    caInput = sosWrap.calciumTrain(30, 10, 12)
    ca_tc = []
    time = numpy.arange(10000)
    
    for t in time:
        ca = sosWrap.calciumDynamics(t, caInput)
        ca_tc.append(ca)
    