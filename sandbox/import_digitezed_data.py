# Author Michele Mattioni
# Fri Oct 23 15:41:58 BST 2009


import pylab

a = pylab.csv2rec('spines_distribution_Wilson_1992.csv')

plot(a.x, a.y)

