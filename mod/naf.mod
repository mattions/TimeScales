TITLE Nahc - Fast sodium current for nucleus accumbens (from hippocampal pyramidal cell)

COMMENT
Martina M, Jonas P (1997). "Functional differences in na+ channel gating between fast-
spiking interneurons and principal neurons of rat hippocampus." J Phys, 505(3): 593-603.

recorded at 22C - Q10 of 3 to convert to 35C

Jason Moyer 2004 - jtmoyer@seas.upenn.edu

ENDCOMMENT

UNITS {
        (mA) = (milliamp)
        (mV) = (millivolt)
        (S)  = (siemens)
}
 
NEURON {
        SUFFIX naf
        USEION na READ ena WRITE ina
        RANGE  gnabar, ina, mshift, hshift
}
 
PARAMETER {
    gnabar   =   1.5 	(S/cm2)	: 1.5 in soma, 0.0195 in all dends

	mvhalf = -23.9		(mV)	: Martina/Jonas 1997 Table 1 (Pyr. cells)
	mslope = -11.8		(mV)	: Martina/Jonas 1997 Table 1 (Pyr. cells)
	mshift = 0		(mV)	: 

	hvhalf = -62.9		(mV)	: Martina/Jonas 1997 Table 1 (Pyr. cells)
	hslope = 10.7		(mV)	: Martina/Jonas 1997 Table 1 (Pyr. cells)
	hshift = 0		(mV)	: 

	mqfact = 3
	hqfact = 3	
}
 
STATE { m h }
 
ASSIGNED {
		ena				(mV)
        v 				(mV)
        ina 				(mA/cm2)
        gna				(S/cm2)
        minf 
	hinf
}
 
BREAKPOINT {
        SOLVE state METHOD cnexp
        gna = gnabar * m * m * m  * h
        ina = gna * ( v - ena )
}
 
 
INITIAL {
	rates(v)
	
	m = minf
	h = hinf
}

FUNCTION_TABLE taumnaf (v(mV))  (ms)	: Martina/Jonas 1997 Fig 2E
FUNCTION_TABLE tauhnaf (v(mV))  (ms)	: Martina/Jonas 1997 Fig 4C

DERIVATIVE state { 
        rates(v)
        m' = (minf - m) / (taumnaf(v)/mqfact)
        h' = (hinf - h) / (tauhnaf(v)/hqfact)
}
 
PROCEDURE rates(v (mV)) {  
	TABLE minf, hinf DEPEND mshift, hshift, mslope, hslope
		FROM -200 TO 200 WITH 201
			minf = 1 / (1 + exp( (v-mvhalf-mshift) / mslope ) ) 
		    hinf = 1 / (1 + exp( (v-hvhalf-hshift) / hslope ) )
}
 
 
