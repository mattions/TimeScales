from enthought.mayavi import mlab
from enthought.tvtk.tools import visual

# Create a figure
f = mlab.figure(size=(500,500))
# Tell visual to use this as the viewer.
visual.set_viewer(f)

cyl = visual.Cylinder(pos=(0.,0.,0.,), axis=(100.,0.,0.), 
                       radius=5, length=100.0)
cyl2 = visual.Cylinder(pos=(100.,0.,0,), axis=(92.1060943604,38.9418334961,0), 
                       radius=1.5, length=100.0)
cyl3 = visual.Cylinder(pos=(100.0,0.,0.), axis=(92.1060943604,-38.9418334961,0), 
                       radius=1.5, length=100.0)
                       
cyls = [cyl, cyl2, cyl3]

def picker_callback(picker_obj):
    """ Picker callback: this get called when on pick events. 
    """
    picked = picker_obj.actor
    print picked
    if picked is not None:
        print "Picked something"


picker = f.on_mouse_pick(picker_callback)