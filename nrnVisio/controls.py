# Michele Mattioni
# Thu May 28 00:58:29 BST 2009

import sys
import gtk
import gtk.glade
import visio
import threading
import gobject
import os

class Controls(threading.Thread):
    
    def __init__(self):
        threading.Thread.__init__(self)

        # create widget tree ...
        self.builder = gtk.Builder()
        
        self.builder.add_from_file(os.path.join(os.path.dirname(__file__),
                                           "nrnVisioControl.glade"))
        self.builder.connect_signals(self)
        self.window = self.builder.get_object("window")
        

        self.visio = visio.Visio()
        self.window.show()
 
    def on_window_destroy(self, widget, data=None):
        print "You should kill visio window by yourself for now."
#        self.visio.display.hide()
#        self.window.hide()
        gtk.main_quit()
        
        
    def on_drag_clicked(self, btn, data=None):
        """To drag the model in the window"""
        self.visio.scene.mouse.events = 0 # Discard all the previous event
        self.visio.dragModel()
        
    def on_draw_clicked(self, widget, data=None):
        """Draw the whole model"""
        drawn = self.visio.drawModel()
        if drawn:
            btns = ["drag", "pick"]
            for name in btns:
                btn = self.builder.get_object(name)
                btn.set_sensitive(True)
        else:
            print "WARNING ! No Section created. Can't draw anything. Sorry."
        
    
    def on_pick_clicked(self, widget, data=None):
        """Pick a section"""
        sec = self.visio.pickSection()
        statusbar = self.builder.get_object("statusbar")
        context_id = statusbar.get_context_id("sectionInfo")
        statusbar.push(context_id, sec.name())
        self.selectedSec = sec
        
        
    def run(self):
        """Running the gtk loop in our thread"""
        gtk.main()

gobject.threads_init()

controls = Controls()
controls.start()