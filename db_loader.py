# Michele Mattioni
# Thu Dec 17 17:42:52 GMT 2009

"""Load the simulation results saved in a sqlite fashion and map them 
to NeuronVisio data structure"""


import sqlite3
import cPickle

from neuronvisio.manager import Manager, VecRef, SynVecRef
from neuron import h


#def get_vecRefs(path_to_sqlite):
path_to_sqlite = "Sims/10-02-2010/Sim_3/storage.sqlite"
conn = sqlite3.connect(path_to_sqlite)
cursor = conn.cursor()

sql_stm = """SELECT * from Vectors""" 

cursor.execute(sql_stm)
vecRefs = []
time = None

for row in cursor:
    # time
    
    # vecrRef
    sec_name = str(row[1])
    if hasattr(h, sec_name):
        
        # build the sec
        nrn_sec = eval('h.' + sec_name)
        vecRef = VecRef(nrn_sec)
        var = str(row[0])
        array = cPickle.loads(str(row[2]))
        vecRef.vecs[var] = array
        vecRefs.append(vecRef)
    else: #it the time
        time = cPickle.loads(str(row[2])) 
#return vecRefs