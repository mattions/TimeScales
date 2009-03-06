# Author Michele Mattioni
# Fri Mar  6 11:38:37 GMT 2009

import os
import cPickle
import datetime

class IOHelper():
    
    def __init__(self):
        
        self.ecellManFileName = "ecellManagerObj"
        self.dirRoot = "Sims"
        
    
    def createSaveDir(self):
        """
            Create the directory where to put the simulation
        """
        today = datetime.date.today()
        free = False
        index = 0
        
        dirDate = today.strftime("%d-%m-%Y")
        
        dirComp = os.path.join(self.dirRoot, dirDate)
        dir = os.path.join(dirComp, str(index))
        while not free :
            if os.path.exists(dir):
                index = index + 1
                simNum = "Sim_" + str(index)
                dir = os.path.join(dirComp, simNum )
            else:
                free = True
                os.makedirs(dir)
        return dir
    
    def saveObj(self, ecellManager, name):
        
        """ Save results of the simulation. only the logger"""
        dir = self.createSaveDir()
        filepath = os.path.join (dir, name)
        FILE = open(filepath, 'w')
        cPickle.dump(ecellManager, FILE, 1)
        FILE.close()
        print "Python object saved in %s" %filepath
        return filepath
    
    def loadObj(self, filename):
        
        """Load the ecellManager into memory"""
        
        FILE = open(filename, 'r')
        obj = cPickle.load(FILE)
        FILE.close()
        print "loaded file %s" %(filename)
        return obj
    
if __name__ == "__main__":
    
    a= [1,2,3]
    print "Test saving a list obj: %s" %a
    ioH= IOHelper()
    dir = ioH.saveObj(a, "list")
    loaded = ioH.loadObj(dir)
    print "Loaded Obj: %s" %loaded
    print "Is the same object? %s" %(a == loaded)