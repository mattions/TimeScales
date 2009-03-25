from neuron import h

class Event():
	def __init__(self, eventTime):
		self.fih = h.FInitializeHandler(1, self.callback)
		self.eventTime = eventTime
	def callback(self) :
		h.cvode.event(self.eventTime, self.callback)
		print self, "t=%f" %h.t
		self.testMethod()
		
	def testMethod():
		print "Hello, I'm the test method"
	
if __name__ == "__main__":
	h.load_file("stdrun.hoc")
	a = h.Section()
	cvode = h.CVode()
	cvode.active(1)
	e = Event(3)
	h.tstop = 4
	h.run()
