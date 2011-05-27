from helpers.plotter import DoublePlotter

from neuronvisio.manager import Manager

import matplotlib.pyplot as plt
import os 



filename = 'storage.h5'

spine_num = 'spine532'
dirs = {'1spine_8Hz' : 'Data_rmt/05-05-2011/Sim_0/',
        '1spine_4Hz' : 'Data_rmt/04-05-2011/Sim_1/',
        '1spine_1Hz' : 'Data_rmt/03-05-2011/Sim_3/',
        '1spine_50Hz' : 'Data_rmt/03-05-2011/Sim_2/'
        }

#spine_num = 'spine1'
#dirs = {'short_tdouble_stims' : 
#        'Data/short_tstop_double_stim_20110113-195840/'}

for condition, dir in dirs.iteritems():
    h5_filename = dir + 'storage.h5'
    man = Manager()
    man.load_from_hdf(h5_filename)
    dp = DoublePlotter()
    
    biogroup = 'timeSeries_' + spine_num
    ax1, ax2 = dp.plot_double_axes(man, spine_num, 'v', 
        'AMPAR_P', bio_group=biogroup)
    
    for ext in ['.png', '.pdf']:
        name = 'ele_bio' + condition + ext
        fig_filename = os.path.join(dir, name)
        plt.savefig(fig_filename)
        print "Saved file %s" %fig_filename