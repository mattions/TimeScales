# Author Michele Mattioni
# Fri Oct 23 15:41:58 BST 2009


import pylab
import scipy as sp
import numpy as np
from numpy import sin, exp
import matplotlib.pyplot as plt
from scipy.special import gamma


class FitHandler(object):
    """Fit the data with a polynomial"""
    
    def fit(self, data, terms):
       polycoeffs = np.polyfit(data.x, data.y, terms)
       poly = np.poly1d(polycoeffs)
       return poly
    
    def plot_poly(self, pfit):
        
        plt.plot(data.x, pfit(data.x), label="fit %i" %pfit.order)
    
    def fit_and_plot(self, data, order):
        p = self.fit(data, order)
        self.plot_poly(p)
        return p
    
    def plot_data(self, data):
       
       plt.plot(data.x, data.y, 'k.', label="data")
       plt.xlabel("Distance from the soma [um]")
       plt.ylabel("Surface Area [um]/Dendritic Lenght [um^2]")
       
    def model_curve(self, x, a, b, c):
        results = a * exp(-b * sin (x + c))
        return results



class ArbitraryFunctionfit(object):
    
    def residuals(self, p, x, y):    

        err = y - self.gamma_dist(x, p)
        return err

    def sin_based(self, x, p):
      
        return p[0]* np.sin( 2 * np.pi * p[1] * x + p[2])

    def exp_sin(self, x, p):
        a,b,c = p
        return a * exp(-b * sin(x + c))
    
    def gamma_dist(self, x, p):
        k, theta = p
        return x**(k-1) * (exp(-x/theta)/(theta**k * gamma(x)))
        

    def fit(self, f, p, x, y):
        
        plsq = leastsq(self.residuals, p0, args=(y, x))
        return plsq  


if __name__ == "__main__":
    from scipy.optimize import leastsq
    data = pylab.csv2rec('spines_distribution_Wilson_1992.csv')
    pfh = FitHandler()
    pfh.plot_data(data)
    
    orders = [4, 6, 12, 17]
    poly_list = []
    
    # Fitting
    for order in orders:
       pfit = pfh.fit_and_plot(data, order)
       poly_list.append(pfit)
    plt.title("Fitting the data")
    plt.legend()   
    # Integrating
    Poly_Integs = []
    for poly in poly_list:
        P_Integ = poly.integ()
        Poly_Integs.append(P_Integ)
    
    plt.figure()
    labels = []
    for poly in Poly_Integs:
        pfh.plot_poly(poly)
        integrOf = poly.order -1
        s = 'Integral of %i' % integrOf
        labels.append( s )
    plt.title("Integral area")
    plt.legend((labels))
    
    
    plt.figure()
    aff = ArbitraryFunctionfit()
    k, theta = p0 = [1, 1]
    
    est_p, err_est = aff.fit(aff.residuals, p0, data.x, data.y)
    print "Estimated par: %s, Estimated Err: %s" %(est_p, err_est)
    plt.plot(aff.gamma_dist(data.x, est_p), label="fit")
    
    plt.show()

   
   

