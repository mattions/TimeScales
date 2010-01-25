# Author Michele Mattioni
# date Tue Dec  8 15:55:10 GMT 2009

from helpers.loader import Loader
import matplotlib
import matplotlib.pyplot as plt


class spinePercentual(object):
    
    def __init__(self):
        self.soma_radius = 8
        self.prox_ex = self.soma_radius + 20 
        self.mid_ex = self.prox_ex + 20
        self.dist_ex = self.mid_ex + 190

    def reduce_noise(self, spines_pos):
        """We don't take in account the first 5 spines position"""
        pos_to_remove = 5
        for i in range(pos_to_remove):
            spines_pos.pop(0)
        return spines_pos
    
    def convert_to_perc(self, spines_pos):
        """Convert the position to a normalized per dend pos"""
        # Divide the spines for branch
        
        # Two mid dendrite for branch
        self.mids = [[],[]]
        
        # 4 Distal dendrite for branch.
        self.dists = [[],[],[],[]]
        
        for sp in spines_pos:
            if self.prox_ex < sp < self.mid_ex: #Mid dend
                
                x = self.calc_perc_pos(self.prox_ex, self.mid_ex, sp)
                # Add the spine to the dendrite which have less spines
                shortest = min(self.mids, key=len)
                
                shortest.append(x)
                    
            elif self.mid_ex < sp < self.dist_ex: # Dist dend
                
                x = self.calc_perc_pos(self.mid_ex, self.dist_ex, sp)
                shortest = min(self.dists, key=len) 
                shortest.append(x)
    
    
        # Insert the spines in perc
    def calc_perc_pos(self, start, end, value):
        """Calc the percentual of the spine in the dends
        lenght : 1 = value : x
        x = value/lenght 
        """
        real_value = value - start
        length = end -start
        x = real_value/length
        return x
        
if __name__ == "__main__":
    l = Loader()
    
    spines_pos = l.load('spines_pos.pickle')
    plt.hist(spines_pos, bins=30, label='normal')
    
    spinePer = spinePercentual()
    spines_pos = spinePer.reduce_noise(spines_pos)
    
    plt.hist(spines_pos, bins=30, label='noise red')
    plt.legend()
    
    print "Calculating the spines pos normalized to 1"
    spinePer.convert_to_perc(spines_pos)
    l.save(spinePer.mids, '.', 'mid_spines_per_branch.pickle')
    l.save(spinePer.dists, '.', 'dist_spines_per_branch.pickle')
    plt.show()