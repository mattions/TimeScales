****************************************
How to launch simulation opn the cluster
****************************************

Storing here for future references::

    bsub -M 5000 -R "rusage[mem=5000]" smt run default.param -r "Testing the new synchro mechanism." -t "test, all"

Small memory, for testing::
    
    bsub -M 500 -R "rusage[mem=500]" smt run default.param -r "Testing the new synchro mechanism." -t "test, twospines"
    
This is for the weight checking::

	bsub -R "rusage[mem=500]" smt run -m ecellControl/ecellManager.py ecellControl/ecellControl.param -r "Testing AMPA weight"
	