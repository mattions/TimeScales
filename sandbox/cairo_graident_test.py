#!/usr/bin/python

import gtk
import math
import cairo

class PyApp(gtk.Window):

    def __init__(self):
        super(PyApp, self).__init__()

        self.set_title("Simple drawing")
        self.resize(400, 150)
        self.set_position(gtk.WIN_POS_CENTER)

        self.connect("destroy", gtk.main_quit)

        darea = gtk.DrawingArea()
        darea.connect("expose-event", self.expose)
        self.add(darea)

        self.show_all()
    
    def expose(self, widget, event):

        cr = widget.window.cairo_create()
        w = self.allocation.width
        h = self.allocation.height

        cr.rectangle(0, 0, w/2 , h)
        self.offset1 = 0 # Start gradient
        self.offset2 = 1 # End gradient
        linear = cairo.LinearGradient(0, h/2, w/2, h/2)
        self.color1 = [0, 0.3, 0.8]
        self.color2 = [0, 0.8, 0.3]
        linear.add_color_stop_rgb(self.offset1, self.color1[0], self.color1[1], 
                                       self.color1[2])
        linear.add_color_stop_rgb(self.offset2, self.color2[0], self.color2[1], 
                                       self.color2[2])
        cr.set_source(linear)
        cr.fill()
        
        # show the calculated color from the gradient
        col = self.calc_gradient(0.4)
        cr.rectangle(w/2, 0, w/2 + w/4, h) # Drawing half of the window
        cr.set_source_rgb(col[0], col[1], col[2])
        cr.fill()
        
        col = self.calc_gradient(0.6)
        cr.rectangle(w/2 + w/4, 0, w, h) # Drawing half of the window
        cr.set_source_rgb(col[0], col[1], col[2])
        cr.fill()
        
    def calc_gradient(self, offset):
             
        real_offset = (offset - self.offset1) / (self.offset2 - self.offset1)
        rgb = [0, 0, 0]
        for i, primary in enumerate (self.color1):
            rgb[i] = (self.color2[i] - self.color1[i]) * real_offset + self.color1[i]
        #print rgb, real_offset
        return rgb

pyApp = PyApp()
gtk.main()