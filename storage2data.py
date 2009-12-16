# Author Michele Mattioni
# date Wed Nov 11 11:41:01 GMT 2009

import sys
from helpers.loader import Loader 
import re
import os

def write_vec_to_file(vecRefs, dir="."):

    try:
        file = open (os.path.join(dir, 'data.txt'), 'w')
        file_spines = open(os.path.join(dir, 'spines.txt'), 'w')
    except:
        "Can't open the file"
        sys.exit(1)
    sections = ""
    lines = []
    current_line = ""
    lenght = None
    
    soma = None
    proxs = []
    mids = []
    dists = []
    spines = []
    
    spines_belongs = {}
    prox_re = re.compile("MSP_Cell\[0\]\.dend\d")
    mid_re = re.compile("MSP_Cell\[0\]\.dend\d_\d\[0\]")
    dist_re = re.compile("MSP_Cell\[0\]\.dend\d_\d\[[1,2]\]")
    spine_re = re.compile('spine\d+')
    
    
    for vecRef in vecRefs:
        if spine_re.match(vecRef.sec_name):
            spines.append(vecRef)
            
        elif dist_re.match(vecRef.sec_name):
            dists.append(vecRef)
            spines_belongs[vecRef.sec_name] = []
            
        elif mid_re.match(vecRef.sec_name):
            mids.append(vecRef)
            
        elif prox_re.match(vecRef.sec_name):
            proxs.append(vecRef)
            
        else:
            soma = vecRef
    
    #writing dist
    for dist in dists:
        sections +=  dist.sec_name + "\t"
    # writing medium
    for mid in mids:
        sections +=  mid.sec_name + "\t"
        
    for prox in proxs:
        sections +=  prox.sec_name + "\t"
    
    # soma
    
    sections +=  soma.sec_name + "\t"
    lenght = len(soma.vecs['v'])
    
    for spine in spines:
        sections +=  spine.sec_name + "\t"

    file.write(sections +"\n")
    
    for i, spine in enumerate(sto.spines_id):
        spines_belongs[sto.spines_parent[i]].append(sto.spines_id[i])
    
    for k,v in spines_belongs.iteritems():
        list_spine = ""
        if len(v) == 0:
            list_spine = "\n"
        for i,s in enumerate(v):
            
            if i+1 == len(v):
                list_spine += s +"\n"
            else:
                list_spine += s +","
            
        file_spines.write(k + ":" + list_spine)
    file_spines.close()
    for i in range(lenght):
#    for i in range(3):
        
        current_line = ""
        for vecRef in dists:
            current_line += str(vecRef.vecs['v'][i]) + "\t"
            
        for vecRef in mids:
            current_line += str(vecRef.vecs['v'][i]) + "\t"
            
        for vecRef in proxs:
            current_line += str(vecRef.vecs['v'][i]) + "\t"
            
        current_line += str(soma.vecs['v'][i]) + "\t"
        
        for vecRef in spines:
            current_line += str(vecRef.vecs['v'][i]) + "\t"
            
        file.write(current_line +"\n")
        
    file.close()
    
    
if __name__ == "__main__":
    
    if len(sys.argv) != 2:
        print "Submit the location of the storage object to transform"
    storage = sys.argv[1]
    
    l = Loader()
    sto = l.load(storage)
    dir = os.path.dirname(storage)
    write_vec_to_file(sto.vecRefs, dir=dir)
    print "files written in %s" %dir
    