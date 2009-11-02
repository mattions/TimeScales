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
    
class Storage(object):
    """Class to store in one place: the vecRef for the electrical,
    the timecourses for the spines, the weight of the synapses"""
    
    def __init__(self, calciumSampling, dtNeuron, tEquilibrium):
        """Set the calcium update, the neuron dt, the neuron 
        equilibrium and the ecell equilibrium"""
        self.calciumSampling = calciumSampling
        self.dtNeuron = dtNeuron
        self.tEquilibrium = tEquilibrium
        
    def set_vecRefs(self, vecRefs):
        """Set the vecRef in the class"""
        self.vecRefs = vecRefs
    
    def set_timecourses(self, time_courses):
        """Save the timecourses"""
        self.time_courses = time_courses
    
    def set_synVecRefs(self, synVecRefs):
        """Set the synapses weight"""
        self.synVecRefs = synVecRefs
        
    def set_spines(self, spines_id, spines_pos, spines_parent):
        """Stores the spines id, position and parent segment. 
        All This info are required to rebuild the model."""
        self.spines_id = spines_id
        self.spines_pos = spines_pos
        self.spines_parent = spines_parent