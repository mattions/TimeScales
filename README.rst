****************************************
How to launch simulation opn the cluster
****************************************


TimeScales
==========

Launching the simulations
-------------------------

Storing here for future references::

    bsub -M 20000 -R "rusage[mem=20000]" smt run allspines.param -r "Testing the new synchro mechanism." -t "test, all"

Small memory, for testing::
    
    bsub -M 4000 -R "rusage[mem=4000]" smt run default.param -r "Testing the new synchro mechanism." -t "test, twospines"

Small memory, for testing::
    
    bsub -M 4000 -R "rusage[mem=4000]" smt run short_tstop_double_stim.param -r "Double stims applied for short tstop." -t "test, twospines"
    
    bsub -M 10000 -R "rusage[mem=10000]" smt run short_tstop_onebranch_several_stimulation.param -r "Short tstop for testing. One branch populated with spines. Using 10 Gb" -t "onebranch"

Long tStop test::

    bsub -M 4000 -R "rusage[mem=4000]" smt run long_tstop.param -r "Running a long simulation." -t "test, twospines"

    bsub -M 10000 -R "rusage[mem=6000]" smt run long_tstop_double_stim_two_spines.param -r "Running a double excitation with two spines." -t "twospines"
    
    bsub -M 10000 -R "rusage[mem=6000]" smt run long_tstop_onebranch_several_stimulation.param -r "Several stims across one branch populated with spines. Using 10 Gb" -t "onebranch"
    
    bsub -M 10000 -R "rusage[mem=6000]" smt run long_tstop_onebranch_1_spine_1Hz.param -r "One branch: One spine double stim. 1Hz. Using 10 Gb" -t "onebranch"
    
    bsub -M 10000 -R "rusage[mem=6000]" smt run long_tstop_onebranch_1_spine_4Hz.param -r "One branch: One spine double stim. 4Hz. Using 10 Gb" -t "onebranch"
    
    bsub -M 10000 -R "rusage[mem=6000]" smt run long_tstop_onebranch_1_spine_8Hz.param -r "One branch: One spine double stim. 8Hz. Using 10 Gb" -t "onebranch"
    
    bsub -M 10000 -R "rusage[mem=6000]" smt run long_tstop_onebranch_clustered_plasticity_model.param -r "One branch: Clustered Plasticity Model. 9 spines stimulated. 20 Hz. Using 10 Gb" -t "onebranch"
    
    bsub -M 60000 -R "rusage[mem=20000]" smt run long_tstop_allbranch_cpm_two_branches_stims_8_Hz.param -r "CPM 2 branches, all spine 8 Hz. Using 60 Gb of RAM" -t "all"
    
    bsub -M 60000 -R "rusage[mem=20000]" smt run long_tstop_allbranch_cpm_two_branches_stims_20_Hz.param -r "CPM 2 branches, all spine 20 Hz. Using 60 Gb of RAM (5seg med)" -t "all"
    
    bsub -M 60000 -R "rusage[mem=20000]" smt run long_tstop_allbranch_cpm_two_branches_stims_40_Hz.param -r "CPM 2 branches, all spine 40 Hz. Using 60 Gb of RAM (5seg med)" -t "all"
    
    bsub -M 60000 -R "rusage[mem=20000]" smt run long_tstop_allbranch_cpm_two_branches_stims_50_Hz.param -r "CPM 2 branches, all spine 50 Hz. Using 60 Gb of RAM (5seg med)" -t "all"   

Read simulation results
-----------------------

Reload the storage.h5 file with neuronvisio
 
EcellManager
============

Launching the simulation
------------------------

This is for the weight checking::

	bsub -M 4000 -R "rusage[mem=4000]" smt run -m ecellControl/ecellManager.py ecellControl/ecellControl.param -r "Testing AMPA weight"

	
Read simulations results
------------------------

Open an ipython and run

run helpers/plotter path/to/TimeCourses