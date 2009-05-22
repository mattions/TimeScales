# Michele Mattioni
# Thu May 21 11:46:55 BST 2009

import visual as vs
from neuron import h



#create logger

class Visio(object):
    
    def __init__(self):
        
        self.scene = vs.display(title="nrnVisio")
        self.cyl2sec = {}
        self.drawModel()
        self.vecRefs = []
        
        
        
    
    def pickSection(self):
        while(True):
            if self.scene.mouse.clicked:
                 m = self.scene.mouse.getclick()
                 loc = m.pos
                 print loc
                 picked = m.pick
                 if picked:
                     picked.color = (0,0,1) #blue
                     sec = self.cyl2sec[picked]
                     return sec
                     
                     #print "Section: %s Name: %s" %(sec, sec.name())
    
    
    
    def createVector(self, var):
        sec = self.pickSection()
        vecNotPresent = True
        for vecRef in self.vecRefs:
            print "Searched: var %s, sec %s.\tCurrent var: %s sec: %s" %(var, sec, vecRef.var, vecRef.sec) 
            if vecRef.var == var and vecRef.sec == sec:
                  vecNotPresent = False
                  break
        if vecNotPresent:      
            vec = h.Vector()
            varRef = '_ref_' + var
            vec.record(getattr(sec(0.5), varRef))
            vecRef = VecRef(var, vec, sec)
            self.vecRefs.append(vecRef)     

    def plotVector(self, tPoints, varPoints):
        curve = vs.graph.gcurve()
         
        for i in range(tPoints, vaPoints):
            curve.plot(pos=(tPoints[i], varPoints[i]))
        
        return curve
                       
    def retrieveCoordinate(self, sec):
        coords = {}
        sec.push()
        #self.logger.debug( "section: %s n3d: %d" %(sec.name(),h.n3d()))
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
        
        self.cyl2sec[cyl] = sec
    
    def visualizeSectionPotential(self):
        pass
    
    
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

class VecRef(object):
    
    def __init__(self, var, vec, sec):
        self.var = var
        self.vec = vec
        self.sec = sec


        