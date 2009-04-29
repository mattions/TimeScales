# Author: Michele Mattioni
# Wed Nov 12 11:02:01 GMT 2008

#===============================================================================
# This create the MSP neuron and set all the variable.
#===============================================================================

import neuron
from math import cos, sin, fabs, pi, radians, sqrt
import os


class Branch:
    
    def __init__(self):

        self.prox = None # Will be a Section
        self.mid = []
        self.dist = []
    
    def create(self, numMidDends, numDistDends):
        # Create the distal section
        self.prox = h.Section()
        
        # Create the Mid Dend 
        for i in xrange(numMidDends):       # Middle Dends
            
            mid_dend = h.Section()
            self.mid.append(mid_dend)
            mid_dend.connect(self.prox)
            
        for j in xrange(numDistDends):      # Distal Dends
            dist_dend = h.Section()
            self.dist.append(dist_dend)
            if j < 2:
                dist_dend.connect(self.mid[0])
            else:
                dist_dend.connect(self.mid[1])
            

class MediumSpinyNeuron:
    
    def __init__(self, hoc_path="../hoc", mod_path="../mod"):
        
        if not os.path.exists(mod_path) :
            print "ERROR mod path %s doesn't exist" %os.path.realpath(mod_path)
            sys.exit(1)
        neuron.load_mechanisms(mod_path)
        
        if not os.path.exists(hoc_path):
            print "ERROR hoc path %s doesn't exist" %os.path.realpath(hoc_path)
            sys.exit(1)
        
        # Hoc file assumes all the file are launched from a top directory
        head, tail  = os.path.split(hoc_path)
        print head, tail
        if head is not '':
            os.chdir(head)
        preface_pos = os.getcwd()
            
        h('strdef preface, dirstr') # preface and dirstr used in each hoc
        preface_string = "preface = \"" + preface_pos + "\""
        h(preface_string)
        h.load_file(os.path.join(tail, "all_tau_vecs.hoc"))
        
        
        self.__topology()
        for branch in self.branches:
            self.__geom(branch)       
        # TODO Set the 3D geometry properly
        #self.shape3d() # Disabled untill BUG fixed
        
        # Set the nseg correctly
        self.__geom_nseg() # This influence the voltage of the neruon
        self.__biophys()
        
    def __geom_nseg(self):
        """ Setting the number of segment according to the lambda rule"""
#        for sec in self.h.allsec():
#            scal_factor = 2 # Scale factor to have the same number of segments in Wolf
#            nseg = int(( sec.L / (0.1 * self.__lambda_f(100, sec)) + 0.9 ) / 2 ) * 2 + 1
#            sec.nseg = nseg
#            print sec.name(), nseg
        for branch in self.branches:
            for dist in branch.dist:
                dist.nseg = 11

    
    def __lambda_f(self, freq, sec):
        return 1e5 * sqrt (sec(0.5).diam / ( 4 * pi * freq * sec.Ra * sec(0.5).cm))

    def __topology(self):
        self.soma = h.Section()
        self.branches = []
        numProxDends = 4 # Proximal Dends
        for i in xrange(numProxDends):
            branch = Branch()
            branch.create(2,4)

            #self.createBranch(2, 4)
            # Connnecting in a symmetrical way
            if i < 2 :
                branch.prox.connect(self.soma, 0) 
            else:
                branch.prox.connect(self.soma, 1)
            self.branches.append(branch)
        

                
    def __geom(self, branch):
        """Wilson 1992 Single Neuron Computation
           dendritic diam(um) * (1+spine/dend ratio)
           also O'Donnell 1993 Synapse
           Koch/Segev Methods in Neuronal Modeling pg 122-3, 1998
           
           Changed the lenght obtainend adding the spines areas with the real lenght. 
           The other one should be obtained with adding the spines itself
           """
        # Soma
        self.__setGeoms(self.soma, 16, 16)
        # Prox
        self.__setGeoms(branch.prox, 20, 2.25) 
        # Mid
        for mid in branch.mid:
            self.__setGeoms(mid, 20, 1) # L = 24.23        diam = 1 * (1+0.3)
        # Dist
        for dist in branch.dist:
            self.__setGeoms(dist, 190, 0.72) #L = 395.2     diam = 0.5 * (1+2) 

    def __calcCoords(self, r, phi, theta):
        x = r * sin (radians(phi)) * cos (radians(theta))
        y = r * sin (radians(phi)) * sin (radians(theta))
        z = r * cos(radians(phi))
#        x = r * cos(theta)
#        y = r * sin(theta)
#        z = 0
        coords = (x,y,z)
        return x,y,z
    
    def __add3dpoint(self, sec, x_start, y_start, z_start, x,y,z):
        sec.push()
        #self.h.pt3dclear()
        self.h.pt3dadd(x_start,y_start, z_start, sec.L)
        self.h.pt3dadd(x,y,z, sec.L)
        self.h.pop_section()
        print "%s x0: %f y0: %f z0: %f x: %f y: %f z: %f" %(sec.name(), x_start, 
                                                            y_start, z_start, x, y, z)
    
    def __shape3d(self):
        
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
        
    def __sumCoords(self, old, new):
        if new < 0:
            coord = fabs(old) + fabs(new)
            coord = - coord
        else:
            coord = old + new
        return coord
            
    def __setGeoms(self, sec, lenght, diam):
        """Set the lenght of the section and the diam of all the segs"""
        sec.L = lenght
        for seg in sec:
            seg.diam = diam
    
    def __biophys(self):
        """Insert all the channels required and intialize the values"""
        # Global variable
        h.celsius = 35 # degC
        h.cai0_ca_ion = 0.001        # mM, Churchill 1998
        h.cao0_ca_ion = 5            # mM, Churchill 1998 - gives eca = 100 mV
        h.cali0_cal_ion = 0.001      # mM, Churchill 1998
        h.calo0_cal_ion = 5          # mM, Churchill 1998 - gives eca = 100 mV
        h.v_init = -87.75 # mV
        
        # Membrane mech present in all the section
        mechs = [
                 'pas', # done
                 'naf', # done
                 'nap', # done
                 'kir', # done
                 'kas', # done
                 'kaf', # done
                 'bkkca', # done
                 'skkca', # done
                 'caldyn', # pump calcium dynamics for L-type calcium channels (HVA & LVA)
                 'cadyn', # pump calcium dynamics for N, P/Q, R calcium
                 'caL',  #done
                 'caL13', #done
                 'can', # done
                 'caq', # done
                 'car', # done
                 'cat' # done
                 ]


        # Inserting the mechanism in all the section
        for sec in h.allsec():
            
            for mec in mechs:
                sec.insert(mec)
                
            # Value common for all the section
            
            sec(0.5).pas.g =  1.15e-5 # S/cm2
            sec(0.5).pas.e = -70 # mV
            sec(0.5).kir.gkbar = 0.00014 # S/cm2
            sec(0.5).bkkca.gkbar = 0.001 # S/cm2
            sec(0.5).skkca.gkbar = 0.145
            sec(0.5).can.pbar = 1.0e-5 # cm/s
            sec(0.5).caq.pcaqbar = 6.0e-6 # cm/s
            sec(0.5).car.pcarbar = 2.6e-5 # cm/s
            sec(0.5).cat.pcatbar = 4e-7 # m/s
            sec(0.5).caL.pbar = 6.7e-6 # cm/s
            sec(0.5).caL13.pcaLbar = 4.25e-7 # cm/s
            sec(0.5).ek = -90
            sec(0.5).ena = 50
            sec.Ra = 100 # ohm-cm 

        
        # Soma Only
        self.soma.insert('krp') # Inserting this only in the soma.
        self.soma(0.5).krp.gkbar = 0.001 # 0.004 # S/cm2
        
        self.soma(0.5).naf.gnabar = 1.5 # S/cm2
        self.soma(0.5).nap.gnabar = 4e-5 # S/cm2
        
        # Dends only
        allDends = []
        somaAndProx = [self.soma]
        midAndDist = []
        for branch in self.branches: 
           allDends.append(branch.prox) # Append because is a Section not a ListOF
           allDends.extend(branch.mid)
           allDends.extend(branch.dist)
        
           somaAndProx.append(branch.prox) # Append because is a Section not a ListOF
           midAndDist.extend(branch.mid)
           midAndDist.extend(branch.dist)
           
        for sec in allDends:
            sec(0.5).naf.gnabar = 0.0195
            sec(0.5).nap.gnabar = 1.3802e-7
            
        # Soma + Prox
        for sec in somaAndProx:
            sec(0.5).kas.gkbar = 0.0104 # S/cm2
            sec(0.5).kaf.gkbar = 0.225 # S/cm2
            
        # Mid + Dist
        for sec in midAndDist:
            sec(0.5).kas.gkbar = 0.00095142 # S/cm2
            sec(0.5).kaf.gkbar = 0.020584 # S/cm2

def iClampExp(section, delay=100, dur=500, amp=0.2375):
    """Creating an IClamp in the soma"""
    # Creating an ICLAMP just for testing
    
    iClamp = h.IClamp(0.5, sec = section)
    
    iClamp.delay = delay
    iClamp.dur = dur
    iClamp.amp = amp
    return iClamp

def go():
    h.run()
    pylab.plot(vecs['t'], vecs['v_soma'], label="soma v")    
    
if __name__ == "__main__":
    from neuron import h
    import neuron.gui
    import pylab
    msn = MediumSpinyNeuron()
    iclamp = iClampExp(msn.soma)
    h.dt = 0.005
    h.tstop = 800
    vecs = {}
    vecs['t'] = h.Vector()
    vecs['t'].record(h._ref_t)
    vecs['v_soma'] = h.Vector()
    vecs['v_soma'].record(msn.soma(0.5)._ref_v)
    print "Performing iClamp Experiment with:\n\
    amp: %f, dur:%f, delay:%f" %(iclamp.amp, iclamp.dur, iclamp.delay)
    print "Running until %f with fixed dt %f" %(h.tstop, h.dt)
    #go()
    pylab.show()
        
            
        
        