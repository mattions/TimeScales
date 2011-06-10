import os
from shutil import copyfile

from enthought.mayavi import mlab
# Offscreen
#mlab.options.offscreen = True

import neuronvisio.controls
from neuronvisio.visio import Visio


# Vars

var = 'v'
start_value = -90
end_value = 0
h5_filename = 'medium_model.h5'
animation_dir = 'animation'
screenshot_dir = 'screenshot'

# Loading the file
neuronvisio.controls = reload(neuronvisio.controls)
man = neuronvisio.manager.Manager()
man.load_from_hdf(h5_filename)

# Launch Visio
visio = Visio(None, man)
visio.draw_model()

time = man.groups['t']
for i, time_point in enumerate(time):

    visio.show_variable_timecourse(var, time_point, 
                                 start_value, end_value)
    #visio.mayavi.visualization.scene.render()
    #visio.timelabel.text = str(round(time_point, 3))
    figure_filename_screenshot = 'medium_model_%s_%09d.png' %(time_point, i)
    figure_filename_animation = 'medium_model%09d.png' %(i)
    
    # Creating the dirs
    if not os.path.exists(animation_dir):
        os.mkdir(animation_dir)
    if not os.path.exists(screenshot_dir):
        os.mkdir(screenshot_dir)
        
    print "Saving %s" %figure_filename_screenshot
    # Force the redraw
    #mlab.draw()
    mlab.savefig(os.path.join(animation_dir, figure_filename_animation), 
                 size=(1280, 1024))
    copyfile(os.path.join(animation_dir, figure_filename_animation), 
             os.path.join(screenshot_dir, figure_filename_screenshot))
    

