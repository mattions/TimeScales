TITLE Q-type (not P) calcium channel for nucleus accumbens neuron 
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
	SUFFIX caq
	USEION ca READ cai, cao WRITE ica
	RANGE pcaqbar, ica
}

PARAMETER {
	pcaqbar = 6.0e-6(cm/s)		: vh = -100 mV, 120 ms pulse to 0 mV

	mvhalf = -9.0	(mV)		: Churchill 1998, fig 5
	mslope = -6.6	(mV)		: Churchill 1998, fig 5
	mtau = 1.13	(ms)			: Randall 1995, fig 13
	mshift = 0	(mV)
	
	qfact = 3					: m recorded at 22 C
}

ASSIGNED { 
    v 		(mV)
    eca		(mV)
    ica 	(mA/cm2)
    minf

    celsius	(degC)
    cai		(mM)
    cao		(mM)
}

STATE {
    m
}

BREAKPOINT {
    SOLVE states METHOD cnexp
    ica  = ghk(v,cai,cao) * pcaqbar * m * m    : Kasai 92, Brown 93
}						

INITIAL {
    settables(v)
    m = minf
}

DERIVATIVE states {  
    settables(v)
    m' = (minf - m) / (mtau/qfact)
}

PROCEDURE settables( v (mV) ) {
	TABLE minf DEPEND mshift
        FROM -100 TO 100 WITH 201

		minf = 1  /  ( 1 + exp( (v-mvhalf-mshift) / mslope) )
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

Mermelstein PG, Foehring RC, Tkatch T, Song WJ, Baranauskas G, Surmeier
DJ (1999) Properties of Q-type calcium channels in neostriatal and
cortical neurons are correlated with beta subunit expression. J Neurosci
19:7268-7277.

Randall A, Tsien RW (1995) Pharmacological dissection of multiple types
of Ca2+ channel currents in rat cerebellar granule neurons. J Neurosci
15:2995-3012.

Koch, C., and Segev, I., eds. (1998). Methods in Neuronal Modeling: From
Ions to Networks, 2 edn (Cambridge, MA, MIT Press).

Hille, B. (1992). Ionic Channels of Excitable Membranes, 2 edn
(Sunderland, MA, Sinauer Associates Inc.).



This is the w-agatoxin IVA (low conc (~20 nM) blocks P, high conc (~200 nM)
blocks Q & P) sensitive current in fig 5 from Churchill - no P current.

This current does not inactivate.  Mermelstein 99 - very slow
inactivation (2 s). Churchill 98 - small-to-no inactivating component -
so ignore inactivation.



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

