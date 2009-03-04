# Author: Michele Mattioni
# Wed Feb 11 17:34:02 GMT 2009

import os
import ctypes as CT
import numpy
import pylab

# in theory this whole thing should be platform independent
# note: Change the name of the library
if os.sys.platform == 'win32':
    print 'Opening windows.'
    sbmlOdeSolver = CT.CDLL('c://windows//system32//libODES.dll')
# Also available for MacOS although I don't know all the details.
# if you are using a Mac please check the results of 'os.sys.platform'
# and set your absolute path to libsbml3 and let me know if it works
elif os.sys.platform == 'darwin' or os.name == 'mac':
    print 'Here be apples.'
    sbmlOdeSolver = CT.CDLL('/usr/lib/libODES.dylib', CT.RTLD_GLOBAL)
else:
    print 'Here be penguins.'
    sbmlOdeSolver = CT.CDLL('/usr/local/lib/libODES.so')
    

########################################################

def setReturnType(): 
    """Set the return type in an appropriate way"""
    
    sbmlOdeSolver.TimeCourse_getName.restype = CT.c_char_p # Return a string
    sbmlOdeSolver.TimeCourse_getValue.restype = CT.c_double # Return a double
    sbmlOdeSolver.IntegratorInstance_getVariableValue.restype = CT.c_double
    sbmlOdeSolver.IntegratorInstance_getTime.restype = CT.c_double

def loadModel(filename):
    """Parse the SBML model
    return the doc handle to the model"""
    # Parsing the model with sbml library
    sbmlReader = sbmlOdeSolver.SBMLReader_create()
    doc = sbmlOdeSolver.SBMLReader_readSBML(sbmlReader, filename)
    return doc

def settingIntegrationParameter(time, printstep):
    """Set the integration parameters and the integration time"""
    settings = sbmlOdeSolver.CvodeSettings_create()
    print time, printstep
    sbmlOdeSolver.CvodeSettings_setTime(settings, CT.c_double(time), CT.c_int(printstep) )
    absoluteErrorTollerance = CT.c_double(1e-9)
    relativeErrorTollerance = CT.c_double(1e-4)
    mxStep = CT.c_int(1000)
    sbmlOdeSolver.CvodeSettings_setErrors(settings, absoluteErrorTollerance, 
                                          relativeErrorTollerance, mxStep)
    sbmlOdeSolver.CvodeSettings_setCompileFunctions(settings, CT.c_int(1))
    sbmlOdeSolver.CvodeSettings_dump(settings)
    return settings
    
  #calling the SBML ODE Solver which returns SBMLResults
def getResults(doc, settings):
    """get all the results for the integration"""
    results = sbmlOdeSolver.SBML_odeSolver(doc, settings)
    
    if results ==  False:
        print "Integration not sucessful!\n"
        print sbmlOdeSolver.SolverError_dumpAndClearErrors()
        #return sbmlOdeSolver.EXIT_FAILURE
    else:
        sbmlOdeSolver.SolverError_dumpAndClearErrors()
        return results
    
def retrieveTimecourses(results, sbmlId):
    """Return the time and the values of the sbml Variable.
    :Parameter
        results: the integration results
        sbmlId: the sbml variable to retrieve
    :Return
        timecourse: numpy array with: 
            first column: the time points
            second column: the values"""
        
    timeCourse = sbmlOdeSolver.SBMLResults_getTimeCourse(results, sbmlId)
    timePoints = sbmlOdeSolver.TimeCourse_getNumValues(timeCourse)
    #print "number of timepoints: %d" %timePoints
    
    values = []

    for i in range(timePoints):
        values.append(sbmlOdeSolver.TimeCourse_getValue(timeCourse, CT.c_int(i)))
    time = numpy.arange(timePoints)
    
    val = numpy.array(values)
    return numpy.column_stack((time, val)) # timecourse
    
def integrate(filename, time, printstep, variables):
    """Integrate a model"""
    setReturnType()
    doc = loadModel(filename)
    settings = settingIntegrationParameter(time, printstep)
    results = getResults(doc, settings)
    plotTimeCourses(results, variables)
 
    return results

def plotTimeCourses(results, variables):
       # Getting the timeCourse
    tcDict = {}
    for var in variables:
        tcDict[var] = retrieveTimecourses(results, var)
        
    for var, tc in tcDict.iteritems():
        pylab.plot(tc[:,0], tc[:,1], label=var)

    pylab.legend(loc=0)
    pylab.show()
    
    
def changeValue(odemodel, settings, var_idx):
    print "Creating the integrator instance"
    integratorInstance = sbmlOdeSolver.IntegratorInstance_create(odeModel, settings)
    
    vars = var_idx.keys()
    vars_val = {}
    for var in vars:
        vars_val[var] = []
    printstep = sbmlOdeSolver.CvodeSettings_getPrintsteps(settings)
    caInput = calciumTrain(60000)
    for i in range (printstep):
        sbmlOdeSolver.IntegratorInstance_integrateOneStep(integratorInstance)
        
   #     if i == 50000:
            #sbmlOdeSolver.IntegratorInstance_setVariableValue(integratorInstance, var_idx["s1"], CT.c_double(0.4))
  #          sbmlOdeSolver.IntegratorInstance_setVariableValue(integratorInstance, var_idx["species_1"], CT.c_double(0.004))
    #print s1_value, sbmlOdeSolver.IntegratorInstance_getTime(integratorInstance)
#        if i == 55000:
 #           sbmlOdeSolver.IntegratorInstance_setVariableValue(integratorInstance, var_idx["species_1"], CT.c_double(0.008))
        if i in caInput:
            sbmlOdeSolver.IntegratorInstance_setVariableValue(integratorInstance, var_idx["species_1"], CT.c_double(0.08))
            print "input Calcium at time: %d" %i
            
        for var in var_idx:
            var_value = sbmlOdeSolver.IntegratorInstance_getVariableValue(integratorInstance, 
                                                                          var_idx[var]) 

            vars_val[var].append(var_value)

        
    print "Out of the for loop"
    sbmlOdeSolver.IntegratorInstance_dumpSolver(integratorInstance)
    return vars_val

def plotVars(vars_val, printstep):
    time = numpy.arange(printstep)
    for var in vars_val:
        var_tc = numpy.array(vars_val[var])
        pylab.plot(time, var_tc, label=var)
    pylab.show()
    
def calciumTrain(start, spikes=30, interval=100):
    caInput = [start]
    for spike in range(spikes):
        caInput.append(caInput[-1] + interval)
    return caInput

def expDecay(ca0, time, k = 4.0e8):
    """Simple exponential decay
    k coming from Lu model"""
    y = ca0 * k  * exp(-time)
    return y

def calcium_peak(ca_input, time, integratorInstance):
    """
    7200 molecules have to go in.
    """
    
    basal = sbmlOdeSolver.IntegratorInstance_getVariableValue(integratorInstance, 
                                                              var_idx[name2id['Ca']])
    #basal = ca_in['k']
    print "basal calcium: %d" %basal
    sbmlOdeSolver.IntegratorInstance_setVariableValue(integratorInstance, 
                                                      var_idx[name2id['Ca']], 
                                                      CT.c_double(expDecay(calConc(7200), time) ))
    
    
def setSettings(endtTime):
    settings = sbmlOdeSolver.CvodeSettings_create()
    
    printstep = endTime * 1000 #ms
    sbmlOdeSolver.CvodeSettings_setTime(settings, CT.c_double(endTime), 
                                        CT.c_int(printstep))
    
    absoluteErrorTollerance = CT.c_double(1e-9)
    relativeErrorTollerance = CT.c_double(1e-4)
    mxStep = CT.c_int(1000)
    sbmlOdeSolver.CvodeSettings_setErrors(settings, absoluteErrorTollerance, 
                                          relativeErrorTollerance, mxStep)
    sbmlOdeSolver.CvodeSettings_setSwitches(settings, 1, 0, 0, 0, 1, 0, 0)
    return settings    
    
if __name__ == "__main__":
    setReturnType()
    name2id = {"parameter_28" : "CaMKIIbar", 
               "parameter_34" : "PP2Bbar",
               "species_1" : "Ca"
                              }

    filename="../biochemical_circuits/BIOMD0000000183_altered.xml"
    variables = name2id.keys()
    
    #filename="../biochemical_circuits/testSimple.xml"
    #variables = ["s1","s3"]

    odeModel = sbmlOdeSolver.ODEModel_createFromFile(filename)

    var_idx = {}
    for var in variables:
        var_idx[var] = sbmlOdeSolver.ODEModel_getVariableIndex(odeModel, var)
    
    endTime = 200
    settings = setSettings(endTime)
    vars_val = changeValue(odeModel, settings, var_idx)
    printstep = sbmlOdeSolver.CvodeSettings_getPrintsteps(settings)
    plotVars(vars_val, printstep)

