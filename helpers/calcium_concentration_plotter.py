import sys
import matplotlib.pyplot as plt

def plot_bio_and_ele_calcium(spine, controls):
	timeSeries = "timeSeries_%s" %spine
	ecell_time_equilibrium = 300 #s
	t_bio = controls.manager.groups[timeSeries]
    	t_bio_ms = (t_bio.read() - ecell_time_equilibrium) * 1e3
	
    	ca_conc = controls.manager.get_vector(spine, 'ca_conc', group=timeSeries)
	label = "bio in %s" %spine
    	plt.plot(t_bio_ms, ca_conc.read()*1e6, label=label)
    	plt.title("Bio")
	plt.xlabel('Time [ms]')
	plt.ylabel('Concentration [um]')
        
	neuron_time_equilibrium = 100 #ms
        spine_head = "%s_head" %spine
	cai = controls.manager.get_vector(spine_head, 'cai')
    	cali = controls.manager.get_vector(spine_head, 'cali')
	t = controls.manager.groups['t']
	plt.figure()
	label = "electrical in %s" %spine
	plt.plot((t.read()-neuron_time_equilibrium), ((cali.read()+cai.read())*1e3), label=label)
	plt.xlabel('Time [ms]')
	plt.ylabel('Concentration [um]')
    	plt.title("Ele")
	xlim = plt.xlim(0,) #starting from zero
	plt.figure(1)
	plt.xlim(xlim) # Getting bio graph on the electric xlim.
