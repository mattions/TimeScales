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
    """Main GTK control window. create a control object and start with
    controls.start()"""
    def __init__(self):
        threading.Thread.__init__(self)
        
        # Selected Section
        self.selectedSec = None # Used from pick


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
            msg="No Section created. Can't draw anything. Have you created any section?"
            print msg
            warning_dial = gtk.MessageDialog(parent=None, flags=gtk.DIALOG_DESTROY_WITH_PARENT, 
                                             type=gtk.MESSAGE_WARNING, 
                                             buttons=gtk.BUTTONS_CLOSE, 
                                             message_format=msg)
            warning_dial.run()
            warning_dial.destroy()
        
    
    def on_pick_clicked(self, widget, data=None):
        """Pick a section"""
        sec = self.visio.pickSection()
        statusbar = self.builder.get_object("statusbar")
        context_id = statusbar.get_context_id("sectionInfo")
        if (hasattr(sec, "id")):
            statusbar.push(context_id, "%s (%s)" %(sec.id, sec.name()))
        else:
            statusbar.push(context_id, "%s" %sec.name())
        self.selectedSec = sec
        
    def on_createVector_clicked(self, widget, data=None):
        """Create the vectors list"""
        # Grab the variable
        entry = self.builder.get_object("var_entry")
        var = entry.get_text()
        
        if var is "":
            msg = "No var found. Please enter a variable to record. (i.e.: v)"
            warning_dial = gtk.MessageDialog(parent=None, flags=gtk.DIALOG_DESTROY_WITH_PARENT, 
                                 type=gtk.MESSAGE_WARNING, 
                                 buttons=gtk.BUTTONS_CLOSE, 
                                 message_format=msg)
            warning_dial.run()
            warning_dial.destroy()
        else:
            # Grab the section
            selectedSection_radio_btn = self.builder.get_object("selected_sec_btn")
            
            allSection_radio_btn = self.builder.get_object("all_sections_btn")
            # Only for one section
            if selectedSection_radio_btn.get_active():
                if self.selectedSec is None:
                    msg = "No section selected. Please select a section."
                    warning_dial = gtk.MessageDialog(parent=None, 
                                                     flags=gtk.DIALOG_DESTROY_WITH_PARENT, 
                                                     type=gtk.MESSAGE_WARNING, 
                                                     buttons=gtk.BUTTONS_CLOSE, 
                                                     message_format=msg)
                    warning_dial.run()
                    warning_dial.destroy()
                    
                else:
                    success = self.visio.addVecRef(var, self.selectedSec)
                    if not success:
                        msg="Impossible to create the vector.\
                        The section does not have the variable to record or \
                        the vector is already present"
                        warning_dial = gtk.MessageDialog(parent=None, 
                                                         flags=gtk.DIALOG_DESTROY_WITH_PARENT, 
                                                         type=gtk.MESSAGE_WARNING, 
                                                         buttons=gtk.BUTTONS_CLOSE, 
                                                         message_format=msg)
                        warning_dial.run()
                        warning_dial.destroy()
            elif allSection_radio_btn.get_active():
                self.visio.addAllVecRef(var)
                
        
                
                    
            
    
    def run(self):
        """Running the gtk loop in our thread"""
        gtk.main()
    
    

gobject.threads_init()