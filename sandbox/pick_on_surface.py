""" Example showing how to pick data on a surface, going all the way back
to the index in the numpy arrays.

In this example, two views of the same data are shown. One with the data 

The trick is to use an observer on the scene interactor to pick when the
mouse is pressed, but no moved (to avoid conflicting with interactor
logic). Then we can use conventional picking to see if the object of 
interest is under the cursor, and with the point picker, go back to the
index of the point choosen.
"""

################################################################################
# Create some data
import numpy as np
pi  = np.pi
cos = np.cos
sin = np.sin

dphi, dtheta = pi/250.0, pi/250.0

phi, theta = np.mgrid[0:pi+dphi*1.5:dphi,0:2*pi+dtheta*1.5:dtheta]
m0 = 4; m1 = 3; m2 = 2; m3 = 3; m4 = 6; m5 = 2; m6 = 6; m7 = 4;
r = sin(m0*phi)**m1 + cos(m2*phi)**m3 + sin(m4*theta)**m5 + cos(m6*theta)**m7
x = r*sin(phi)*cos(theta)
y = r*cos(phi)
z = r*sin(phi)*sin(theta)

################################################################################
# Plot the data
from enthought.mayavi import mlab

# A first plot in 3D
fig = mlab.figure(1)
mlab.clf()
mesh = mlab.mesh(x, y, z, scalars=r)
cursor3d = mlab.points3d(0., 0., 0., mode='sphere',
                                color=(0, 0, 0),
                                scale_factor=0.5)

# A second plot, flat
fig2d = mlab.figure(2)
mlab.clf()
im = mlab.imshow(r)
cursor = mlab.points3d(0, 0, 0, mode='2dthick_cross',
                                color=(0, 0, 0),
                                scale_factor=10)
mlab.view(90, 0)

################################################################################
# Some logic to select 'mesh' and the data index when picking.
from enthought.tvtk.api import tvtk

def picker_callback(picker_obj, evt):
    picker_obj = tvtk.to_tvtk(picker_obj)
    picked = picker_obj.actors
    if mesh.actor.actor._vtk_obj in [o._vtk_obj for o in picked]:
        # m.mlab_source.points is the points array underlying the vtk
        # dataset. GetPointId return the index in this array.
        x_, y_ = np.lib.index_tricks.unravel_index(picker_obj.point_id,
                                                                r.shape)
        print "Data indices: %i, %i" % (x_, y_)
        n_x, n_y = r.shape
        cursor.mlab_source.set(x=np.atleast_1d(x_) - n_x/2., 
                               y=np.atleast_1d(y_) - n_y/2.)
        cursor3d.mlab_source.set(x=np.atleast_1d(x[x_, y_]), 
                                 y=np.atleast_1d(y[x_, y_]),
                                 z=np.atleast_1d(z[x_, y_]))
        #x_, y_, z_ = picker_obj.pick_position
        #cursor3d.mlab_source.set(x=np.atleast_1d(x_),
        #                         y=np.atleast_1d(y_),
        #                         z=np.atleast_1d(z_))

fig.scene.picker.pointpicker.add_observer('EndPickEvent', picker_callback)

################################################################################
# Some logic to pick on click but no move
class MvtPicker(object):
    mouse_mvt = False

    def __init__(self, picker):
        self.picker = picker

    def on_button_press(self, obj, evt):
        self.mouse_mvt = False

    def on_mouse_move(self, obj, evt):
        self.mouse_mvt = True

    def on_button_release(self, obj, evt):
        if not self.mouse_mvt:
            x, y = obj.GetEventPosition()
            self.picker.pick((x, y, 0), fig.scene.renderer)
        self.mouse_mvt = False
        


mvt_picker = MvtPicker(fig.scene.picker.pointpicker)

fig.scene.interactor.add_observer('EndInteractionEvent', 
                                mvt_picker.on_button_press)
fig.scene.interactor.add_observer('RenderEvent', 
                                mvt_picker.on_mouse_move)
fig.scene.interactor.add_observer('LeftButtonReleaseEvent', 
                                mvt_picker.on_button_release)


mlab.show()
