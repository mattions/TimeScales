TITLE LVA L-type (1.3) calcium channel for nucleus accumbens neuron w/ inact
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
	SUFFIX caL13
	USEION cal READ cali, calo WRITE ical VALENCE 2
	RANGE pcaLbar, ical, mshift, hshift, qfact, hqfact
}

PARAMETER {
	pcaLbar = 1.7e-6    (cm/s)	: hold at vh = -100 mv, step to -30 mv

	mvhalf = -33	(mV)		: match to Xu 2001 Figure 1D with mslope from churchill
	mslope = -6.7	(mV)		: Churchill 1998, fig 5
	mshift = 0	(mV)

	vm = -8.124  	(mV)		: Kasai 1992, fig 15
	k = 9.005   	(mV)		: Kasai 1992, fig 15
	kpr = 31.4   	(mV)		: Kasai 1992, fig 15
	c = 0.0398   	(/ms-mV)	: Kasai 1992, fig 15
	cpr = 0.99		(/ms)		: Kasai 1992, fig 15

	hvhalf = -13.4	(mV)		: Bell 2001, fig 2
	hslope = 11.9	(mV)		: Bell 2001, fig 2
	hshift = 0	(mV)

	htau = 44.3	(ms)			: Bell 2001, pg 819
	
	qfact = 3					: both m & h recorded at 22 C
	hqfact = 3
}

ASSIGNED { 
    v 		(mV)
    ical 	(mA/cm2)
    ecal 	(mV)

    celsius	(degC)
    cali		(mM)
    calo		(mM)
    
    minf
    mtau 	(ms)

    hinf
}

STATE {
    m h
}

BREAKPOINT {
    SOLVE states METHOD cnexp
    ical  = ghk(v,cali,calo) * pcaLbar * m * m * h	  : Kasai 92, Brown 93
}

INITIAL {
    settables(v)
    m = minf
    h = hinf
}
DERIVATIVE states {  
	settables(v)
	m' = (minf - m) / (mtau/qfact)
	h' = (hinf - h) / (htau/hqfact)
}


PROCEDURE settables( v (mV) ) {
	LOCAL malpha, mbeta
	
	TABLE minf, mtau, hinf DEPEND mshift, hshift
		FROM -100 TO 100 WITH 201
	
		minf = 1  /  ( 1 + exp( (v-mvhalf-mshift) / mslope) )
		hinf = 1  /  ( 1 + exp( (v-hvhalf-hshift) / hslope) )
			: to match hinf data from Bell 2001, fig 2

		malpha = c * (v-vm) / ( exp((v-vm)/k) - 1 )
		mbeta = cpr * exp(v/kpr)		: Kasai 1992, fig 15
		mtau = 1 / (malpha + mbeta)
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
Brown AM, Schwindt PC, Crill WE (1993) Voltage dependence and activation
kinetics of pharmacologically defined components of the high-threshold
calcium current in rat neocortical neurons. J Neurophysiol 70:1530-1543.

Churchill D, Macvicar BA (1998) Biophysical and pharmacological
characterization of voltage-dependent Ca2+ channels in neurons isolated
from rat nucleus accumbens. J Neurophysiol 79:635-647.

Kasai H, Neher E (1992) Dihydropyridine-sensitive and
omega-conotoxin-sensitive calcium channels in a mammalian
neuroblastoma-glioma cell line. J Physiol 448:161-188.

Koch, C., and Segev, I., eds. (1998). Methods in Neuronal Modeling: From
Ions to Networks, 2 edn (Cambridge, MA, MIT Press).

Hille, B. (1992). Ionic Channels of Excitable Membranes, 2 edn
(Sunderland, MA, Sinauer Associates Inc.).

Bell, DC et al. (2001) Biophysical properties, pharmacology, and 
modulation of human, neuronal L-type (alpha(1D), Ca(V)1.3) voltage-
dependent calcium currents.  J Neurophys 85: 816-827, 2001.

Xu W, Lipscombe D (2001) Neuronal cav1.3 L-type channels activate at relatively 
hyperpolarized membrane potentials and are incompletely inhibited by 
dihydropyridines. J Neurosci 21(16): 5944-5951.


2 uM - 10 uM dihydropyridines will get 1.2 and 1.3's


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

