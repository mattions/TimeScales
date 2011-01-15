****************************************
How to launch simulation opn the cluster
****************************************

Storing here for future references::

    bsub -M 20000 -R "rusage[mem=20000]" smt run allspines.param -r "Testing the new synchro mechanism." -t "test, all"

Small memory, for testing::
    
    bsub -M 4000 -R "rusage[mem=4000]" smt run default.param -r "Testing the new synchro mechanism." -t "test, twospines"

Small memory, for testing::
    
    bsub -M 4000 -R "rusage[mem=4000]" smt run short_tstop_double_stim.param -r "Double stims applied for short tstop." -t "test, twospines"

Long tStop test::

    bsub -M 4000 -R "rusage[mem=4000]" smt run long_tstop.param -r "Running a long simulation." -t "test, twospines"

    bsub -M 10000 -R "rusage[mem=10000]" smt run long_tstop_double_stim_two_spines.param -r "Running a double excitation with two spines." -t "twospines"
    
    bsub -M 10000 -R "rusage[mem=10000]" smt run long_tstop_double_stim_onebranch_several_stimulations.param -r "Several stims across one branch pupolated with spines." -t "onebranch"
    
    bsub -M 200000 -R "rusage[mem=200000]" smt run long_stop_double_stim.param -r "Running a double excitation with all the spines. Using 200 Gb of RAM" -t "test, all"    
    
This is for the weight checking::

	bsub -M 4000 -R "rusage[mem=4000]" smt run -m ecellControl/ecellManager.py ecellControl/ecellControl.param -r "Testing AMPA weight"

	