from helpers.plotter import DoublePlotter

from neuronvisio.manager import Manager

import matplotlib.pyplot as plt
import os 

spine_num = 'spine532'

filename = 'storage.h5'

#dirs = {'1spine_8Hz' : 'Data/05-05-2011/Sim_0/',
#        '1spine_4Hz' : 'Data/04-05-2011/Sim_1/',
#        '1spine_1Hz' : 'Data/03-05-2011/Sim_3/',
#        '1spine_50Hz' : 'Data/03-05-2011/Sim_2/'
#        }

dirs = {'short_tdouble_stims' : 'Data/short_tstop_double_stim_20110113-195840'
        }

for condition, dir in dirs.iteritems():
    h5_filename = dir + 'storage.h5'
    man = Manager()
    man.load_from_hdf(h5_filename)
    dp = DoublePlotter()
    ax1, ax2 = dp.plot_double_axes(man, 'spine532', 'v', 
        'AMPAR_P', bio_group='timeSeries_spine532')
    for ext in ['.png', '.pdf']:
        name = 'ele_bio' + condition + ext
        fig_filename = os.path.join(dir, name)
        plt.savefig(fig_filename)