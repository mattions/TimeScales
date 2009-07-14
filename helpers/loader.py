# Author Michele Mattioni
# Fri Mar  6 11:38:37 GMT 2009

import os
import cPickle
import datetime
import numpy

class Loader(object):
    def __init__(self):
        
        self.dirRoot = None 
        
    
    
    def create_new_dir(self, prefix="./"):
        """
            Create the directory where to put the simulation
        """
        self.dirRoot = os.path.join(prefix, "Sims")
        
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
    
    def save(self, obj, dir, name):
        """ Save The object in binary form with the given name
        
        params:
        obj - The python object
        name - the name to give to the saved object"""
        
        filepath = os.path.join (dir, name)
        FILE = open(filepath, 'w')
        cPickle.dump(obj, FILE, 1)
        FILE.close()
        print "Python object saved in %s" %os.path.abspath(filepath)
    
    def load(self, filename):
        """Load the python object into memory from the filename
        
        params:
        filename - path to the binary python object"""
        
        FILE = open(filename, 'r')
        obj = cPickle.load(FILE)
        FILE.close()
        print "loaded file %s" %os.path.abspath(filename)
        return obj
    
    def convert_to_numpy(self, vecDict):
        """Convert a dictionary of Hoc Vectors into one of Numpy Vecs"""
        vecsNu = {}
        for k,v in vecDict.iteritems():
            vecsNu[k] = numpy.array(v)
        return vecsNu