: Calcium activated K channel.
: From Moczydlowski and Latorre (1983) J. Gen. Physiol. 82
: Model 3. (Scheme R1 page 523)

UNITS {
	(molar) = (1/liter)
	(mV) =	(millivolt)
	(mA) =	(milliamp)
	(mM) =	(millimolar)
	FARADAY = (faraday)  (kilocoulombs)
	R = (k-mole) (joule/degC)
}

NEURON {
	SUFFIX skkca
	USEION ca READ cai
	USEION k READ ek WRITE ik
	RANGE gkbar, ik, qfact, abar, bbar, stau
	GLOBAL oinf, tau
}

PARAMETER {
	stau = 1
	qfact = 1
	celsius_sk	= 35	(degC) : 35
	v		(mV)
	gkbar=0.175	(mho/cm2)	: Maximum Permeability
	cai		(mM) 
	ek		(mV)

	d1 = .84	      :page 527 Table II channel A
	d2 = 1.0			:our index 2 is the paper's subscript 4
	k1 = .18	(mM)
	k2 = .011	(mM)
	abar = .48	(/ms)
	bbar = .28	(/ms) :page 524. our bbar is the paper's alpha
}

ASSIGNED {
	ik		(mA/cm2)
	oinf
	tau		(ms)
}

STATE {	o }		: fraction of open channels

BREAKPOINT {
	SOLVE state METHOD cnexp
	ik = gkbar*o*(v - ek)
}

DERIVATIVE state {
	rate(v, cai)
	o' = (oinf - o)/(tau/qfact)
}

INITIAL {
	rate(v, cai)
	o = oinf
:	VERBATIM
:		printf("R = %f\n",R);
:		printf("F = %f\n",FARADAY);
:	ENDVERBATIM
}

: From R1 page 523. beta in the paper is the rate from closed to open
: and we call it alp here.

FUNCTION alp(v (mV), ca (mM)) (1/ms) { :callable from hoc
	alp = abar/(1 + exp1(k1,d1,v)/ca)
}

FUNCTION bet(v (mV), ca (mM)) (1/ms) { :callable from hoc
	bet = bbar/(1 + ca/exp1(k2,d2,v))
}

FUNCTION exp1(k (mM), d, v (mV)) (mM) { :callable from hoc
	exp1 = k*exp(-2*d*FARADAY*v/R/(273.15 + celsius_sk))
}

PROCEDURE rate(v (mV), ca (mM)) { :callable from hoc
	LOCAL a
	a = alp(v,ca)
	tau = stau/(a + bet(v, ca))
	oinf = a*tau
}

