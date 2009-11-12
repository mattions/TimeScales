# Author Michele Mattioni
# Fri Oct 23 15:41:58 BST 2009


import pylab
import scipy as sp
import numpy as np
import matplotlib.pyplot as plt

def fit(data, terms):
   polycoeffs = sp.polyfit(data.x, data.y, terms)
   yfit = sp.polyval(polycoeffs, data.x)
   return yfit


if __name__ == "__main__":

   data = pylab.csv2rec('spines_distribution_Wilson_1992.csv')

   plt.plot(data.x, data.y, 'r+', label="data")
   plt.xlabel("Distance from the soma [um]")
   plt.ylabel("Surface Area [um]/Dendritic Lenght [um^2]")
   
   terms = [50]
   for x in terms:
      yfit = fit(data, x)
      plt.plot(data.x, yfit, label="fit %i" %x)


   
#   yfit = fit(data, terms)
#   pylab.plot(data.x, yfit, label="fit %i" %terms)
   plt.legend()
   plt.show()

