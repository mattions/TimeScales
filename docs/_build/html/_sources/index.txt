Welcome to TimeScales's documentation!
======================================

Every simulation in TimeScale is run till `tStop`, after a period of equilibration 
for the two models. The electrical one needs 100 ms, while the biochemical one needs 
300 seconds. 

The minimum model that can be run with TimeScales is a MSN model with two spine only.
To launch this simulation run::

	python spineIntegration.py param/short_tstop_double_stim.param

All the variables are saved using the manager class from Neuronvisio. 

Deciding the inputs
-------------------

Inputs are passed as dictionary. Two are the important variables to configure

	- `stimulated_spines`, a list of the spines that are stimulated,
	- `spine1`, a variable name equal to the stimulated spine, which refer to which 
		type of stimulation should be given.
		
For example, to stimulate `spine1`, with the ampa1 stimulation and nmda1 stimulation
just set the variable to::

"stimulated_spines" : ['spine1'],
"spine1" : ['ampa_s1', 'nmda_s1'],

`ampa_s1` and `nmda_s1` are dictionary that holds the time, number and interval of the 
stimulation and they are created as::




Contents:

.. toctree::
   :maxdepth: 2
