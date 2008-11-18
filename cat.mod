TITLE T-type calcium channel for nucleus accumbens neuron 
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
	SUFFIX cat
	USEION cal READ cali, calo WRITE ical VALENCE 2
	RANGE pcatbar, ical
}

PARAMETER {
	pcatbar = 7.6e-7(cm/s)		: vh = -100, step to -30 mV

	mvhalf = -51.73	(mV)		: McRory 2001, fig 7
	mslope = -6.53	(mV)		: McRory 2001, fig 7
	mshift = 0	(mV)
	
	hvhalf = -80	(mV)		: Churchill 1998, fig 3
	hslope = 6.7	(mV)		: Churchill 1998, fig 3
	hshift = 0	(mV)
	
	qfact = 3				: both m & h recorded at 22 C
}					

ASSIGNED { 
    v 		(mV)
    ical 	(mA/cm2)
    ecal		(mV)
    
    celsius	(degC)
    cali		(mM)
    calo		(mM)

    minf
    hinf
}

STATE {
    m h
}

BREAKPOINT {
    SOLVE states METHOD cnexp
    ical  = ghk(v,cali,calo) * pcatbar * m * m * m * h	: Wang 1991
}

INITIAL {
    settables(v)
    m = minf
    h = hinf
}

DERIVATIVE states {  
	settables(v)
	m' = (minf - m) / (mtau(v)/qfact)
	h' = (hinf - h) / (htau(v)/qfact)
}

FUNCTION_TABLE mtau(v(mV))	(ms)		: McRory 2001, Fig 6B
FUNCTION_TABLE htau(v(mV))	(ms)		: McRory 2001, Fig 6E

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

McRory JE, Santi CM, Hamming KS, Mezeyova J, Sutton KG, Baillie DL, Stea
A, Snutch TP (2001) Molecular and functional characterization of a
family of rat brain T-type calcium channels. J Biol Chem 276:3999-4011.

Wang XJ, Rinzel J, Rogawski MA (1991) A model of the T-type calcium
current and the low-threshold spike in thalamic neurons. J Neurophysiol
66:839-850.

Koch, C., and Segev, I., eds. (1998). Methods in Neuronal Modeling: From
Ions to Networks, 2 edn (Cambridge, MA, MIT Press).

Hille, B. (1992). Ionic Channels of Excitable Membranes, 2 edn
(Sunderland, MA, Sinauer Associates Inc.).



localization is not known (to me) - so gcatbar is calculated with cat in
both soma and dendrites

This is the low-threshold inactivating current in fig 3 from Churchill.

See McRory 2001 - I'm using alpha G values for minf.  For one, the
striatum seems to have all three types of subunits in equal amounts
according (Fig 3), and G seems to represent the average of all three.
Second, the inactivation inf values for G match Churchill's (fig. 3)
values most closely of all three.  For both taus i'm using the I subunit
b/c it seems to match churchill's data best (visually).

I tried fitting the tau(v) curve using Wang's method, and got impressive
results, but couldn't get matlab to reproduce the right curves.  Might
be worth investigating.

Make sure that cat_vec.hoc, taum_cat.txt, tauh_cat.txt, and vtau_cat.txt
are in the same directory.  cat_vec.hoc reads the three text files into
tables to hold the tau(v) values: taum_cat and tauh_cat have the mtau
and htau values at the respective voltages in vtau_cat.

eca should = 100 mV, based on Nernst Eq, [ca]i = 100uM, [ca]o = 5mM
be sure to set eca in the hoc file for every section



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

ENDCOMMENT

