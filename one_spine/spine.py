# Author: Michele Mattioni
# Mon Jan 26 05:54:30 GMT 2009

import math

from neuron import h, nrn

#import ecellControl as eC
from synapse import Synapse


class Spine():
    """
    Class spine. Create a spine with head neck and psd
    """
    
    def __init__(self, id, 
                 filename_bioch_mod="../biochemical_circuits/biomd183_noCalcium.eml"):
        """ Create a spine with a standard volume of ~0.11 um
        the h is the reference to the main hoc interpreter"""
        self.id = id
        self.head_vol = 0.11 #um
        self.neck = self.createNeck()
        self.head = self.createHead(self.neck, self.head_vol)
        self.psd = self.createPSD(self.head)
        self.parent = None # the parent section connected to the neck
        self.synapses = self.createSynapses()
        self.filename = filename_bioch_mod
        self.k_flux = []
        
        # Reset ions
        h.cai0_ca_ion = 0.001        #// mM, Churchill 1998
        h.cao0_ca_ion = 5            #// mM, Churchill 1998 - gives eca = 100 mV
        h.cali0_cal_ion = 0.001        #// mM, Churchill 1998
        h.calo0_cal_ion = 5            #// mM, Churchill 1998 - gives eca = 100 mVh.cao0_ca_ion =
        
    def setupBioSim(self):
        """Initialize the Biochemical Simulator creating the instance of 
        the object to control the simulation"""
        if not hasattr(self, 'ecellMan'):
            ecellMan = eC.EcellManager(self.filename)
            ecellMan.createLoggers()
            # Setting the head volume with the spine head
            ecellMan.ses.vol = self.head_vol * 1e-15 #Converted in l
            self.ecellMan = ecellMan
            print "Ecell initialized in spine: %s" %self.id
        
    
    def update_calcium(self, k_ca_flux):
        """Update the calcium using the electrical calcium from the NEURON 
        section to the ecell compartment
        
        The constant is in mM/ms. We need to convert to number/seconds
                
        params:
        the constant for the Constant Flux in ecell.
        """
        #print "Neuron calcium: %f, Ecell Calcium: %f" %(ca_concentration, 
        #                                               spine.ecellMan.ca['Value'])
        # converting the concentration in molecules:
        # um^3 to l (1e-15)
        CUBIC_um_TO_LITER = 1e-15
        # 6.022 * 1e23 Avogadro's number
        N_Av = 6.022 * 1e23
        # mM to M (1e-3) at the beginning for mM to M
        millimolar_to_number = 1e-3 * self.head_vol * CUBIC_um_TO_LITER * N_Av
        milliseconds = 1e-3
        factor = millimolar_to_number / milliseconds
        k_converted = k_ca_flux * factor
        print "k for the flux before unit convertion: %s and after: %s" %(k_ca_flux,
                                                                        k_converted)
        
        self.ecellMan.ca_in['k'] = k_converted
        self.k_flux.append(k_converted)
        # Disabling the leak and the pump
        self.ecellMan.ca_pump['vmax'] = 0
        self.ecellMan.ca_leak['vmax'] = 0
    
    def deploy_stims(self, neuron_time_interval_resolution):
        """Create the array with the inputs for all the synapses in this spine
        
        :param
            neuron_time_interval_resolution - Resolution of the vector to record 
            the synapse"""
        for synapse in self.synapses:
            inputs = []
            for stim in synapse.stims:
                print "Creating the stim for spine: %s syn type: %s" %(self.id, 
                                                                       synapse.chan_type)
                stim_inputs = stim.get_stims_time()
                #print "inputs: %s" % stim_inputs
                inputs.extend(stim_inputs)
            
            synapse.createStimul(inputs, neuron_time_interval_resolution)
        stim.spine = self.id
        
        
#    def setStimul(self, stim, neuron_time_interval):
#        '''Set the stimul applied to spine'''
#        for synapse in self.synapses:
#            synapse.createStimul(stim.get_stims_time(), neuron_time_interval)
#        stim.spine = self.id
            
    
    def createNeck(self):
        """ Create the neck with the Grunditz value"""
        name_sec = self.id + "_neck"
        h("create " + name_sec)
        neck = getattr(h, name_sec)

        neck.nseg = 3
        neck.L = 1.5 # um
        neck.diam = 0.1
        #neck.Ra = 150.0 # Used by Grunditz et al 2008 (see supplemental material)
        neck.Ra = 100.0 #
        
        #neck.insert("pas")
        neck.insert("kir")
        
        h.factors_catrack() # Called on the NMOD catrack
        neck.insert("catrack")
        
        h.factors_caltrack() # Called on the NMOD caltrack
        neck.insert("caltrack") 
                
        return neck
        
    def createHead(self, neck, head_vol):
        """Create the head of the spine and populate it with the right channels"""
        name_sec = self.id + "_head"
        h("create " + name_sec)
        head = getattr(h, name_sec)
        
        head.L = 1
        head.diam = math.sqrt(head_vol / head.L * math.pi ) * 2
        self.Ra = 150.0
        head.nseg = 7
        head.connect(neck)
        
        #head.insert("pas")
        head.insert("kir")
        head.insert("can")
        head.insert("caq")
        head.insert("car")
        head.insert("skkca")

        h.factors_caltrack()
        head.insert("caltrack")
        
        h.factors_catrack()
        head.insert("catrack")
        
        return head
    
    def createPSD(self, head):
        """Create the Post Synaptic Density of the spine to model the different \
        location of the different channel"""
        name_sec = self.id + "_psd"
        h("create " + name_sec)
        psd = getattr(h, name_sec)
        
        psd.L = 0.05        # um, Holmes & Levy 1990
        psd.diam = 0.5      # Wilson 1998 (Shepherd book)
        psd.Ra =100
        psd.connect(head)
        
        psd.insert("caL13")
        psd.insert("caL")
        psd.insert("rubin")
        
        h.factors_catrack()
        psd.insert("catrack")
        h.factors_caltrack()
        psd.insert("caltrack")
        
        return psd
        
    def createSynapses(self):
        "Create an AMPA and an NMDA synapse in the spine"
        synapses = []
        # AMPA Syn
        ampaSyn = Synapse('ampa', self.psd)
        synapses.append(ampaSyn)
        
        #NMDA Syn
        nmdaSyn = Synapse('nmda', self.psd)
        synapses.append(nmdaSyn)
        
        return synapses
    
    def attach(self, parentSec, parentx, childx):
        """Attach a spine to a parentSec and store the parentSec into an attribute.
        Just an handy variation of the connect method"""
        self.neck.connect(parentSec, parentx, childx)
        self.parent = parentSec
        self.pos = parentx
    
    def calc_surface_area(self):
        """Calculate the surface of the spine"""
        surface_neck_cyl = 2 * math.pi * (self.neck.diam/2) * (self.neck.diam/2 + self.neck.L)
        surface_head_cyl = 2 * math.pi * (self.head.diam/2) * (self.head.diam/2 + self.head.L)
        tot_surf = surface_head_cyl + surface_neck_cyl
        
        return tot_surf
