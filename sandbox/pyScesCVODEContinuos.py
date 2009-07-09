import numpy, pysces

mod = pysces.model('pysces_test_linear1')
mod.mode_integrator = 'CVODE'
mod.CVODE_extra_output = ['x0']
mod.doSimPlot(1,5, fmt='points')

print mod.__CVODE_initialise__
mod.x0 = 5.0
mod.CVODE_continue(numpy.array([2,4,8]))
print mod.__CVODE_initialise__

print mod.__CVODE_initialise__
mod.x0 = 10.0
mod.CVODE_continue(numpy.array([10,15,20]))
print mod.__CVODE_initialise__

sres = None
first = True
for s in mod.CVODE_continuous_result:
   print s.getAllSimData()
   if first:
       first = False
       sres,labels = s.getSimData('s0','s1','s2','x0',lbls=True)
   else:
       sres = numpy.vstack([sres, s.getSimData('s0','s1','s2','x0')])

pysces.plt.plotLines(numpy.array(sres), 0, [], titles=labels, formats=['o','-','-','-','o'])


raw_input('\nExIt\n')
pysces.plt.closeAll()