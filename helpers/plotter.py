# Author: Michele Mattioni
# Fri Feb  4 15:03:02 GMT 2011

import sys
import os

import matplotlib.pyplot as plt

from helpers.loader import Loader
import ecellControl.ecellManager as eC


class EcellPlotter():
    
    def plot_timeCourses(self, timeCourses, save=False, 
                        dir=None, name='test_spine', x_lims=None):
         """Plot the default timecourses"""
         import matplotlib.pyplot as plt
         ca_tc = timeCourses['ca'] 
         plt.figure()
         plt.plot(ca_tc[:,0], ca_tc[:,1], label="Calcium")
         plt.xlabel("Time [s]")
         if x_lims:
             plt.xlim(x_lims)
         plt.legend(loc=0)
         
         if save :
             filename = name +"_caInput.png"
             plt.savefig(os.path.join(dir, filename))
             print "figure saved in: %s" % os.path.join(dir, filename)
         
         vars = ['PP2Bbar', 'CaMKIIbar', 'PP1abar', 'AMPAR', 'AMPAR_P']
         
         for var in vars:
             plt.figure()
             var_tc = timeCourses[var]
             lbl = name + '_' + var
             plt.plot(var_tc[:,0], var_tc[:,1], label=lbl)
             plt.xlabel("Time [s]")
             if x_lims:
                 plt.xlim(x_lims)
             plt.legend(loc=0)
         
             if save :
                 filename = name + "_" + var + ".png"
                 plt.savefig(os.path.join(dir, filename))
                 print "figure saved in: %s" % os.path.join(dir, filename) 
    
    def plot_weight(self, timecourses, dir=None):
        import matplotlib.pyplot as plt
        scaled_CaMKII = []
        time = timecourses['AMPAR'][:,0] # time equal for everything
    
    
    
        plt.figure()
        plt.plot(time, timecourses['AMPAR_P'][:,1], label='AMPAR_P')
        #plt.plot(time, weight_baseline, label='w_b')
        title = "AMPA weight, calculated from E-Cell"
        plt.title(title)
        plt.legend(loc=0)
        if dir is not None:
            plt.savefig(os.path.join(dir, "weight.png"))
        plt.plot(time, timecourses['AMPAR'][:,1], label='AMPAR')
        plt.legend(loc=0)
        if dir is not None:
            plt.savefig(os.path.join(dir, "weight_both.png"))
            
    
    def plot_var(self, timeCourses, var):
        "Plot the variable in the current figure"
        var_tc = timeCourses[var]
        lbl = var
        plt.plot(var_tc[:,0], var_tc[:,1], label=lbl)
        plt.xlabel("Time [s]")
        plt.legend(loc=0)



if __name__ == "__main__":

    if len(sys.argv) == 2:
        
        filename = sys.argv[1]
        l = Loader()
        ecp = EcellPlotter()
        timecourses = l.load(filename)
        ecp.plot_timeCourses(timecourses, name='test_spine')
        print "Time courses loaded in 'timecourses' object. Easy plotting \n\
        with 'ecp' object. Have fun."
        plt.show()
    
    else:
        print "Tell me which file with ecell Timeseries to load."
        print "visualizatorBiochemical.py path/to/timecourses\n"