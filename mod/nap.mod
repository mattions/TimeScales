TITLE NaP - persistent sodium current for nucleus accumbens 

COMMENT
Magistretti J, Alonso A (1999). "Biophysical properties and slow
voltage-dependent inactivation of a sustained sodium current in entorhinal
cortex layer-II principal neurons." J Gen Phys, 114: 491-509.

Traub RD, Buhl EH et al (2003). "Fast rhythmic bursting can be induced in
layer 2/3 cortical neurons by enhancing persistent na+ conductance or by
blocking BK channels." J Neurophys 89: 909-921.

Jason Moyer 2004 - jtmoyer@seas.upenn.edu
ENDCOMMENT

UNITS {
        (mA) = (milliamp)
        (mV) = (millivolt)
        (S)  = (siemens)
}
 
NEURON {
        SUFFIX nap
        USEION na READ ena WRITE ina
        RANGE  gnabar, ina
}
 
PARAMETER {
	gnabar   =   4e-5 (S/cm2)	: 4e-5 in soma; 1.3802e-7 in dends

	mvhalf = -52.6		(mV)	: Magistretti 1999, Fig 4
	mslope = -4.6		(mV)	: Magistretti 1999, Fig 4

	hvhalf = -48.8		(mV)	: Magistretti 1999, Fig 4
	hslope = 10.0		(mV)	: Magistretti 1999, Fig 4

	qfact = 3
}
 
STATE { m h }
 
ASSIGNED {
	ena		(mV)
        v 		(mV)
        ina		(mA/cm2)
        gna		(S/cm2)

        minf
	hinf	

	mtau	(ms)			: Traub 2003, Table A2
   }
 
BREAKPOINT {
        SOLVE state METHOD cnexp
        gna = gnabar * m * h  
        ina = gna * ( v - ena )
:        VERBATIM
:        	printf("Ena is %g\n", ena);
:        ENDVERBATIM
}
 

 
INITIAL {
	rates(v)
	
	m = minf
	h = hinf
}

FUNCTION_TABLE tauhnap (v(mV))  (ms)		: Magistretti 1999, Fig 8A

DERIVATIVE state { 
        rates(v)
        m' = (minf - m) / mtau
        h' = (hinf - h) / (tauhnap(v)/qfact)    
}
 
PROCEDURE rates(v (mV)) {  
	TABLE minf, hinf, mtau
		FROM -200 TO 200 WITH 201

		minf = 1 / (1 + exp( (v - mvhalf) / mslope))
		hinf = 1 / (1 + exp( (v - hvhalf) / hslope))
		
		UNITSOFF
		if (v < -40) {			: Traub 2003, Table A2
			mtau = 0.025 + 0.14 * exp( (v + 40 ) / 10)
		} else {
			mtau = 0.02 + 0.145 * exp( (-v - 40) / 10)
		}
		UNITSON
}
 
 
