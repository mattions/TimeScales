# Author: Michele Mattioni
# Fri Feb  4 15:03:02 GMT 2011

import sys
import os
import numpy as np

import matplotlib.pyplot as plt

from helpers.loader import Loader
try:
    import ecellControl.ecellManager as eC
except ImportError:
    pass


class StimulPlotter():
    """Helps to plot stimuli"""
    
    def __init__(self):
        pass
    
    def build_stimul_vec(self, time, stimul, height_in_the_graph):
        """Return a masked array which has `height_in_the_graph` value
        for each point recorded in stimul array.
        
        time - the time array of the simulation
        stimul - the synvecRef vectors with the synapstic inputs
        height_in_graph"""
        
        inputs_event = np.zeros_like(time)
        indxs = np.searchsorted(time, stimul)
        inputs_event[indxs] = height_in_the_graph
        masked = np.ma.masked_where(inputs_event == 0, inputs_event)
        return masked
    
    def plot_input(self, spine, manager, ax=None, style='k.', 
                   height_in_the_graph=-88):
        """Plot the built stimuli on the current figure. 
        If an active axes is passed, it will be used to plot.
        Handy on figure with two axes."""
        
        spine += '_psd'
        stimul = manager.get_vector(spine, 'stimul_ampa', 'SynVecRef')
        
        if stimul is None:
            print "Error - Stimul not Plotted. No stim found for %s." %spine
        else:
            time = manager.groups['t']
            print "Buiding stim array for %s" %spine
            m_array = self.build_stimul_vec(time, stimul, height_in_the_graph)
            if ax:
                ax.plot(time, m_array, 'k.', label = "stimul")
            else:
                plt.plot(time, m_array, 'k.', label = "stimul")
            return m_array

class EcellPlotter():
    
    def plot_timeCourses(self, timeCourses, save=False, 
                        dir=None, name='test_spine', x_lims=None, tstop_bio=300):
         """Plot the default timecourses"""
         import matplotlib.pyplot as plt
         ca_tc = timeCourses['ca'] 
         plt.figure()
         time_ms = (ca_tc[:,0] - tstop_bio) * 1e3 #scaling to ms
         plt.plot(time_ms, ca_tc[:,1], label="Calcium")
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


class DoublePlotter():
    "plot both electrical and biochemical in one graph."
    def plot_double_axes(self, manager, spine, el_var, bio_var, 
    	bio_group, tstop_bio=300):
        """
        Plot a double axes figure with the variables as argument, 
        return a tuple with the two axes used.
        
        Param
        -----
        manager - neuronvisio manager
        spine - spine to plot
        el_var - electrical variable to plot
        bio_var - biochemical variable to plot
        bio_group - group where the Ref is part of (e.g VecRef, 
                    SynVecRef, YourRef)
                    
                    
        Example:
		ax1, ax2 = dp.plot_double_axes(controls.manager, 'spine1', 'v', 
		'AMPAR_P', bio_group='timeSeries_spine1')
        """
        ax1 = plt.subplot(111)
        sec_head = spine + '_head'
        vec = manager.get_vector(sec_head, el_var)
        t = manager.groups['t']
        label = sec_head + "_" + el_var
        l1, = ax1.plot(t, vec, label=label)
        
        # plotting the second one

        vec_bio = manager.get_vector(spine, bio_var, group=bio_group)

        t2 = manager.groups[bio_group]
        t2_ms = (t2.read()- tstop_bio) * 1e3 #scaling to ms
        label = spine + "_" + bio_var
        ax2 = ax1.twinx() 
        l2, = ax2.plot(t2_ms, vec_bio, 'r-', label=label)
        
        # Setting the axes and colour.
        ax1.set_ylabel('v [mV]')
        ax2.set_ylabel('# molecule')
        
        ax1.yaxis.label.set_color(l1.get_color())	
        ax2.yaxis.label.set_color(l2.get_color())
        tkw = dict(size=4, width=1.5)
    	ax1.tick_params(axis='y', colors=l1.get_color(), **tkw)
    	ax2.tick_params(axis='y', colors=l2.get_color(), **tkw)

        lines = [l1,l2]
        ax1.legend(lines, [l.get_label() for l in lines], loc='best')
        ax1.set_xlabel('Time [ms]')
        ax1.set_xlim(0, 20000)
        return (ax1, ax2)
    
    def plot_bio_and_ele_calcium(self, manager, spine, dir=None):
        """Plot Calcium from bio and ele with the same scale in 
        two graphs.
        Param:
            spine: Spine which Calcium should be plotted. 
            manager: classic Neuronvisio manager.
        Example:
            dp.plot_bio_and_ele_calcium(controls.manager, "spine1")"""
        timeSeries = "timeSeries_%s" %spine
        ecell_time_equilibrium = 300 #s
        t_bio = manager.groups[timeSeries]
        t_bio_ms = (t_bio.read() - ecell_time_equilibrium) * 1e3 #s_to_ms
        
        ca_conc = manager.get_vector(spine, 'ca_conc', group=timeSeries)
        label = "bio_ca_%s" %spine
        plt.plot(t_bio_ms, ca_conc.read()*1e6, #M_to_uM 
                 label=label)
        plt.title("Biochemical")
        plt.xlabel('Time [ms]')
        plt.ylabel('Concentration [um]')
            
        neuron_time_equilibrium = 100 #ms
        spine_head = "%s_head" %spine
        cai = manager.get_vector(spine_head, 'cai')
        cali = manager.get_vector(spine_head, 'cali')
        t = manager.groups['t']
        plt.figure()
        label = "ele_ca_%s" %spine
        plt.plot((t.read()-neuron_time_equilibrium), 
                 ((cali.read()+cai.read())*1e3), #mM_to_uM 
                 label=label)
        plt.xlabel('Time [ms]')
        plt.ylabel('Concentration [um]')
        plt.title("Electrical")
        xlim = plt.xlim(0,) #starting from zero
        plt.legend()
        if dir is not None:
            for format in [".png", ".pdf"]:
                filename = spine + "_electrical_calcium" + format
                plt.savefig(os.path.join(dir, filename))
        plt.figure(1)
        plt.xlim(xlim) # Getting bio graph on the electric xlim.
        plt.legend()
        if dir is not None:
            for format in [".png", ".pdf"]:
                filename = spine + "_biochemical_calcium" + format
                plt.savefig(os.path.join(dir, filename))
        # calcium buffered by the Calmodulin
        
        moles_bound_ca_per_moles_cam = manager.get_vector(spine, 
                                                          'moles_bound_ca_per_moles_cam', 
                                                          group=timeSeries)
        camR = 1.45e-9
        camT = 3e-5
        totcam = camT + camR
        t_bio = manager.groups['timeSeries_spine1']
        conc_tot_calcium_bound_to_cam = moles_bound_ca_per_moles_cam.read() * totcam
        plt.figure()
        plt.plot(t_bio_ms, conc_tot_calcium_bound_to_cam * 1e6, label="buffered_ca")
        plt.title("Calcium buffered by Calmodulin")
        plt.xlim(xlim)
        plt.xlabel("Time [ms]")
        plt.ylabel("Concentration [uM]")
        plt.legend()
        if dir is not None:
            for format in [".png", ".pdf"]:
                filename = spine + "_biochemical_calcium_buffered_by_Calmodulin" + format
                plt.savefig(os.path.join(dir, filename))
        
        ca_conc = manager.get_vector('spine1', 'ca_conc', group='timeSeries_spine1')
        
        calcium_bio_and_calcium_calmodulin = (conc_tot_calcium_bound_to_cam + ca_conc.read()) * 1e6
        plt.figure() 
        plt.plot(t_bio_ms, calcium_bio_and_calcium_calmodulin, label="buffered+free_ca")
        plt.title("Total Calcium in the biochemical ")
        plt.xlim(xlim)
        plt.xlabel("Time [ms]")
        plt.ylabel("Concentration [uM]")
        plt.legend()
        if dir is not None:
            for format in [".png", ".pdf"]:
                filename = spine + "_biochemical_free_and_buffered_calcium" + format
                plt.savefig(os.path.join(dir, filename))
                
        plt.figure()
        calcium_bio_and_calcium_calmodulin_buffered_subtracted = ((conc_tot_calcium_bound_to_cam - conc_tot_calcium_bound_to_cam[489]) + ca_conc.read()) * 1e6 
        plt.plot(t_bio_ms, calcium_bio_and_calcium_calmodulin_buffered_subtracted, 
                 label="bio calcium")
        plt.title("Total Calcium in the biochemical ")
        plt.xlim(xlim)
        plt.xlabel("Time [ms]")
        plt.ylabel("Concentration [uM]")
        plt.legend()
        plt.ylim(-0.1, 5)
        if dir is not None:
            for format in [".png", ".pdf"]:
                filename = spine + "_biochemical_free_and_buffered_calcium_subtracted" + format
                plt.savefig(os.path.join(dir, filename))

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
