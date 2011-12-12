#helpers/plot_different_freqs.py

import tables
import matplotlib.pyplot as plt

dirs = {'cpm_8Hz' : './Data/30-04-2011/Sim_0/',
        'cpm_20Hz' : './Data/29-04-2011/Sim_2/',
        'cpm_40Hz' : './Data/29-04-2011/Sim_1/',
        'cpm_40Hz_long' : './Data/25-06-2011/Sim_0/',
        'cpm_50Hz' : './Data/29-04-2011/Sim_0/',
        }


def plot_freq(freqHz):
	key = "cpm_%s" %freqHz
	h5_filename = dirs[key] + 'storage.h5'
	h5f = tables.openFile(h5_filename)
	x = h5f.root.results.WeightRef.x.read()
	Hz = h5f.root.results.WeightRef.spine559.weight.read()
	plt.plot(x, Hz, label=freqHz)
	plt.plot(x, Hz, ',', color='black')
	plt.legend(loc=0)
	plt.xlabel("Time [ms]")
	plt.ylabel("Weight a.u.")
	plt.xlim(0, 21000)
	plt.savefig('Frequencies_weight.pdf')
	plt.savefig('Frequencies_weight.png')

def plot_voltage(freqHz):
	key = "cpm_%s" %freqHz
	h5_filename = dirs[key] + 'storage.h5'
	h5f = tables.openFile(h5_filename)
	x = h5f.root.results.VecRef.x.read()
	v = h5f.root.results.VecRef.spine559_head.v
	plt.plot(x, v, label=freqHz)
	#plt.plot(x, Hz, ',', color='black')
	plt.legend(loc=0)
	plt.xlabel("Time [ms]")
	plt.ylabel("Voltage [mV]")
	plt.xlim(0, 25000)
	plt.ylim(-90,0)
	plt.savefig('Frequencies_voltage.png')
	plt.savefig('Frequencies_voltage.pdf')
	
def plot_voltage_560(freqHz):
	key = "cpm_%s" %freqHz
	h5_filename = dirs[key] + 'storage.h5'
	h5f = tables.openFile(h5_filename)
	x = h5f.root.results.VecRef.x.read()
	v = h5f.root.results.VecRef.spine560_head.v
	plt.plot(x, v, label=freqHz)
	#plt.plot(x, Hz, ',', color='black')
	plt.legend(loc=0)
	plt.xlabel("Time [ms]")
	plt.ylabel("Voltage [mV]")
	plt.xlim(0, 25000)
	plt.ylim(-90,0)
	plt.savefig('Frequencies_voltage_560.png')
	plt.savefig('Frequencies_voltage_560.pdf')

ordered_freqs = ['8Hz', '20Hz', '40Hz', '40Hz_long', '50Hz']

for freq in ordered_freqs:
	plot_freq(freq)

plt.figure()

for freq in ordered_freqs:
	plot_voltage(freq)

plt.show()
