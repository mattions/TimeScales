TITLE AMPA receptor-one of the two input stimulation of our model

: This mechanism is taken from the Neuron data base "exp2syn.mod" 
: "COMMENT" and "ENDCOMMENT".
: 
: Our modifications:
: 
: We added a single receptor conductance factor: "g_max=0.000010 (uS)".
: An event of weight 1 generates a peak conductance of 1*g_max.
: The weight is equal to the number of ampa receptors open at peak conductance
: The kinetic rate constants and cahnnel conductance are taken from Franks KM, Bartol TM and Sejnowski TJ 
: A Monte Carlo model reveals independent signaling at central glutamatergic synapses 
: J Biophys (2002) 83(5):2333-48
: and Spruston N, Jonas P and Sakmann B
: Dendritic glutamate receptor channels in rat hippocampal CA3 and CA1 neurons
: J Physiol (1995) 482(2): 325-352
: 
: Written by Lei Tian on 04/12/06 


COMMENT
Two state kinetic scheme synapse described by rise time tau1,
and decay time constant tau2. The normalized peak condunductance is 1.
Decay time MUST be greater than rise time.

The solution of A->G->bath with rate constants 1/tau1 and 1/tau2 is
 A = a*exp(-t/tau1) and
 G = a*tau2/(tau2-tau1)*(-exp(-t/tau1) + exp(-t/tau2))
	where tau1 < tau2

If tau2-tau1 -> 0 then we have a alphasynapse.
and if tau1 -> 0 then we have just single exponential decay.

The factor is evaluated in the
initial block such that an event of weight 1 generates a
peak conductance of 1.

Because the solution is a sum of exponentials, the
coupled equations can be solved as a pair of independent equations
by the more efficient cnexp method.

ENDCOMMENT


NEURON {
	SUFFIX ampa
	POINT_PROCESS ampa
	RANGE tau1, tau2, e, i, g_max, g, k
	NONSPECIFIC_CURRENT i
	GLOBAL total, i2, g2
:	EXTERNAL Area_canmda
}

UNITS {
	(nA) = (nanoamp)
	(mA) = (milliamp)
	(mV) = (millivolt)
	(uS) = (microsiemens)
}

PARAMETER {
	tau1 = 0.5    (ms) <1e-9,1e9>   : rise time constant
	tau2 = 2.6   (ms) <1e-9,1e9>	: decay time constant
	g_max= 0.000010 (uS) <1e-9,1e9>	: single channel conductance
	e    = 0       (mV) 
	
	Area  (cm2)
	k = 1e-06 (mA/nA)
}

ASSIGNED {
	v (mV)
	i (nA)
	factor
	total 
	g (uS)
	
	
	g2 (uS)	: plot 'g' and 'i' in "ampa.mod".
	i2 (mA/cm2): global variables read in "canmda.mod" as 'iamps' and 'gampa'
}

STATE {
	A 
	B 
}

INITIAL {
	LOCAL t_peak
	total = 0
	if (tau1/tau2 > .9999) {
		tau1 = .9999*tau2
	}
	A = 0
	B = 0
	t_peak = (tau1*tau2)/(tau2 - tau1) * log(tau2/tau1)
	factor = -exp(-t_peak/tau1) + exp(-t_peak/tau2)
	factor = 1/factor

:	Area = Area_canmda  
}

BREAKPOINT {
	SOLVE state METHOD cnexp
	g = g_max*(B-A)
	i = g*(v-e)		
	
	g2=g
	i2=i*k/Area
}

DERIVATIVE state {
	A' = -A/tau1
	B' = -B/tau2
}

NET_RECEIVE(weight) {
	state_discontinuity(A, weight*factor)
	state_discontinuity(B, weight*factor)
	total = total+weight
}
