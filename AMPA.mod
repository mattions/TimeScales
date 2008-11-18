TITLE    AMPA synapse for nucleus accumbens model
: see comments below

NEURON {
	POINT_PROCESS AMPA
	RANGE gbar, tau_r, tau_d, scale, spkcnt, countflag, i, t1, ca_ratio, ical, itmp, qfact
	NONSPECIFIC_CURRENT i
 	USEION cal WRITE ical VALENCE 2

}

UNITS {
	(nA) = (nanoamp)
	(mV) = (millivolt)
	(umho) = (micromho)
}

PARAMETER {
	gbar = 8.5e-4   (umho) 	: approx 0.5:1 NMDA:AMPA ratio (Myme 2003)
							:   with mg = 0, vh = -70, one pulse, NMDA = 300 pS
							:   here AMPA = 593 pS (NMDA set to Dalby 2003)
	tau_r = 2.2 	(ms)   	: Gotz 1997, Table 1 - rise tau
	tau_d = 11.5  	(ms)   	: Gotz 1997, Table 1 - decay tau
	
	Erev = 0    	(mV)   	: reversal potential, Jahn 1998
	saturate = 1.2 			: causes the conductance to saturate - matched to 
							:    Destexhe's reduced model in [1]
	qfact = 2				: convert 22 degC to 35 degC
	ca_ratio = 0.005			: ratio of calcium current to total current
}							: Burnashev/Sakmann J Phys 1995 485:403-418
							: with Carter/Sabatini Neuron 2004 44:483-493


ASSIGNED {
	g (umho)
	v (mV)   		: postsynaptic voltage
	itmp	(nA)	: temp value of current
	i (nA)   		: nonspecific current = g*(v - Erev)
	ical (nA)		: calcium current through AMPA synapse (Carter/Sabatini)
	t1 (ms)
	
	y1_add (/ms)    : value added to y1 when a presynaptic spike is registered
	y1_loc (/ms)

	countflag		: start/stop counting spikes delivered
	spkcnt			: counts number of events delivered to synapse
	scale			: scale allows the current to be scaled by weight
}					: so NetCon(...,2) gives 2*the current as NetCon(...,1)


STATE { 
	y1 (/ms) 
	y2    			: sum of beta-functions, describing the total conductance
}

INITIAL {
  	y1_add = 0
	scale = 0
	spkcnt = 0
	countflag = 0
	t1 = 0
	y1_loc = 0
}

BREAKPOINT {
  	SOLVE betadyn METHOD cnexp
	g = gbar * y2
  	itmp = scale * g * (v - Erev)
  	i = (1-ca_ratio) * itmp
  	ical = ca_ratio * itmp
}

DERIVATIVE betadyn {
	: dynamics of the beta-function, from [2]
	y1' = -y1 / (tau_d/qfact)
	y2' = y1 - y2 / (tau_r/qfact)
}

NET_RECEIVE( weight, y1_loc (/ms) ) {
	: updating the local y1 variable
	y1_loc = y1_loc*exp( -(t - t1) / (tau_d/qfact) )

	: y1_add is dependent on the present value of the local
	: y1 variable, y1_loc
	y1_add = (1 - y1_loc/saturate)

	: update the local y1 variable
	y1_loc = y1_loc + y1_add

	: presynaptic spike is finaly registered
	y1 = y1 + y1_add

	: store the spike time
	t1 = t

	spkcnt = spkcnt + 1

	scale = weight
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



Dalby, N. O., and Mody, I. (2003). Activation of NMDA receptors in rat
dentate gyrus granule cells by spontaneous and evoked transmitter
release. J Neurophysiol 90, 786-797.

Gotz, T., Kraushaar, U., Geiger, J., Lubke, J., Berger, T., and Jonas,
P. (1997). Functional properties of AMPA and NMDA receptors expressed in
identified types of basal ganglia neurons. J Neurosci 17, 204-215.

Jahn K, Bufler J, Franke C (1998) Kinetics of AMPA-type glutamate
receptor channels in rat caudate-putamen neurones show a wide range of
desensitization but distinct recovery characteristics. Eur J Neurosci
10:664-672.

Myme, C. I., Sugino, K., Turrigiano, G. G., and Nelson, S. B. (2003).
The NMDA-to-AMPA ratio at synapses onto layer 2/3 pyramidal neurons is
conserved across prefrontal and visual cortices. J Neurophysiol 90,
771-779.

Gutfreund H, Kinetics for the Life Sciences, Cambridge University Press,
1995, pg 234.  (suggested by Ted Carnevale)
ENDCOMMENT

