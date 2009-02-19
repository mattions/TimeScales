# Author: Michele Mattioni
# Wed Feb 11 17:34:02 GMT 2009

import os
import ctypes as CT

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


def loadModel(model):
    """Parse the SBML model
    return the doc handle to the model"""
    # Parsing the model with sbml library
    sbmlReader = sbmlOdeSolver.SBMLReader_create()
    doc = sbmlOdeSolver.SBMLReader_readSBML(sbmlReader, model)
    return doc

def settingIntegrationParameter(time=10, printstep=100):
    """Set the integration parameters and the integration time"""
    settings = sbmlOdeSolver.CvodeSettings_create()
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
        sbmlOdeSolver.SBMLResults_dump(results)
        sbmlOdeSolver.SolverError_dumpAndClearErrors()
        return results
    
if __name__ == "__main__":
    #doc = loadModel(model="../biochemical_circuits/testSimple.xml")
    doc = loadModel(model="../biochemical_circuits/MPAK.xml")
    settings = settingIntegrationParameter(time=100, printstep=1000)
    results = getResults(doc, settings)