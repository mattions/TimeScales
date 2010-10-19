# Michele Mattioni
# Tue Aug 10 09:08:06 BST 2010

from neuronvisio.manager import BaseRef

class TimeSeries(BaseRef):
    """
    Extend the classic VecRef from Neuronvisio to allocate 
    the biochemical results.
    """
    
    def __init__(self, sec_name=None, vecs=None, detail=None):
        
        BaseRef.__init__(self)
        self.sec_name = sec_name
        self.vecs = vecs
        self.detail = detail

class WeightRef(BaseRef):
    """
    Extend the classic VecRef from Neuronvisio to allocate 
    the biochemical results.
    """
    
    def __init__(self, sec_name=None, vecs=None, detail=None):
        
        BaseRef.__init__(self)
        self.sec_name = sec_name
        self.vecs = vecs
        self.detail = detail



class ExtRef(object):
    "Holds all the methods to add new ref to the manager"
    

    def add_timeseries(self, manager, stim_spines, nrnSim):
        """Adding timeseries from the ecell world to the manager"""
        for spine_id in stim_spines:
            
            spine = nrnSim.spines[spine_id]
            # Retrieving the biochemical timecourses
            spine.ecellMan.converToTimeCourses()
            time_courses = spine.ecellMan.timeCourses 
            
            pos = str(spine.pos)
            parent = spine.parent.name()
            detail = parent + "_" + pos
            sec_name = str(spine.id)
            
            # Adding a record for each variable
            vecs = {}
            time = None
            for var in time_courses.keys():
                time = time_courses[var][:,0]
                vecs[var] = time_courses[var][:,1]
                
            timeseriesRef = TimeSeries(sec_name=sec_name, 
                                       vecs=vecs,
                                       detail=detail)
            # Ecell use an adaptative time for the integration so the time is different
            # for each spine.
            # We create a custum timeseries to differentiate within them
            timeseriesRef.group_id = "timeSeries_" + spine.id
            manager.add_ref(timeseriesRef, time)
            
    def add_weights(self, manager, stim_spines, nrnSim):
        """Add the weight to the manager"""
        for spine_id in stim_spines:
            spine = nrnSim.spines[spine_id]
            
            pos = str(spine.pos)
            parent = spine.parent.name()
            detail = parent + "_" + pos
            sec_name = str(spine.id)
            
            vecs = {}
            time = None
            
            for syn in spine.synapses:
                if syn.chan_type == 'ampa':
                    if syn.weight[0]:
                        time = syn.weight[0]
                        weight = syn.weight[1]
                        vecs['weight'] = weight
                        vecs['k_flux'] = spine.k_flux
                        weightRef = WeightRef(sec_name=sec_name,
                                              vecs=vecs,
                                              detail=detail)
                        manager.add_ref(weightRef, time)