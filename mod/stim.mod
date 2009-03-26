: $Id: netstim.mod,v 1.2 2003/03/31 13:27:47 hines Exp $
: comments at end

NEURON	{ 
  ARTIFICIAL_CELL stim
  RANGE y, frequency, number, noise, start, change
}

PARAMETER {
	frequency	= 1 (1/s) : mean frequency of spiking = 1000/interval (from netstim.mod)
	number = 0
	noise = 0
	start = 0
	change = 0
}

ASSIGNED {
	y
}

PROCEDURE seed(x) {
	set_seed(x)
:	VERBATIM
:		printf("Seed is %g\n", _lx);
:	ENDVERBATIM
}

INITIAL {
	y = 0
}	


NET_RECEIVE (w) {
	if (flag == 0) { : external event 
		y = 2
		net_event(t)		: sends event at time t to all processes connected to jstim
		net_send(.1, 2)		: spike ends in 0.1 ms
	}
	if (flag == 2) {
		y = 0
	}
}

COMMENT
Presynaptic spike generator
---------------------------

This mechanism has been written to be able to use synapses in a single
neuron receiving various types of presynaptic trains.  This is a "fake"
presynaptic compartment containing a spike generator.  The trains
of spikes can be either periodic or noisy (Poisson-distributed)

Parameters;
   noise: 	between 0 (no noise-periodic) and 1 (fully noisy)
   interval: 	mean time between spikes (ms)
   number: 	mean number of spikes

Written by Z. Mainen, modified by A. Destexhe, The Salk Institute

Modified by Michael Hines for use with CVode
The intrinsic bursting parameters have been removed since
generators can stimulate other generators to create complicated bursting
patterns with independent statistics (see below)

Modified by Michael Hines to use logical event style with NET_RECEIVE
This stimulator can also be triggered by an input event.
If the stimulator is in the on=0 state and receives a positive weight
event, then the stimulator changes to the on=1 state and goes through
its entire spike sequence before changing to the on=0 state. During
that time it ignores any positive weight events. If, in the on=1 state,
the stimulator receives a negative weight event, the stimulator will
change to the off state. In the off state, it will ignore negative weight
events. A change to the on state immediately fires the first spike of
its sequence.

ENDCOMMENT

