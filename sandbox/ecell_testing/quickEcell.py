import ecell.Session as Session
import ecell.ecs
import ecell.config
import ecell.emc
import os
import sys
import matplotlib.pyplot as plt

def create_loggers(variables):
	loggers = {}
	for var in variables:
		loggers[var] = ses.createLoggerStub('Variable:/:' + var + ':Value')
		loggers[var].create()
	return loggers

def run(time):
	ses.run(time)
	for var in variables:
		plotVar(var)
	plt.legend(loc=0)
		
def plotVar(var):
	var_array = loggers[var].getData()
#	print var_array
	plt.plot(var_array[:,0], var_array[:,1], label=var)


if __name__ == '__main__' :

	filename = 'simple_ecell_mod.eml'
	if len(sys.argv) == 2:
		filename = sys.argv[1]
	
	ecell.ecs.setDMSearchPath( os.pathsep.join( ecell.config.dm_path ) )
	sim = ecell.emc.Simulator()
	ses = Session.Session(sim, changeDirectory=False)
	ses.loadModel(filename)
	
#	variables = ['S', 'P']
	variables = ['S1', 'S2']
	loggers = create_loggers(variables)
	print "Model loaded: %s" %filename
	print "Loggers created for: %s" %loggers.keys()
	print "To run 1000 secs do:"
	print "run(1000)"


