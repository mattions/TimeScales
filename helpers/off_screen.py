import os
from shutil import copyfile
import numpy as np

# Getting the qt in before mayavi
from PyQt4 import QtGui
app = QtGui.QApplication.instance()

from enthought.mayavi import mlab
# Offscreen
mlab.options.offscreen = True

import neuronvisio.controls
from neuronvisio.visio import Visio


prefix = 'Data_rmt/'

dirs = {'cpm_8Hz' : prefix + '30-04-2011/Sim_0/',
        'cpm_20Hz' : prefix + '29-04-2011/Sim_2/',
        'cpm_40Hz' : prefix + '29-04-2011/Sim_1/',
        'cmp_50Hz' : prefix + '29-04-2011/Sim_0'
        }

#dirs = {'medium_model' : 'helpers/',
#        }

# Vars

var = 'v'
start_value = -90
end_value = 0
h5_filename = 'storage.h5'
animation_dir = 'animation'
screenshot_dir = 'screenshot'

single_stim_first_train = np.arange(80000, 80601, 5)
single_stim_second_train = np.arange(162501, 163201, 5)

total_time_index_array = np.hstack((single_stim_first_train,
                                    single_stim_second_train))


if __name__ == '__main__' :
    
    
    for condition, dir in dirs.iteritems():
        # Loading the file
        neuronvisio.controls = reload(neuronvisio.controls)
        man = neuronvisio.manager.Manager()
        man.load_from_hdf(os.path.join(dir, h5_filename))
        
        # Launch Visio
        visio = Visio(None, man)
        visio.draw_model()
        
        time = man.groups['t']
        
        for i, indx in enumerate(total_time_index_array):
            # Creating the dirs
            path_animation = os.path.join(dir, animation_dir) 
            path_screenshots = os.path.join(dir, screenshot_dir)
            if not os.path.exists(path_animation):
                os.mkdir(path_animation)
            if not os.path.exists(path_screenshots):
                os.mkdir(path_screenshots)
            
            time_point = time[indx]
            figure_filename_screenshot = '%s_%s_%09d.png' %(condition, time_point, i)
            figure_filename_animation = '%s%09d.png' %(condition, i)
            file = os.path.join(path_animation, figure_filename_animation)
            path_animation_file = os.path.join(path_animation, 
                                               figure_filename_animation)
            path_screenshot_file = os.path.join(path_screenshots, 
                                                figure_filename_screenshot)
        
            if not os.path.exists(path_animation_file):
                visio.show_variable_timecourse(var, indx, 
                                             start_value, end_value)
                print "Saving %s" %path_animation_file
                mlab.savefig(os.path.join(path_animation_file), 
                             size=(1280, 1024))
                copyfile(path_animation_file, path_screenshot_file)
                