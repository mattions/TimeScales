# Author Michele Mattioni
# Fri Oct 23 15:41:58 BST 2009


import pylab

a = pylab.csv2rec('spines_distribution_Wilson_1992.csv')

pylab.plot(a.x, a.y)
pylab.xlabel("Distance from the soma [um]")
pylab.ylabel("Surface Area [um]/Dendritic Lenght [um^2]")

pylab.show()

