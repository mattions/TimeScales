TITLE BK KCA channel for nucleus accumbens model - old version!

: large conductance kca channel

COMMENT Equations from 
		  Shao L.R., Halvorsrud R., Borg-Graham L., Storm J.F. The role
		  of BK-type Ca2_-dependent K+ channels in spike broadening
		  during repetitive firing in rat hippocampal pyramidal cells
		  J.Physiology (1999),521:135-146
		  
		  The Krasnow Institute
		  George Mason University

Copyright	  Maciej Lazarewicz, 2001
		  (mlazarew@gmu.edu)
		  All rights reserved.
ENDCOMMENT

NEURON {
	SUFFIX bkkca
	USEION k READ ek WRITE ik
	USEION ca READ cai
	RANGE  gkbar,ik, q
}

UNITS {
	(molar) = (1/liter)
	(mM)	= (millimolar)
	(S)  	= (siemens)
	(mA) 	= (milliamp)
	(mV) 	= (millivolt)
}

PARAMETER {
	turnOffinact = 1 (1)
    gkbar	= 0.001 (S/cm2)
    q = 1
	celsius		 (degC)
}

ASSIGNED {
        v       (mV)
        cai	(mM)
	ik	(mA/cm2)
	k1	(/ms)
	k2	(/ms)
	k3	(/ms)
	k4	(/ms)
	q10	(1)
	ek 	(mV)
}

STATE { cst ost ist }

BREAKPOINT { 
	SOLVE kin METHOD sparse
	ik = gkbar * ost * ( v - ek ) 
}

INITIAL {
	SOLVE kin STEADYSTATE sparse
}

KINETIC kin {
	rates(v)
	~cst<->ost  (k3,k4)
	~ost<->ist  (k1,0.0)
	~ist<->cst  (k2,0.0)
	CONSERVE cst+ost+ist=1
}

PROCEDURE rates( v(mV)) {
	 k1=alp( 0.1, v,  -10.0,   1.0 )
	 k2=alp( 0.1, v, -120.0, -10.0 )
	 k3=alpha( 0.001, 1.0, v, -20.0, 7.0 ) *1.0e8* ( cai*1.0(/mM) )^3
	 k4=alp( 0.01, v, -44.0,  -5.0 )
}

FUNCTION alpha( tmin(ms), tmax(ms), v(mV), vhalf(mV), k(mV) )(/ms){
        alpha = q / ( tmin + 1.0 / ( 1.0 / (tmax-tmin) + exp((v-vhalf)/k)*1.0(/ms) ) )
}

FUNCTION alp( tmin(ms), v(mV), vhalf(mV), k(mV) )(/ms){
        alp = q / ( tmin + exp( (v-vhalf) / k )*1.0(ms) )
}







