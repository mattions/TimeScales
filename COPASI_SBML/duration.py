import COPASI
datamodel=COPASI.CCopasiDataModel.GLOBAL
filename = "BIOMD0000000067_.xml"
datamodel.importSBML(filename)
task=datamodel.getTask(COPASI.CCopasiTask.timeCourse)
problem=task.getProblem()
duration=problem.getParameter("Duration")
print "Default %f" %duration.getDblValue()
duration.setDblValue(2.0)
print "Updated duration %f" %duration.getDblValue()
timesSeriesRequest = problem.getParameter("TimeSeriesRequested")
timesSeriesRequest.setValue(True)
task.process(True)
timeSeries= task.getTimeSeries()
print "The number of steps is %d last time point is %f not %f" %(timeSeries.getRecordedSteps(),
                                                                 timeSeries.getData(100, 0), 
                task.getProblem().getParameter("Duration").getDblValue())

