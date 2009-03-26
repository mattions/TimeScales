TITLE Kdr - Kv1.3

COMMENT

Erisir A 1999 J Neurophys

Recorded at 22C - corrected to 35C with qfact 3

Jason Moyer 2006 - jtmoyer@seas.upenn.edu

ENDCOMMENT

UNITS {
	(mA) = (milliamp)
	(mV) = (millivolt)
	(S)  = (siemens)
}
 
NEURON {
	SUFFIX kdr
	USEION k READ ek WRITE ik
	RANGE  gkbar, ik
}
 
PARAMETER {
	gkbar = 0.0015 (S/cm2)
 	qfact = 3.0
 	
 	vshift = 0 (mV)
}
 
STATE { m }
 
ASSIGNED {
	ek				(mV)
    v 				(mV)
    ik 				(mA/cm2)
    minf 
    mtau		(ms)
    
:    mvhalf = -50
:    mslop = -2.9
    
    alpha
    beta
}
 
BREAKPOINT {
    SOLVE state METHOD cnexp
    ik = gkbar * m^4 * ( v - ek )
}
 

 
INITIAL {
	rates(v)
	m = minf
}

DERIVATIVE state { 
    rates(v)
    m' = (minf - m) / (mtau/qfact)
}
 
PROCEDURE rates(v (mV)) { 
	TABLE mtau, minf DEPEND vshift
		FROM -200 TO 200 WITH 201
		
		alpha = -(0.616 + 0.014 * (v+vshift) ) / (exp( ( 44+ (v+vshift) )/-2.3 ) - 1)
		beta = 0.0043 / exp( ( 44 + (v+vshift) )/34 )
	
		mtau = 1 / (alpha + beta)
		minf = alpha /  (alpha + beta) 
}
 
 
