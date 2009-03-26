TITLE BK KCA channel for nucleus accumbens model

: large conductance kca channel

NEURON {
	SUFFIX bkkca
	USEION k READ ek WRITE ik
	USEION ca READ cai
	RANGE  gkbar,ik
}

UNITS {
	(molar) = (1/liter)
	(mM)	= (millimolar)
	(S)  	= (siemens)
	(mA) 	= (milliamp)
	(mV) 	= (millivolt)
}

PARAMETER {
    gkbar	= 0.001 (S/cm2)
	
	mvhalf = 2.6	(mV)		: Gong 2001 pg 727
	mslope = -17.0	(mV)		: Gong 2001 pg 727
	mshift = 0	(mV)
	
	hvhalf = -86.15	(mV)		: Ding & Lingle 2002 Fig 3B 10 uM Ca
	hslope = 11.61	(mV)		: Ding & Lingle 2002 Fig 3B 10 uM Ca
	hshift = 0	(mV)
	
	pvhalf = -7.4 	(mM)		: match to Gong 2001 Fig 3
	pslope = -0.65	(mM)		: match to Gong 2001 Fig 3
	pshift = 0		(mM)

	mtau = 0.133	(ms)		: Kang, Huguenard 1996
	htau = 1.27	(ms)		: Hicks & Marrion 1998 & Kang, Huguenard 1996

	mpower = 3
	ppower = 8					: match to Gong 2001 Fig 3
	hpower = 1
}

ASSIGNED {
    v       (mV)
    cai	(mM)
	ik	(mA/cm2)
	ek 	(mV)
	po	
	minf
	hinf
}

STATE { m h }

BREAKPOINT {
	SOLVE state METHOD cnexp
	ik = po^ppower * gkbar * m^mpower * h^hpower * (v - ek)
}

DERIVATIVE state {
	calc_po(cai)
	settables(v)
	m' = (minf - m) / mtau
	h' = (hinf - h) / htau
}

PROCEDURE settables( v (mV) ) {
	TABLE minf, hinf DEPEND mshift, hshift
        FROM -100 TO 100 WITH 201
		minf = 1  /  ( 1 + exp( (v-mvhalf-mshift) / mslope) )
		hinf = 1  /  ( 1 + exp( (v-hvhalf-hshift) / hslope) ) 
}

PROCEDURE calc_po( cai(mM) ) {
		po = 1  /  ( 1 + exp( (cai-pvhalf-pshift) / pslope) ) 
}




COMMENT
Gong LW, Gao TM, Huang H, Tong Z. Properties of large conductance
calcium-activated potassium channels in pyramidal neurons from the
hippocampal CA1 region of adult rats. Jap J Phys 51: 725-31, 2001.
ENDCOMMENT