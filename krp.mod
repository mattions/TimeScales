TITLE Krp (4ap resistant, persistent) current for nucleus accumbens

COMMENT

Nisenbaum ES, Wilson CJ, Foehring RC, Surmeier DJ (1996). Isolation and
characterization of a persistent potassium current in neostriatal neurons. J
Neurophys 76(2): 1180-1194.

Recorded at 22C - corrected to 35C with qfact 3

Jason Moyer 2004 - jtmoyer@seas.upenn.edu

ENDCOMMENT

UNITS {
        (mA) = (milliamp)
        (mV) = (millivolt)
        (S)  = (siemens)
}
 
NEURON {
        SUFFIX krp
        USEION k READ ek WRITE ik
        RANGE  gkbar, ik
}
 
PARAMETER {
	gkbar   =   0.002 (S/cm2)

	mvhalf = -13.5		(mV)	: Nisenbaum 1996, Fig 6C
	mslope = -11.8		(mV)	: Nisenbaum 1996, Fig 6C
	mshift = 0		(mV)

	hvhalf = -54.7		(mV)	: Nisenbaum 1996, Fig 9D
	hslope = 18.6		(mV)	: Nisenbaum 1996, Fig 9D
 	hshift = 0		(mV)

 	a = 0.7				: matched to Nisenbaum 1996, figure 9A (with qfact = 1)
 	qfact = 3.0
}
 
STATE { m h }
 
ASSIGNED {
	ek				(mV)
        v 				(mV)
        ik 				(mA/cm2)
        gk				(S/cm2)
        minf 
	hinf
    }
 
BREAKPOINT {
        SOLVE state METHOD cnexp
        gk = gkbar * m * (a*h + (1-a)) 
        ik = gk * ( v - ek )
}
 

 
INITIAL {
	rates(v)
	
	m = minf
	h = hinf
}

FUNCTION_TABLE taumkrp (v(mV))  (ms)
FUNCTION_TABLE tauhkrp (v(mV))  (ms)

DERIVATIVE state { 
        rates(v)
        m' = (minf - m) / (taumkrp(v)/qfact)
        h' = (hinf - h) / (tauhkrp(v)/qfact)
}
 
PROCEDURE rates(v (mV)) {  
	TABLE minf, hinf DEPEND mshift, hshift
		FROM -200 TO 200 WITH 201
			minf = 1 / (1 + exp( (v - mvhalf - mshift) / mslope ))
			hinf = 1 / (1 + exp( (v - hvhalf - hshift) / hslope ))
}
 
 
