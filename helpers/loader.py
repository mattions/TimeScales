# Author Michele Mattioni
# Fri Mar  6 11:38:37 GMT 2009

import os
import cPickle
import datetime
import numpy

class Loader():
    
    def __init__(self, prefix="./"):
        
        self.dirRoot = os.path.join(prefix, "Sims")
        
    
    def createSaveDir(self):
        """
            Create the directory where to put the simulation
        """
        today = datetime.date.today()
        free = False
        index = 0
        
        dirDate = today.strftime("%d-%m-%Y")
        
        dirComp = os.path.join(self.dirRoot, dirDate)
        dir = os.path.join(dirComp, "Sim_" + str(index))
        while not free :
            if os.path.exists(dir):
                index = index + 1
                simNum = "Sim_" + str(index)
                dir = os.path.join(dirComp, simNum )
            else:
                free = True
                os.makedirs(dir)
        return dir
    
    def saveObj(self, obj, name):
        
        """ Save results of the simulation. only the logger"""
        dir = self.createSaveDir()
        filepath = os.path.join (dir, name)
        FILE = open(filepath, 'w')
        cPickle.dump(obj, FILE, 1)
        FILE.close()
        print "Python object saved in %s" %os.path.abspath(filepath)
        return dir
    
    def loadObj(self, filename):
        
        """Load the ecellManager into memory"""
        
        FILE = open(filename, 'r')
        obj = cPickle.load(FILE)
        FILE.close()
        print "loaded file %s" %os.path.abspath(filename)
        return obj
    
    def convertToNumpy(self, vecDict):
        """Convert a dictionary of Hoc Vectors into one of Numpy Vecs"""
        vecsNu = {}
        for k,v in vecDict.iteritems():
            vecsNu[k] = numpy.array(v)
        return vecsNu
    
if __name__ == "__main__":
    import os
    a= [1,2,3]
    print "Test saving a list obj: %s" %a
    l = Loader()
    filename = "list.pickle"
    dir = l.saveObj(a, filename)
    loaded = l.loadObj(os.path.join(dir, filename))
    print "Loaded Obj: %s" %loaded
    print "Is the same object? %s" %(a == loaded)