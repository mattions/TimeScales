# Michele Mattioni
# Thu May 21 11:46:55 BST 2009

import visual as vs
from neuron import h


class Visio():
    
    def __init__(self):
        self.scene = vs.display(title="nrnVisio")
        self.cil2sec = {}
        self.drawModel()
        print self.cil2sec
        #timer = LoopTimer(.2, self.processEvents())
        #timer.start()
        
        
    
    def processEvents(self):
        while(True):
            if self.scene.mouse.clicked:
                 m = self.scene.mouse.getclick()
                 loc = m.pos
                 print loc
                 picked = m.pick
                 if picked:
                     picked.color = (0,0,1) #blue
                     sec = self.cyl2sec(picked)
                     print "Section: %s Name: %s" %(sec, sec.name()) 

        
    def retrieveCoordinate(self, sec):
        coords = {}
        sec.push()
        print "section: %s n3d: %d" %(sec.name(),h.n3d())
        coords['x0'] = h.x3d((h.n3d()- h.n3d()))
        coords['x1'] = h.x3d((h.n3d()- 1))
        coords['y0'] = h.y3d((h.n3d()- h.n3d()))
        coords['y1'] = h.y3d((h.n3d()- 1))
        coords['z0'] = h.z3d((h.n3d()- h.n3d()))
        coords['z1'] = h.z3d((h.n3d()- 1))
        h.pop_section()
        return coords
        
    
    def drawSection(self, sec):
        coords = self.retrieveCoordinate(sec)
        x_ax = coords['x1'] -coords['x0']
        y_ax = coords['y1'] -coords['y0']
        z_ax = coords['z1'] -coords['z0']
        cyl = vs.cylinder(pos=(coords['x0'],coords['y0'],coords['z0']), 
                          axis=(x_ax,y_ax,z_ax), radius=sec.diam/2)
        
        self.cil2sec[cyl] = sec
    
    
    
    
    def findSecs(self, secList, secName):
        selectedSec = None
        for sec in secList:
            if hasattr(sec, "head"): # it's a spine
                spines_attr = ["head","neck","psd"]
                for attr in spines_attr:
                    #print attr, sec.__dict__[attr].name(), secName    
                    if sec.__dict__[attr].name() == secName:
                        selectedSec = sec
                        print "Found sec %s, spine %s" %(sec.__dict__[attr].name(), sec.id)
                        break
            else: # Normal secion
            
                if sec.name() == secName:
                    selectedSec = sec
                    break
        if selectedSec is None:
            return ""    
            
        return selectedSec
    
    def drawModel(self):
        
        h.define_shape()
        for sec in h.allsec():
            self.drawSection(sec)
        