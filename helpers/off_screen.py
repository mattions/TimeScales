import os
from shutil import copyfile

from enthought.mayavi import mlab
# Offscreen
mlab.options.offscreen = True

import neuronvisio.controls
from neuronvisio.visio import Visio
from PyQt4 import QtGui

prefix = 'Data/'

#dirs = {'cpm_8Hz' : prefix + '30-04-2011/Sim_0/',
#        'cpm_20Hz' : prefix + '29-04-2011/Sim_2/',
#        'cpm_40Hz' : prefix + '29-04-2011/Sim_1/',
#        'cmp_50Hz' : prefix + '29-04-2011/Sim_0'
#        }

dirs = {'medium_model' : 'helpers/',
        }

# Vars

var = 'v'
start_value = -90
end_value = 0
h5_filename = 'storage.h5'
animation_dir = 'animation'
screenshot_dir = 'screenshot'



if __name__ == '__main__' :
    app = QtGui.QApplication.instance()
    
    for condition, dir in dirs.iteritems():
        # Loading the file
        neuronvisio.controls = reload(neuronvisio.controls)
        man = neuronvisio.manager.Manager()
        man.load_from_hdf(os.path.join(dir, h5_filename))
        
        # Launch Visio
        visio = Visio(None, man)
        visio.draw_model()
        
        time = man.groups['t']
        for i, time_point in enumerate(time):
        
            
            visio.show_variable_timecourse(var, i, 
                                         start_value, end_value)
            #visio.timelabel.text = str(round(time_point, 3))
            
            figure_filename_screenshot = '%s_%s_%09d.png' %(condition, time_point, i)
            figure_filename_animation = '%s%09d.png' %(condition, i)
            
            # Creating the dirs
            path_animation = os.path.join(dir, animation_dir) 
            path_screenshots = os.path.join(dir, screenshot_dir)
            if not os.path.exists(path_animation):
                os.mkdir(path_animation)
            if not os.path.exists(path_screenshots):
                os.mkdir(path_screenshots)
            
            print "Saving %s" %figure_filename_screenshot
            mlab.savefig(os.path.join(path_animation, figure_filename_animation), 
                         size=(1280, 1024))
            copyfile(os.path.join(path_animation, figure_filename_animation), 
                     os.path.join(path_screenshots, figure_filename_screenshot))
            