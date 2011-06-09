import matplotlib.pyplot as plt
import os 

from helpers.plotter import DoublePlotter, StimulPlotter
import neuronvisio.manager

filename = 'storage.h5'

#stimulated_spines = ['spine554', 'spine555', 'spine556', 
#                     'spine558', 'spine559', 'spine560', 
#                     'spine562', 'spine563', 'spine564', 
#                     'spine1468', 'spine1469', 'spine1470', 
#                     'spine1472', 'spine1473', 'spine1474', 
#                     'spine1476', 'spine1477', 'spine1478']

stimulated_spines = ['spine554']
dirs = {'cpm_8Hz' : 'Data_rmt/30-04-2011/Sim_0/',
        }



for condition, dir in dirs.iteritems():
    h5_filename = dir + 'storage.h5'
    neuronvisio.manager = reload(neuronvisio.manager)
    man = neuronvisio.manager.Manager()
    man.load_from_hdf(h5_filename)
    dp = DoublePlotter()
    sp = StimulPlotter()
    
    
    for spine_num in stimulated_spines:
        biogroup = 'timeSeries_' + spine_num
        fig = plt.figure()
        
        ax1, ax2 = dp.plot_double_axes(man, spine_num, 'v', 
            'AMPAR_P', bio_group=biogroup)
        ax1.set_ylim(-90, 0)
        sp.plot_input(spine_num, man, ax=ax1)
        
        for ext in ['.png', '.pdf']:
            name = 'ele_bio' + condition + ext
            fig_filename = os.path.join(dir, name)
            plt.savefig(fig_filename)
            print "Saved file %s" %fig_filename
    del man