TITLE Fast A-type Potassium current for nucleus accumbens (Kv4.2)

COMMENT
Jason Moyer 2004 - jtmoyer@seas.upenn.edu

Tkatch, T., Baranauskas, G., and Surmeier, D. J. (2000). Kv4.2 mRNA
abundance and A-type K(+) current amplitude are linearly related in
basal ganglia and basal forebrain neurons. J Neurosci 20, 579-588.

22 degrees

ENDCOMMENT

UNITS {
	(mV) = (millivolt)
	(mA) = (milliamp)
	(S) = (siemens)
}

NEURON {
	SUFFIX kaf
	USEION k READ ek WRITE ik
	RANGE gkbar, ik, mshift, hshift
}

PARAMETER {
	gkbar = 0.21	(S/cm2)		: 0.21 in soma and prox; 0.019211 in mid/dist dends

	mvhalf = -10.0	(mV)		: Tkatch 2000 pg 581
	mslope = -17.7	(mV)		: Tkatch 2000 pg 581 - need to use -17.7, not 17.7
	mshift = 0	(mV)
	
	hvhalf = -75.6	(mV)		: Tkatch 2000 pg 582
	hslope	= 10	(mV)		: match to Tkatch 2000 fig 3B
	hshift = 0	(mV)
	htau = 14	(ms)			: Tkatch 2000 Fig 3C

	qfact = 3
	power = 2
}

ASSIGNED { 
	v 		(mV)
    ik 		(mA/cm2)
	ek 		(mV)

	minf
	hinf
}

STATE {
    m h
}

BREAKPOINT {
    SOLVE states METHOD cnexp
	ik  = gkbar * m^power * h * (v-ek)
}

INITIAL {
	rates(v)
	m = minf
	h = hinf
}

FUNCTION_TABLE mtau (v(mV))  (ms)	: Tkatch 2000 Fig 2B

DERIVATIVE states {  
	rates(v)
	m' = (minf - m) / (mtau(v) / qfact)
	h' = (hinf - h) / (htau / qfact)
}


PROCEDURE rates( v(mV) ) {  : Boltzman adjusted to give proper Erev dependency 
	TABLE minf, hinf DEPEND mshift, hshift, hslope
		FROM -200 TO 200 WITH 201
			minf = 1  /  ( 1 + exp( (v - mvhalf - mshift) / mslope) ) 
			hinf = 1  /  ( 1 + exp( (v - hvhalf - hshift) / hslope) ) 
}


