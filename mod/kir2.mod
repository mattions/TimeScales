COMMENT
Described by Gruber et al. 2003, which they based on Mermelstein et al. 1998

Gruber, A.J., Solla, S.A., Surmeier, D.J., and Houk, J.C.
Modulation of striatal single units by expected reward: 
a spiny neuron model displaying dopamine-induced bistability.
J. Neurophysiol. 90:1095-1114, 2003.

Mermelstein, P.G., Song, W-J., Tkatch, T., Yan, Z., and Surmeier, D.J.
Inwardly rectifying potassium currents are correlated with irk subunit expression
in rat nucleus accumbens medium spiny neurons.
J. Neurosci. 18:6650-6661, 1998.

Unlike the formulation used by Gruber et al., 
which assumed instantaneous activation, 
this implementation assumes a constant activation time constant 
that is relatively fast compared to the time scale of the model 
(100-1000 ms).
ENDCOMMENT

NEURON {
	SUFFIX kir2
	USEION k READ ek WRITE ik
	RANGE gbar, g, i
	GLOBAL ninf, ntau
	POINTER mu : hoc level DAsyn[i].msg--see dasyn.mod
}

UNITS {
	(mA) = (milliamp)
	(uA) = (microamp)
	(mV) = (millivolt)
	(mS) = (millimho)
}

PARAMETER {
	gbar = 1.2	(mS/cm2)	<0,1e9>
	ek = -90	(mV)
	vh = -111	(mV)	: half activation
	ve = -11	(mV)	: slope
	ntauconst = 0.1	(ms)	: n activates much faster than 100-1000 ms
}

ASSIGNED {
	v	(mV)
	g	(mho/cm2)
	i	(uA/cm2)	: for consistency with their usage of uA/cm2
	ik	(mA/cm2)
	ninf	(1)
	ntau	(ms)
	mu	(1)
}

STATE {
	n
}

BREAKPOINT {
	SOLVE states METHOD cnexp
	g = mu*(0.001)*gbar*n
	ik = g*(v - ek)     
	i = (1000)*ik
}

INITIAL {
	rates(v)
	n = ninf
}

DERIVATIVE states { 
	rates(v)
	n' = (ninf-n)/ntau
}


: rates() computes rate and other constants at present v
: call once from hoc to initialize inf at resting v
PROCEDURE rates(v(mV)) {
UNITSOFF
	: "n" potassium activation
	ntau = ntauconst
	ninf = 1/(1 + exp(-(v - vh)/ve))
}
UNITSON
