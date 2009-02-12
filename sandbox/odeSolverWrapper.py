# Author: Michele Mattioni
# Wed Feb 11 17:34:02 GMT 2009

import os
import ctypes as CT

# in theory this whole thing should be platform independent
# note: Change the name of the library
if os.sys.platform == 'win32':
    print 'Opening windows.'
    sbmlOdeSolver = CT.CDLL('c://windows//system32//libsbml.dll')
# Also available for MacOS although I don't know all the details.
# if you are using a Mac please check the results of 'os.sys.platform'
# and set your absolute path to libsbml3 and let me know if it works
elif os.sys.platform == 'darwin' or os.name == 'mac':
    print 'Here be apples.'
    sbmlOdeSolver = CT.CDLL('/usr/lib/libsbml.dylib', CT.RTLD_GLOBAL)
else:
    print 'Here be penguins.'
    sbmlOdeSolver = CT.CDLL('/usr/lib/libsbml.so')

#cpath = os.path.dirname(os.path.abspath(os.sys.argv[0]))
#sbmlF = os.path.join(cpath, 'test_ctypes_libsbml.xml')

########################################################


def loadModel(model):
    """Parse the SBML model
    return the doc handle to the model"""
    # Parsing the model with sbml library
    sbmlReader = sbmlOdeSolver.SBMLReader_create()
    doc = sbmlOdeSolver.SBMLReader_readSBML(sr, model)
    return doc

def settingIntegrationParameter(time=10, printstep=100):
    """Set the integration parameters and the integration time"""
    set = sbmlOdeSolver.CvodeSettings_create()
    sbmlOdeSolver.CvodeSettings_setTime(set, time, printstep)
    sbmlOdeSolver.CvodeSettings_setErrors(set, 1e-9, 1e-4, 1000)
    sbmlOdeSolver.CvodeSettings_setCompileFunctions(set, 1)
    return set
    
  #calling the SBML ODE Solver which returns SBMLResults
def getResults(doc, set):
    """get all the results for the integration"""
    results = sbmlOdeSolver.SBML_odeSolver(doc, set)
    if sbmlOdeSolver.SolverError_getNum(sbmlOdeSolver.FATAL_ERROR_TYPE):
        print "Integration not sucessful!\n"
        sbmlOdeSolver.SolverError_dumpAndClearErrors()
        return sbmlOdeSolver.EXIT_FAILURE
    return results

def dumpResult(results):
    """Print the results on the standard input"""
    sbmlOdeSolver.SBMLResults_dump(results)
    sbmlOdeSolver.SolverError_dumpAndClearErrors()
    return sbmlOdeSolver.EXIT_SUCCESS
    
if __name__ == "__main__":
    doc = loadModel(model="../biochemical_circuits/testSimple.xml")
    set = settingIntegrationParameter(time=10, printstep=100)
    results = getResults(doc, set)
    dumpResult(results)

    
