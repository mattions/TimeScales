# Author Michele Mattioni
# date Tue Dec  8 15:55:10 GMT 2009

from helpers.loader import Loader
import matplotlib.pyplot as plt


class spinePercentual(object):
    
    def __init__(self):
        self.soma_radius = 8
        self.prox_ex = self.soma_radius + 20 
        self.mid_ex = self.prox + 20
        self.dist_ex = self.mid + 190

    def reduce_noise(self, spines_pos):
        """We don't take in account the first 5 spines position"""
        pos_to_remove = 5
        for i in range(pos_to_remove):
            spines_pos.pop(0)
        return spines_pos
    
    def convert_to_perc(self, spines_pos):
        """Convert the position to a normalized per dend pos"""
        # Divide the spines for dends
        self.mid = []
        self.dist = []
        
        for sp in spines_pos:
            if self.prox_ex < sp < self.mid_ex:
                x = self.calc_perc_pos(self.prox_ex, self.mid_ex, sp)
                self.mid.append(x)
            elif self.mid_ex < sp < self.dist_ex:
                x = self.calc_perc_pos(self.mid_ex, self.dist_ex, sp)
                self.dist.append(x)
        
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
    plt.hist(spines_pos, bins=30, histtype='stepfilled')
    
    spinePer = spinePercentual()
    spines_pos = spinePer.reduce_noise(spines_pos)
    
    plt.hist(spines_pos, 30, histtype='stepfilled')
    plt.legend(('normal', 'noise red'), loc=0)
    
    print "Calculating the spines pos normalized to 1"
    spinePer.convert_to_perc(spines_pos)
    
    plt.show()