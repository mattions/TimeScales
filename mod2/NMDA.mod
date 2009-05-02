TITLE   NMDA synapse for nucleus accumbens model
: see comments below

NEURON {
	POINT_PROCESS NMDA
	RANGE gbar, ca_ratio, tau_r, tau_d, scale, spkcnt, countflag, mg, i, ical, t1, itmp, qfact
	NONSPECIFIC_CURRENT i
	USEION cal WRITE ical VALENCE 2
}

UNITS {
	(nA) = (nanoamp)
	(mV) = (millivolt)
	(umho) = (micromho)
	(mM) = (milli/liter)
}

PARAMETER {
	gbar = 12.2e-5 (umho): Dalby 2003 - one channel = 60 pS, 4-5 channels/synapse
						:   G=i/(Vm-Erev) = 300 pS with Erev = ~0mV
	tau_r = 5.63 (ms)   : Chapman DE 2003, Table 1 - rise tau
	tau_d = 320  (ms)   : Chapman DE 2003, Fig 2B Ventromedial - decay tau
	
	Erev  = 0    (mV)   : reversal potential, Dalby 2003
	saturation = 7.0 	: causes the conductance to saturate - matched to
						:   Mainen 1999 - 2nd spike 10 ms later is 1.8 * first
	qfact = 2			: convert to 35 degC - Gutfreund, Table 7.1
	mg = 1      (mM)    : external magnesium concentration
	ca_ratio = 0.1		: ratio of calcium current to total current
						: Burnashev/Sakmann J Phys 1995 485 403-418
}

ASSIGNED {
	g (umho)
	v (mV)   		: postsynaptic voltage
	itmp	(nA)	: temp value of current
	i (nA)   		: nonspecific current = g*(v - Erev)
	ical (nA)		: calcium current through NMDA synapse (Carter/Sabatini)
	t1	(ms)
	
	y1_add (/ms)    : value added to y1 when a presynaptic spike is registered
	y1_loc (/ms)

	spkcnt		: counts number of events delivered to synapse
	countflag	: start/stop counting

	B				: voltage dependendent magnesium blockade
	scale		: scale allows the current to be scaled by weight
}			: so NetCon(...,2) gives 2*the current as NetCon(...,1)


STATE { 
	y1 (/ms) 
	y2    			: sum of beta-functions, describing the total conductance
}

INITIAL {
	y1_add = 0
  
  	B = mgblock(v)
	scale = 1
	spkcnt = 0
	countflag = 0
	t1 = 0
	y1_loc = 0
}

BREAKPOINT {
	SOLVE betadyn METHOD cnexp
  	mgblock(v)
	g = gbar * y2
	itmp = scale * g * B * (v - Erev)	: split i into nonspecific and calcium parts
	i = (1-ca_ratio) * itmp
	ical = ca_ratio * itmp
}

DERIVATIVE betadyn {
  : dynamics of the beta-function, from [2]
	y1' = -y1 / (tau_d/qfact)
	y2' = y1 - y2 / (tau_r/qfact)
}

NET_RECEIVE( weight, y1_loc (/ms)) {
	: updating the local y1 variable
	y1_loc = y1_loc*exp( -(t - t1) / (tau_d/qfact) )

	: y1_add is dependent on the present value of the local
	: y1 variable, y1_loc
	y1_add = (1 - y1_loc/saturation)

	: update the local y1 variable
	y1_loc = y1_loc + y1_add

	: presynaptic spike is finaly registered
	y1 = y1 + y1_add

	: store the spike time
	t1 = t

	spkcnt = spkcnt + 1

	scale = weight
}


PROCEDURE mgblock( v(mV) ) {
	: from Jahr & Stevens

	TABLE B DEPEND mg
		FROM -100 TO 100 WITH 201

	B = 1 / (1 + exp(0.062 (/mV) * -v) * (mg / 3.57 (mM)))
}



COMMENT
Author Johan Hake (c) spring 2004
:     Summate input from many presynaptic sources and saturate 
:     each one of them during heavy presynaptic firing

: [1] Destexhe, A., Z. F. Mainen and T. J. Sejnowski (1998)
:     Kinetic models of synaptic transmission
:     In C. Koch and I. Segev (Eds.), Methods in Neuronal Modeling

: [2] Rotter, S. and M. Diesmann (1999) Biol. Cybern. 81, 381-402
:     Exact digital simulation of time-invariant linear systems with application 
:     to neural modeling

Mainen ZF, Malinow R, Svoboda K (1999) Nature. 399, 151-155.
Synaptic calcium transients in single spines indicate that NMDA
receptors are not saturated.

Chapman DE, Keefe KA, Wilcox KS (2003) J Neurophys. 89: 69-80.
Evidence for functionally distinct synaptic nmda receptors in ventromedial
vs. dorsolateral striatum.

Dalby, N. O., and Mody, I. (2003). Activation of NMDA receptors in rat
dentate gyrus granule cells by spontaneous and evoked transmitter
release. J Neurophysiol 90, 786-797.

Jahr CE, Stevens CF. (1990) Voltage dependence of NMDA activated
macroscopic conductances predicted by single channel kinetics. J
Neurosci 10: 3178, 1990.

Gutfreund H, Kinetics for the Life Sciences, Cambridge University Press, 1995, pg 234.
(suggested by Ted Carnevale)
ENDCOMMENT
