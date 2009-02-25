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
    
def integrate(filename, time, printstep):
    """Integrate a model"""
    setReturnType()
    doc = loadModel(filename)
    settings = settingIntegrationParameter(time, printstep)
    results = getResults(doc, settings)
    return results
    
    
if __name__ == "__main__":
    
    name2id = {"CaMKIIbar" : "parameter_28",
                              "PP2Bbar" : "parameter_34",
                              "Ca" : "species_1"
                              }
    filename="../biochemical_circuits/testSimple.xml"
    #filename="../biochemical_circuits/BIOMD0000000183_altered.xml"
    time=10
    printstep=100
    
    results = integrate(filename, time, printstep)
    
    # Getting the timeCourse
    tc_s1 = retrieveTimecourses(results, "s1")
    tc_s3 = retrieveTimecourses(results, "s3")
    
    

    pylab.plot(tc_s1[:,0], tc_s1[:,1], label="s1")
    pylab.plot(tc_s3[:,0], tc_s3[:,1], label="s3")
    pylab.show()
    