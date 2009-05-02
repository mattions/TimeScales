TITLE    GABA synapse for nucleus accumbens model
: see comments below

NEURON {
  POINT_PROCESS GABA
  RANGE gbar, tau_r, tau_d, scale, spkcnt, countflag, i, t1, Erev, qfact
  NONSPECIFIC_CURRENT i
}

UNITS {
  (nA) = (nanoamp)
  (mV) = (millivolt)
  (umho) = (micromho)
}

PARAMETER {
	gbar = 0.0021  (umho)	: Nusser 2003 - conductance = 435 pS per synapse
							:   G = dI/dV, compare vh = +10 and vh = 0
	tau_r = 0.5 	(ms)   	: Galaretta 1997, Table 1
	tau_d = 7.5  	(ms)   	: Galaretta 1997, Table 1
	Erev  = -60    (mV)   	: reversal potential, Czubayko 2002, Tepper 2004
	saturate = 1.2 			: causes the conductance to saturate - matched to 
							:    Destexhe's reduced model in [1]
	qfact = 2				: convert 22 degC to 35 degC
}							: standard correction - Gutfreund, Table 7.1


ASSIGNED {
	g (umho)
	v (mV)   		: postsynaptic voltage
	i (nA)   		: current = g*(v - Erev)
	t1  (ms)
	
	y1_add (/ms)    : value added to y1 when a presynaptic spike is registered
	y1_loc (/ms)

	countflag	: start/stop counting
	spkcnt		: counts number of events delivered to synapse

	scale		: scale allows the current to be scaled by weight
}			: so NetCon(...,2) gives 2*the current as NetCon(...,1)

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
	g =  gbar * y2 
  i = scale * g * (v - Erev)
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

Galaretta M, Hestrin S (1997). Properties of GABAA receptors underlying inhibitory
 synaptic currents in neocortical pyramidal neurons. J Neurosci 17(19): 7220-7227.
 
Czubayko U, Plenz D (2002) Fast synaptic transmission between striatal
spiny projection neurons. Proc Nat Acad Sci USA 99:15764-15769.

Tepper JM, Koos T, Wilson CJ (2004) GABAergic microcircuits in the
neostriatum. Trends Neurosci 27:662-669.

Gutfreund H, Kinetics for the Life Sciences, Cambridge University Press, 1995, pg 234.
(suggested by Ted Carnevale)

Nusser, Z., Hajos, N., Somogyi, P., and Mody, I. (1998). Increased
number of synaptic GABA(A) receptors underlies potentiation at
hippocampal inhibitory synapses. Nature 395, 172-177.
ENDCOMMENT

