TITLE R-type calcium channel for nucleus accumbens neuron 
: see comments at end of file

UNITS {
	(mV) = (millivolt)
	(mA) = (milliamp)
	(S) = (siemens)
	(molar) = (1/liter)
	(mM) = (millimolar)
	FARADAY = (faraday) (coulomb)
	R = (k-mole) (joule/degC)
}

NEURON {
	SUFFIX car
	USEION ca READ cai, cao WRITE ica
	RANGE pcarbar, ica
}

PARAMETER {
	pcarbar = 2.6e-5(cm/s)		: vh = 100 mV, 120 ms pulse to 0 mv

	mvhalf = -10.3	(mV)		: Churchill 1998, fig 7
	mslope = -6.6	(mV)		: Churchill 1998, fig 7
	mtau = 5.1	(ms)			: Foehring 2000, pg 2230
	mshift = 0	(mV)

	hvhalf = -33.3	(mV)		: Foehring 2000, fig 7C
	hslope = 17.0	(mV)		: Foehring 2000, fig 7
	hshift	= 0	(mV)		
	
	qfact = 3					: both m & h recorded at 22 C
}					

ASSIGNED { 
    v 		(mV)
    ica 	(mA/cm2)
    eca		(mV)
    
    celsius	(degC)
    cai		(mM)
    cao		(mM)

    minf
    hinf
}

STATE {
    m h
}

BREAKPOINT {
    SOLVE states METHOD cnexp
    ica  = ghk(v,cai,cao) * pcarbar * m * m * m * h	: Wang 1991
}				    : the current looks similar to t-type

INITIAL {
    settables(v)
	m = minf
	h = hinf
}

DERIVATIVE states {  
	settables(v)
	m' = (minf - m) / (mtau/qfact)
	h' = (hinf - h) / (htau(v)/qfact)
}

FUNCTION_TABLE htau(v(mV))	(ms)	: Brevi 2001 fig 11

PROCEDURE settables( v (mV) ) {
	TABLE minf, hinf DEPEND mshift, hshift
        FROM -100 TO 100 WITH 201

		minf = 1  /  ( 1 + exp( (v-mvhalf-mshift) / mslope) )
		hinf = 1  /  ( 1 + exp( (v-hvhalf-hshift) / hslope) ) 
}


::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

: ghk() borrowed from cachan.mod share file in Neuron
FUNCTION ghk(v(mV), ci(mM), co(mM)) (.001 coul/cm3) {
	LOCAL z, eci, eco
	z = (1e-3)*2*FARADAY*v/(R*(celsius+273.15))
	eco = co*efun(z)
	eci = ci*efun(-z)
	:high cao charge moves inward
	:negative potential charge moves inward
	ghk = (.001)*2*FARADAY*(eci - eco)
}

FUNCTION efun(z) {
	if (fabs(z) < 1e-4) {
		efun = 1 - z/2
	}else{
		efun = z/(exp(z) - 1)
	}
}


COMMENT
Churchill D, Macvicar BA (1998) Biophysical and pharmacological
characterization of voltage-dependent Ca2+ channels in neurons isolated
from rat nucleus accumbens. J Neurophysiol 79:635-647.

Foehring RC, Mermelstein PG, Song WJ, Ulrich S, Surmeier DJ (2000)
Unique properties of R-type calcium currents in neocortical and
neostriatal neurons. J Neurophysiol 84:2225-2236.

Wang XJ, Rinzel J, Rogawski MA (1991) A model of the T-type calcium
current and the low-threshold spike in thalamic neurons. J Neurophysiol
66:839-850.

Koch, C., and Segev, I., eds. (1998). Methods in Neuronal Modeling: From
Ions to Networks, 2 edn (Cambridge, MA, MIT Press).

Hille, B. (1992). Ionic Channels of Excitable Membranes, 2 edn
(Sunderland, MA, Sinauer Associates Inc.).

Brevi S, de Curtis M, Magistretti J (2001) Pharmacologial and biophysical
characterization of voltage-gated calcium currents in the endopiriform
nucleus of the guinea pig. J Neuophysiol 85:2076-2087.



This is the toxin-resistant current in fig 7 from Churchill.



The standard HH model uses a linear approximation to the driving force
for an ion: (Vm - ez).  This is ok for na and k, but not ca - calcium
rectifies at high potentials because 
	1. internal and external concentrations of ca are so different,
	making outward current flow much more difficult than inward 
	2. calcium is divalent so rectification is more sudden than for na
	and k. (Hille 1992, pg 107)

Accordingly, we need to replace the HH formulation with the GHK model,
which accounts for this phenomenon.  The GHK equation is eq 6.6 in Koch
1998, pg 217 - it expresses Ica in terms of Ca channel permeability
(Perm,ca) times a mess. The mess can be circumvented using the ghk
function below, which is included in the Neuron share files.  Perm,ca
can be expressed in an HH-like fashion as 
	Perm,ca = pcabar * mca * mca 	(or however many m's and h's)
where pcabar has dimensions of permeability but can be thought of as max
conductance (Koch says it should be about 10^7 times smaller than the HH
gbar - dont know) and mca is analagous to m (check out Koch 1998 pg 144)

Calcium current can then be modeled as 
	ica = pcabar * mca * mca * ghk()
	
	
Jason Moyer 2004 - jtmoyer@seas.upenn.edu

ENDCOMMENT


