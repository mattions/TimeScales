# Author: Michele Mattioni
# Wed Nov 12 11:02:01 GMT 2008

#===============================================================================
# This create the MSP neuron and set all the variable.
#===============================================================================

import neuron
from math import cos, sin, fabs, pi, radians


class Branch:
    
    def __init__(self, hoc):
        self.h = hoc
        self.mid = []
        self.dist = []
    
    def create(self, numMidDends, numDistDends):
        # Create the distal section
        self.prox = self.h.Section()
        
        # Create the Mid Dend 
        for i in xrange(numMidDends):       # Middle Dends
            
            mid_dend = self.h.Section()
            self.mid.append(mid_dend)
            mid_dend.connect(self.prox)
            
        for j in xrange(numDistDends):      # Distal Dends
            dist_dend = self.h.Section()
            self.dist.append(dist_dend)
            if j < 2:
                dist_dend.connect(self.mid[0])
            else:
                dist_dend.connect(self.mid[1])
            





class MediumSpinyNeuron:
    
    def __init__(self):
        self.h = neuron.h
        self.topology()
        for branch in self.branches:
            self.geom(branch)       
        # TODO Set the 3D geometry properly
        #self.shape3d() # Disabled untill BUG fixed
        
        # TODO Set the nseg correctly
        
        self.biophys()
        
    def topology(self):
        self.soma = self.h.Section()
        self.branches = []
        numProxDends = 4 # Proximal Dends
        for i in xrange(numProxDends):
            branch = Branch(self.h)
            branch.create(2,4)

            #self.createBranch(2, 4)
            # Connnecting in a symmetrical way
            if i < 2 :
                branch.prox.connect(self.soma, 0) 
            else:
                branch.prox.connect(self.soma, 1)
            self.branches.append(branch)
        

                
    def geom(self, branch):
        """Wilson 1992 Single Neuron Computation
           dendritic diam(um) * (1+spine/dend ratio)
           also O'Donnell 1993 Synapse
           Koch/Segev Methods in Neuronal Modeling pg 122-3, 1998
           
           Changed the lenght obtainend adding the spines areas with the real lenght. 
           The other one should be obtained with adding the spines itself
           """
        # Soma
        self.setGeoms(self.soma, 16, 16)
        # Prox
        self.setGeoms(branch.prox, 20, 2.25) 
        # Mid
        for mid in branch.mid:
            self.setGeoms(mid, 20, 1) # L = 24.23        diam = 1 * (1+0.3)
        # Dist
        for dist in branch.dist:
            self.setGeoms(dist, 190, 0.72) #L = 395.2     diam = 0.5 * (1+2) 

    def calcCoords(self, r, phi, theta):
        x = r * sin (radians(phi)) * cos (radians(theta))
        y = r * sin (radians(phi)) * sin (radians(theta))
        z = r * cos(radians(phi))
#        x = r * cos(theta)
#        y = r * sin(theta)
#        z = 0
        coords = (x,y,z)
        return x,y,z
    
    def add3dpoint(self, sec, x_start, y_start, z_start, x,y,z):
        sec.push()
        #self.h.pt3dclear()
        self.h.pt3dadd(x_start,y_start, z_start, sec.L)
        self.h.pt3dadd(x,y,z, sec.L)
        self.h.pop_section()
        print "%s x0: %f y0: %f z0: %f x: %f y: %f z: %f" %(sec.name(), x_start, 
                                                            y_start, z_start, x, y, z)
    
    def shape3d(self):
        
        # Soma
        self.add3dpoint(self.soma, 0, 0, 0, 15, 0, 0)
        theta = 0
        phi = 90
        mid_diff = 45
        dist_diff = 20
        for i, branch in enumerate (self.branches):
              
        # Prox Dend
            if i < 2 & i != 0:
                theta = theta + 90
                x,y,z = self.calcCoords(branch.prox.L , phi, theta)
                self.add3dpoint(branch.prox, 0, 0, 0, x, y, z)
            elif i > 2:
                theta = theta + 90
                x,y,z = self.calcCoords(branch.prox.L, phi, theta)
                self.add3dpoint(branch.prox, 15, 0, 0, 15 + x, 0 + y, 0 + z)
            elif i == 0:
                x,y,z = self.calcCoords(branch.prox.L, phi, theta)
                self.add3dpoint(branch.prox, 0, 0, 0, x, y, z)  
            
            # Mid Dend
            for j, m_d in enumerate(branch.mid):
                m_theta = 0
                if j == 0:
                    m_theta = theta + mid_diff
                elif j == 1:
                    m_theta = theta - mid_diff
                print "m theta : %d " % m_theta
                xx, yy, zz = self.calcCoords(m_d.L, phi, m_theta )
                self.add3dpoint(m_d, x, y, z, self.sumCoords(x, xx), 
                                self.sumCoords(y, yy), 
                                self.sumCoords(z, zz))
                print "Branch number: %d mid: %d" % (i, j)  
                
                # Dist Dend
                for k, d_d in enumerate(branch.dist):
                    d_theta = 0
                    if k == 0 | k == 2:
                        d_theta = theta + dist_diff
                    elif k == 1 | k == 3:
                        d_theta = theta - dist_diff
                        
                    xxx,yyy,zzz = self.calcCoords(d_d.L, phi, d_theta )
                    self.add3dpoint(d_d, xx, yy, zz, 
                                    self.sumCoords(xx, xxx),
                                    self.sumCoords(yy, yyy),
                                    self.sumCoords(zz, zzz) )
                    print "i: %d j: %d k: %d theta: %d m_theta: %d d_theta: %d" %(i, j, k, theta,
                                                                                  m_theta, d_theta)
        
    def sumCoords(self, old, new):
        if new < 0:
            coord = fabs(old) + fabs(new)
            coord = - coord
        else:
            coord = old + new
        return coord
            
    def setGeoms(self, sec, lenght, diam):
        """Set the lenght of the section and the diam of all the segs"""
        sec.L = lenght
        for seg in sec:
            seg.diam = diam
    
    def biophys(self):
        """Insert all the channels required"""
        
        self.soma.insert('pas')
        self.soma.insert('naf')
        self.soma.insert('nap')
        self.soma.insert('kir')
        self.soma.insert('kas')
        self.soma.insert('kaf')
        self.soma.insert('krp')
        self.soma.insert('bkkca')
        self.soma.insert('skkca')
        self.soma.insert('caldyn')
        self.soma.insert('caL')
        self.soma.insert('caL13')
        self.soma.insert('cadyn')
        self.soma.insert('can')
        self.soma.insert('caq')
        self.soma.insert('car')    
        self.soma.insert('cat')


        
        for branch in self.branches:
            # Prox Dends
            branch.prox.insert('pas')
        
            branch.prox.insert('naf')
            branch.prox.insert('nap')
        
            branch.prox.insert('kir')
            branch.prox.insert('kas')
            branch.prox.insert('kaf')
            branch.prox.insert('bkkca')
            branch.prox.insert('skkca')
        
            branch.prox.insert('caldyn')
            branch.prox.insert('caL')
            branch.prox.insert('caL13')
        
            branch.prox.insert('cadyn')
            branch.prox.insert('can')
            branch.prox.insert('caq')
            branch.prox.insert('car')
            branch.prox.insert('cat')


            # Mid dends
            for dend in branch.mid:
                dend.insert('pas')
            
                dend.insert('naf')
                dend.insert('nap')
            
                dend.insert('kir')
                dend.insert('kas')
                dend.insert('kaf')
                dend.insert('bkkca')
                dend.insert('skkca')
            
                dend.insert('caldyn')
                dend.insert('caL')
                dend.insert('caL13')
                dend.insert('cadyn')
                dend.insert('can')
                dend.insert('caq')
                dend.insert('car')
                dend.insert('cat')

            #Dist
            for dend in branch.dist:
                    dend.insert('pas')

                    dend.insert('naf')
                    dend.insert('nap')
                
                    dend.insert('kir')
                    dend.insert('kas')
                    dend.insert('kaf')
                    dend.insert('bkkca')
                    dend.insert('skkca')
                
                    dend.insert('caldyn')
                    dend.insert('caL')
                    dend.insert('caL13')
                    dend.insert('cadyn')
                    dend.insert('can')
                    dend.insert('caq')
                    dend.insert('car')
                    dend.insert('cat')

            
        
if __name__ == "__main__":
    msn = MediumSpinyNeuron()
        
            
        
        