**********
Quickstart
**********

Package structure
=================

These are the directories of the package:

- *biochemical_circuits* contains all the biochemical network which have been used at different stage 
  of the development of the model.
- *branch_dist* contains the code to calculate the spine distribution as explained in the paper 
  and in the thesis
- *ecellControl* is the module with the ecellManager class, which controls the E-Cell simulator 
  and it's used ae entry-point in the main synchronization script (`spineIntegration.py`)
- *helpers* is a directory where there are some utilities script used to plot and explore the data
- *hoc* contains the hoc file to instantiate the MSN without any spines based on the model of 
- *mod* contains the NMODL file which needs to be compiled and than can be loaded into section in the 
  Neuron model. 
- *neuroControl* is the module with the NeuronManager class, which is used to control NEURON. In this module
  there are also the class to create the hybrid spine, which has both electrical and biochemical nature.
- *param* contains the parameters file used to run the simulations.
- *spineIntegration.py* is the main script which runs the multiscale model.
- *extref.py* contains the class to extend Neuronvisio storage format to accept the biochemical results 
  on top of the electrical one. 
- *visioStart.py* instantiate the model and loads it in the Neuronvisio software.


Dependencies
============

Ecell
-----

To run the model you need to install E-cell3 (3.1.106) version, which you can download 
from https://sourceforge.net/projects/binaryfiles/files/latest/download and compile it 
with the python support.

Neuron
------

Neuron is available from http://www.neuron.yale.edu/neuron/, and it has to be compiled with python support

Neuronvisio
-----------

Neuronvisio is needed to save the simulation and can be obtained from http://neuronvisio.org/


Running the model
=================

To run the model you need to run it as::

	python spineIntegration.py parameter_file.param 

where the `parameter_file.param` is the file you want to use to run the model.

In the `params` directory there are the files to run the model in different ways:

The most important parameters are:

1. `spines_dist`, which can be: 
    a) `zero` for no spines
    b) `two` for only two spines 
    c) `onebranch` to instantiate all the spines in one branch (one medial and two distal 
    	dendrites)
    d) `all` to instantiate all the spines
2. `bio_on` If `True` the biochemical integration will be used, if `False` 
	no biochemical integration will be used (If you are only interested in the 
	electrical behaviour set it to `False`).


For example to run a the model with just two spines, for a very short time do::

	python spineIntegration.py param/two_spines_stim.param

To run a longer period, do::

	python spineIntegration.py param/long_tstop_double_stim_two_spines.param

If you want to run the model with all the spines, you can run (this is very big. 
I've ran it with 60GB of RAM on the EBI Cluster::

	python spineIntegration.py param/long_tstop_allbranch_cpm_two_branches_stims_20_Hz.param
	
An example of how to run the model using only the electrical part is possible with the param file::
    
    python spineIntegration.py param/short_tstop_electrical.param
