TITLE Kir potassium current for nucleus accumbens (IRK1 = Kir 2.1 - see Mermelstein)

COMMENT 

Mermelstein PG, Song WJ, Tkatch T, Yan Z, Surmeier DJ (1998) Inwardly
rectifying potassium (IRK) currents are correlated with IRK subunit
expression in rat nucleus accumbens medium spiny neurons. J Neurosci
18:6650-6661.

Uchimura N, Cherubini E, North RA (1989).  Inward rectification
in rat nucleus accumbens neurons. J Neurophysiol 62, 1280-1286.

Kubo Y, Murata Y (2001).  Control of rectification and permeation by two
distinct sites after the second transmembrane region in Kir2.1 K+
channel. J Physiol 531, 645-660.

Hayashi H, Fishman HM (1988). Inward rectifier K+ channel kinetics from
analysis of the complex conductance of aplysia neuronal membrane.
Biophys J 53, 747-757. 

Jason Moyer 2004 jtmoyer@seas.upenn.edu
ENDCOMMENT


UNITS {
        (mA) = (milliamp)
        (mV) = (millivolt)
        (S)  = (siemens)
        (molar) = (1/liter)
        (mM) = (millimolar)
}
 
NEURON {
        SUFFIX kir
        USEION k READ ek WRITE ik
        RANGE  gkbar, ik, mvhalf, mslope, mshift, qfact
}
 
PARAMETER {
	gkbar  = 0.00015 		(S/cm2)	: 

	mvhalf = -52		(mV)	: fit to Hayashi 1988 fig 14; minf = alpha/(alpha+beta)
	mslope = 13		(mV)	: fit to Hayashi 1988 fig 14
	mshift = 30			(mV)	: fit to Kubo 2001 fig 2B left - with ek = -84.3,
						:  mshift can range from 20 to 30 to fit slope of IR
	qfact = 0.5				: match in vitro data
}
 
STATE { m }
 
ASSIGNED {
		ki				(mM)
		ko				(mM)
        v 				(mV)
        ik 				(mA/cm2)
        gk				(S/cm2)
        minf		
        ek				(mV)
   }
 
BREAKPOINT {
        SOLVE state METHOD cnexp
        gk = gkbar * m
        ik = gk * ( v - ek )
}
  
INITIAL {
	rates(v)
	m = minf
}

FUNCTION_TABLE taumkir (v(mV))  (ms)		: Hayashi

DERIVATIVE state { 
        rates(v)
        m' = (minf - m) / ( taumkir(v)/qfact )
}
 
PROCEDURE rates( v(mV) ) {  : Boltzman adjusted to give proper Erev dependency 
	TABLE minf DEPEND mvhalf, mshift, mslope
		FROM -200 TO 200 WITH 201
			minf = 1  /  ( 1 + exp( (v - mvhalf + mshift) / mslope) )
}
 
 
