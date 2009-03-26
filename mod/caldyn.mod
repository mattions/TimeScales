TITLE Submembrane calcium dynamics for L-type calcium channels (HVA & LVA)

INDEPENDENT {t FROM 0 TO 1 WITH 1 (ms)}

NEURON {
	SUFFIX caldyn
	USEION cal READ ical, cali WRITE cali VALENCE 2
	RANGE pump, cainf, taur, drive
}

UNITS {
	(molar) = (1/liter)			: moles do not appear in units
	(mM)	= (millimolar)
	(um)	= (micron)
	(mA)	= (milliamp)
	(msM)	= (ms mM)
}

CONSTANT {
	FARADAY = 96489		(coul)		: moles do not appear in units
}

PARAMETER {
    drive   = 10000  (1)
	depth	= 0.1	(um)		: depth of shell
	cainf	= 1e-5	(mM)		: gives eca = 108 mV
	taur	= 43	(ms)		: 
	kt	= 1e-4	(mM/ms)			: left over from Destexhe
	kd	= 1e-4	(mM)
	
	pump = 0.02					: turn pump up/down
}

STATE {
	cali		(mM) 
}

INITIAL {
	cali = cainf
}

ASSIGNED {
	ical		(mA/cm2)
	drive_channel	(mM/ms)
	drive_pump	(mM/ms)
}
	
BREAKPOINT {
	SOLVE state METHOD derivimplicit
}

DERIVATIVE state { 
	drive_channel =  - drive * ical / (2 * FARADAY * depth)
	    : this part converts the incoming calcium (from channels) into
	    : a corresponding change in internal concentration

	if (drive_channel <= 0.) { drive_channel = 0. }	: cannot pump inward

	drive_pump = -kt * cali / (cali + kd )		: Michaelis-Menten
	    : this accounts for calcium being pumped back out - M-M
	    : represents mechanism that is rate-limited by low ion conc.
	    : at one end and max pumping rate and high end
	
		cali' = ( drive_channel + pump*drive_pump + (cainf-cali)/taur )
	    : (cainf-cali)/taur represents exponential decay towards cainf
	    : at a time constant of taur from diffusive processe
}



COMMENT
Internal calcium concentration due to calcium currents and pump.

Differential equations.

 This file contains two mechanisms:
 1. Simple model of ATPase pump with 3 kinetic constants (Destexhe 1992)
       Cai + P <-> CaP -> Cao + P  (k1,k2,k3)

   A Michaelis-Menten approximation is assumed, which reduces the complexity
   of the system to 2 parameters: 
       kt = <tot enzyme concentration> * k3  -> TIME CONSTANT OF THE PUMP
	kd = k2/k1 (dissociation constant)    -> EQUILIBRIUM CALCIUM VALUE
   The values of these parameters are chosen assuming a high affinity of 
   the pump to calcium and a low transport capacity (cfr. Blaustein, 
   TINS, 11: 438, 1988, and references therein).  

   For further information about this this mechanism, see Destexhe, A. 
   Babloyantz, A. and Sejnowski, TJ.  Ionic mechanisms for intrinsic slow 
   oscillations in thalamic relay neurons. Biophys. J. 65: 1538-1552, 1993.


 2. Simple first-order decay or buffering:

       Cai + B <-> ...

   which can be written as:

       dCai/dt = (cainf - Cai) / taur

   where cainf is the equilibrium intracellular calcium value (usually
   in the range of 200-300 nM) and taur is the time constant of calcium 
   removal.

All variables are range variables

Written by Alain Destexhe, Salk Institute, Nov 12, 1992



Citations:
 
Destexhe, A. Babloyantz, A. and Sejnowski, TJ.  Ionic mechanisms for
intrinsic slow oscillations in thalamic relay neurons. Biophys. J. 65:
1538-1552, 1993.

Jackson MB, Redman SJ (2003) Calcium dynamics, buffering, and buffer
saturation in the boutons of dentate granule-cell axons in the hilus. J
Neurosci 23:1612-1621.

ENDCOMMENT
