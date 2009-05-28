# Michele Mattioni
# Thu May 28 00:58:29 BST 2009

import sys
import gtk
import gtk.glade
import visio
import neuronControl

class Controls:
 
    def on_window_destroy(self, widget, data=None):
        print "Cya"
        gtk.main_quit()
        
    def on_drag_toggled(self, btn, data=None):
        self.visio.dragModel(btn)
     
    def __init__(self):
    
        # create widget tree ...
        builder = gtk.Builder()
        
        builder.add_from_file("nrnVisioControl.glade")
        builder.connect_signals(self)
        self.window = builder.get_object("window")
        
        # Instatiate nrnSim for testing
        nrnSim = neuronControl.NeuronSim(mod_path="../mod", hoc_path="../hoc", 
                      spines=True, biochemical=False, 
                      biochemical_filename="../biochemical_circuits/biomd183_noCalcium.eml")
        
        self.visio = visio.Visio()
        self.window.show()
        
       
    
if __name__ == "__main__":
    controls = Controls()
    gtk.main()
