# Author Michele Mattioni
# Fri Oct 23 15:41:58 BST 2009


import pylab
import scipy
import numpy

def fit(data, terms):
   polycoeffs = scipy.polyfit(data.x, data.y, terms)
   yfit = scipy.polyval(polycoeffs, data.x)
   return yfit


if __name__ == "__main__":

   data = pylab.csv2rec('spines_distribution_Wilson_1992.csv')

   pylab.plot(data.x, data.y, 'r+', label="data")
   pylab.xlabel("Distance from the soma [um]")
   pylab.ylabel("Surface Area [um]/Dendritic Lenght [um^2]")
   
   terms = [50]
   for x in terms:
      yfit = fit(data, x)
      pylab.plot(data.x, yfit, label="fit %i" %x)


   
#   yfit = fit(data, terms)
#   pylab.plot(data.x, yfit, label="fit %i" %terms)
   pylab.legend()
   pylab.show()

