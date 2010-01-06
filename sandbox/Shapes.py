#!/usr/bin/env python

'''
Shapes.py

This program is based upon the shapes.c demo by Naofumi. This is not a
straight conversion from C to Python. The original idea of displaying
different shapes have been retained but here a range of widgets are
used to demonstrate the use of OpenGL in conjunction with a variety of
Gtk+ widgets. You can use sliders to rotate the object and change colours
for the foreground and background using the standard Gtk+ colour
selection dialog.

Alif Wahid, March, 2003
<awah005@users.sourceforge.net>
'''

import sys

import pygtk
pygtk.require('2.0')
from gtk.gtkgl.apputils import *

from OpenGL.GLE import *

# Implement the GLScene interface
# to have a shape rendered.

class Shapes(GLScene,
             GLSceneButton,
             GLSceneButtonMotion):
    
    def __init__(self):
        GLScene.__init__(self,
                         gtk.gdkgl.MODE_RGB   |
                         gtk.gdkgl.MODE_DEPTH |
                         gtk.gdkgl.MODE_DOUBLE)
        
        self.light_ambient = [0.0, 1.0, 0.0, 1.0]
        self.light_diffuse = [1.0, 1.0, 1.0, 1.0]
        self.light_specular = [1.0, 1.0, 1.0, 1.0]
        self.light_position = [1.0, 1.0, 1.5, 0.0]
        
        self.mat_ambient = [0.2, 0.2, 0.2, 1.0]
        self.mat_diffuse = [0.8, 0.8, 0.8, 1.0]
        self.mat_specular = [1.0, 0.0, 1.0, 1.0]
        self.mat_shininess = 50.0
        
        self.depth = 105.0
        
        self.rotx = 0
        self.roty = 0
        self.rotz = 0
        
        self.beginx = 0
        self.beginy = 0
        
        # Empirically derived value for the background
        # to make it the same colour as the background
        # of all the widgets. This way the shapes will
        # appear as though they have been drawn on top
        # of the current window. It's specific to the
        # default Gtk+-2.2 theme only though. You can
        # also assign the current colour of any part of
        # the window from the colourselection dialog
        # by using the eye dropper. That's how I derived
        # at these values for guiBg.
        self.guiBg = [0.8627, 0.8549, 0.8353]
        self.colourFg = [1.0, 0.0, 0.0]
        self.colourBg = self.guiBg
        
        self.is_solid = False
        
        self.__drawShape = { 'Helicoid'     : self.__draw_helicoid,
                             'Teapot'       : self.__draw_teapot,
                             'Torus'        : self.__draw_torus,
                             'Sphere'       : self.__draw_sphere,
                             'Cube'         : self.__draw_cube,
                             'Cone'         : self.__draw_cone,
                             'Tetrahedron'  : self.__draw_tetrahedron,
                             'Octahedron'   : self.__draw_octahedron,
                             'Dodecahedron' : self.__draw_dodecahedron,
                             'Icosahedron'  : self.__draw_icosahedron,
                             'Cylinder'     : self.__draw_cylinder   }
        self.currentShape = 'Sphere'
        self.availableShapes = self.__drawShape.keys()
    
    # Private methods that are used in the expose
    # method in a transparent manner to provide the
    # underlying rendering for a specific shape.
    def __draw_icosahedron(self):
        glPushMatrix()
        glScalef(12.0, 12.0, 12.0)
        gtk.gdkgl.draw_icosahedron(self.is_solid)
        glPopMatrix()
    
    def __draw_dodecahedron(self):
        glPushMatrix()
        glScalef(10.0, 10.0, 10.0)
        gtk.gdkgl.draw_dodecahedron(self.is_solid)
        glPopMatrix()
    
    def __draw_octahedron(self):
        glPushMatrix()
        glScalef(12.0, 12.0, 12.0)
        gtk.gdkgl.draw_octahedron(self.is_solid)
        glPopMatrix()
    
    def __draw_tetrahedron(self):
        glPushMatrix()
        glScalef(12.0, 12.0, 12.0)
        gtk.gdkgl.draw_tetrahedron(self.is_solid)
        glPopMatrix()
    
    def __draw_cylinder(self):
        glPushMatrix()
        gluCylinder(gluQuadratic())
    
    def __draw_cone(self):
        gtk.gdkgl.draw_cone(self.is_solid, 6.0, 12.0, 30, 30)
    
    def __draw_cube(self):
        gtk.gdkgl.draw_cube(self.is_solid, 12)
    
    def __draw_helicoid(self):
        gleSetJoinStyle(TUBE_NORM_EDGE | TUBE_JN_ANGLE | TUBE_JN_CAP)
        gleHelicoid(1.0, 5.0, 1.0, -15.0, 6.0, None, None, 0.0, 1800.0)
    
    def __draw_teapot(self):
        gtk.gdkgl.draw_teapot(self.is_solid, 11.0)
    
    def __draw_torus(self):
        gtk.gdkgl.draw_torus(self.is_solid, 3.0, 12.0, 30, 30)
    
    def __draw_sphere(self):
        gtk.gdkgl.draw_sphere(self.is_solid, 12.0, 30, 30);
    
    # GLSceneInterface implementation.
    def init(self):
        glClearDepth(1.0)
        glClearColor(self.colourBg[0], self.colourBg[1], self.colourBg[2], 0.0)
        glColorMaterial(GL_FRONT_AND_BACK, GL_DIFFUSE)
        
        # The material properties are constant at this
        # stage, but if they need to be user selectable
        # then it'll be better to move these 4 calls
        # to the 'expose' method. That way everytime
        # the scene is rendered any change in materials
        # will be automatically detected without the
        # need for calling 'realize'.
        glMaterial(GL_FRONT, GL_AMBIENT,   self.mat_ambient)
        glMaterial(GL_FRONT, GL_DIFFUSE,   self.mat_diffuse)
        glMaterial(GL_FRONT, GL_SPECULAR,  self.mat_specular)
        glMaterial(GL_FRONT, GL_SHININESS, self.mat_shininess)
        
        glLight(GL_LIGHT0, GL_AMBIENT,  self.light_ambient)
        glLight(GL_LIGHT0, GL_DIFFUSE,  self.light_diffuse)
        glLight(GL_LIGHT0, GL_SPECULAR, self.light_specular)
        glLight(GL_LIGHT0, GL_POSITION, self.light_position)
        
        glLightModelfv(GL_LIGHT_MODEL_AMBIENT, self.light_ambient)
        glShadeModel(GL_SMOOTH)
        
        glDepthFunc(GL_LESS)
        
        glFrontFace(GL_CW)
        
        glEnable(GL_AUTO_NORMAL)
        glEnable(GL_NORMALIZE)
        glEnable(GL_LIGHTING)
        glEnable(GL_LIGHT0)
        glEnable(GL_DEPTH_TEST)
        glEnable(GL_COLOR_MATERIAL)
    
    def display(self, width, height):
        # Set the background colour first as the user has
        # the option of changing it, so we need to take that
        # into account during every expose event.
        glClearColor(self.colourBg[0], self.colourBg[1], self.colourBg[2], 0.0)
        glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT)
        
        glMatrixMode(GL_MODELVIEW)
        glLoadIdentity()
        glTranslatef(0.0, 0.0, -self.depth)
        glRotate(self.rotx, 1, 0, 0)
        glRotate(self.roty, 0, 1, 0)
        glRotate(self.rotz, 0, 0, 1)
        
        # Set the foreground colour as the user has
        # the option of changing it, so we need to take that
        # into account during every expose event.
        glColor(self.colourFg)
        self.__drawShape[self.currentShape]()
    
    def reshape(self, width, height):
        glViewport(0, 0, width, height)
        glMatrixMode(GL_PROJECTION)
        glLoadIdentity()
        
        # Calculate left/right and top/bottom clipping planes based on
        # the smallest square viewport.
        a = 13.0/min(width, height)
        clipping_planes = (a*width, a*height)
        # Setup the projection
        glFrustum(-clipping_planes[0], clipping_planes[0],
                  -clipping_planes[1], clipping_planes[1],
                  50.0, 150.0)
    
    def button_press(self, width, height, event):
        self.beginx = event.x
        self.beginy = event.y
    
    def button_release(self, width, height, event):
        pass
    
    def button_motion(self, width, height, event):
        if event.state == gtk.gdk.BUTTON1_MASK:
            self.rotx = self.rotx + ((event.y-self.beginy)/width)*360.0
            self.roty = self.roty + ((event.x-self.beginx)/height)*360.0
        elif event.state == gtk.gdk.BUTTON2_MASK:
            self.depth = self.depth - ((event.y-self.beginy)/(height))*50.0;
        
        if self.depth > 130.0: self.depth = 130.0;
        elif self.depth < 80.0: self.depth = 80.0;
        
        self.beginx = event.x
        self.beginy = event.y
        
        self.queue_draw()


# A window to show the Shapes scene
# in a GLArea widget along with two
# sliders for rotating the shape rendered
# in the scene. The shape can also be
# rotated using mouse button drag motion.

class ShapesWindow(gtk.Window):
    def __init__(self):
        gtk.Window.__init__(self)
        
        # Set self attfibutes.
        self.set_title('Shapes')
        self.set_position(gtk.WIN_POS_CENTER_ALWAYS)
        self.connect('destroy', lambda quit: gtk.main_quit())
#        if sys.platform != 'win32':
#            self.set_resize_mode(gtk.RESIZE_IMMEDIATE)
        self.set_reallocate_redraws(True)
        
        # Create the table that will hold everything.
        self.table = gtk.Table(3, 3)
        self.table.set_border_width(5)
        self.table.set_col_spacings(5)
        self.table.set_row_spacings(5)
        self.table.show()
        self.add(self.table)
        
        # The Shapes scene and the
        # GLArea widget to
        # display it.
        self.shape = Shapes()
        self.glarea = GLArea(self.shape)
        self.glarea.set_size_request(300,300)
        self.glarea.show()
        self.table.attach(self.glarea, 1, 2, 0, 1)
        
        # 3 Frames showing rotation sliders
        self.zframe = gtk.Frame('Z-Axis')
        self.zframe.show()
        self.zfbox = gtk.VBox()
        self.zfbox.set_border_width(10)
        self.zfbox.show()
        self.zadj = gtk.Adjustment(0.0, -360.0, 360.0, 5.0, 20.0, 0.0)
        self.zadj.connect('value_changed', self.zchanged)
        self.zscale = gtk.VScale(self.zadj)
        self.zscale.set_value_pos(gtk.POS_LEFT)
        self.zscale.show()
        self.zfbox.add(self.zscale)
        self.zframe.add(self.zfbox)
        self.table.attach(self.zframe, 0, 1, 0, 1,
                          xoptions=gtk.FILL, yoptions=gtk.FILL)
        
        self.xframe = gtk.Frame('X-Axis')
        self.xframe.show()
        self.xfbox = gtk.VBox()
        self.xfbox.set_border_width(10)
        self.xfbox.show()
        self.xadj = gtk.Adjustment(0.0, -360.0, 360.0, 5.0, 20.0, 0.0)
        self.xadj.connect('value_changed', self.xchanged)
        self.xscale = gtk.VScale(self.xadj)
        self.xscale.set_value_pos(gtk.POS_RIGHT)
        self.xscale.show()
        self.xfbox.add(self.xscale)
        self.xframe.add(self.xfbox)
        self.table.attach(self.xframe, 2, 3, 0, 1,
                          xoptions=gtk.FILL, yoptions=gtk.FILL)
        
        self.yframe = gtk.Frame('Y-Axis')
        self.yframe.show()
        self.yfbox = gtk.VBox()
        self.yfbox.set_border_width(10)
        self.yfbox.show()
        self.yadj = gtk.Adjustment(0.0, -360.0, 360.0, 5.0, 20.0, 0.0)
        self.yadj.connect('value_changed', self.ychanged)
        self.yscale = gtk.HScale(self.yadj)
        self.yscale.set_value_pos(gtk.POS_TOP)
        self.yscale.show()
        self.yfbox.add(self.yscale)
        self.yframe.add(self.yfbox)
        self.table.attach(self.yframe, 1, 2, 1, 2,
                          xoptions=gtk.FILL, yoptions=gtk.FILL)
        
        # A box to hold some control interface stuff.
        self.cbox = gtk.HBox(True, spacing=10)
        self.cbox.show()
        self.table.attach(self.cbox, 1, 2, 2, 3,
                          xoptions=gtk.FILL, yoptions=gtk.FILL)
        
        # A frame showing some colour changing buttons.
        self.colourFrame = gtk.Frame('Change Colour')
        self.colourFrame.show()
        self.cbox.pack_start(self.colourFrame)
        
        self.fbox1 = gtk.VBox()
        self.fbox1.set_border_width(10)
        self.fbox1.show()
        self.colourFrame.add(self.fbox1)
        
        self.colourButtonFg = gtk.Button('Foreground')
        self.colourButtonFg.connect('clicked', self.changeColourFg)
        self.colourButtonFg.show()
        self.fbox1.pack_start(self.colourButtonFg, expand=True, padding=5)
        
        self.colourButtonBg = gtk.Button('Background')
        self.colourButtonBg.connect('clicked', self.changeColourBg)
        self.colourButtonBg.show()
        self.fbox1.pack_start(self.colourButtonBg, expand=True, padding=5)
        
        # A frame holding menu and checkbutton for
        # changing the current shape attributes.
        self.shapeFrame = gtk.Frame('Shape Attrubutes')
        self.shapeFrame.show()
        self.cbox.pack_start(self.shapeFrame)
        
        self.fbox2 = gtk.VBox()
        self.fbox2.set_border_width(10)
        self.fbox2.show()
        self.shapeFrame.add(self.fbox2)
        # This is the option menu that lets the
        # user change the shape.
        self.shapeOptions = gtk.combo_box_new_text()
        for shape in self.shape.availableShapes:
            self.shapeOptions.append_text(shape)
        self.shapeOptions.connect('changed', self.shapeChanged)
        self.shapeOptions.set_active(0)
        self.shapeOptions.show()
        self.fbox2.pack_start(self.shapeOptions, expand=True, padding=5)
        
        self.solidButton = gtk.CheckButton('Solid Shape')
        self.solidButton.connect('toggled', self.shapeSolidityToggled)
        self.solidButton.show()
        self.fbox2.pack_start(self.solidButton, expand=True, padding=5)
    
    def shapeChanged(self, option):
        self.shape.currentShape = self.shape.availableShapes[self.shapeOptions.get_active()]
        self.glarea.queue_draw()
    
    def shapeSolidityToggled(self, button):
        self.shape.is_solid = not self.shape.is_solid
        self.glarea.queue_draw()
    
    def changeColourBg(self, button):
        dialog = gtk.ColorSelectionDialog("Changing colour of Background")
        dialog.set_transient_for(self)
        
        colorsel = dialog.colorsel
        colorsel.set_has_palette(True)
        
        response = dialog.run()
        if response == gtk.RESPONSE_OK:
            colour = colorsel.get_current_color()
            self.shape.colourBg = [colour.red/65535.0, colour.green/65535.0, colour.blue/65535.0]
            self.glarea.queue_draw()
        
        dialog.destroy()
    
    def changeColourFg(self, button):
        dialog = gtk.ColorSelectionDialog("Choose colour of Object")
        dialog.set_transient_for(self)
        
        colorsel = dialog.colorsel
        colorsel.set_has_palette(True)
        
        response = dialog.run()
        if response == gtk.RESPONSE_OK:
            colour = colorsel.get_current_color()
            self.shape.colourFg = [colour.red/65535.0, colour.green/65535.0, colour.blue/65535.0]
            self.glarea.queue_draw()
        
        dialog.destroy()
    
    def zchanged(self, zadj):
        self.shape.rotz = zadj.value
        self.glarea.queue_draw()
    
    def xchanged(self, zadj):
        self.shape.rotx = zadj.value
        self.glarea.queue_draw()
    
    def ychanged(self, yadj):
        self.shape.roty = yadj.value
        self.glarea.queue_draw()
    
    def run(self):
        self.show()
        gtk.main()


if __name__ == '__main__':
    app = ShapesWindow()
    app.run()
