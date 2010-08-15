****************************************
How to launch simulation opn the cluster
****************************************

Storing here for future references::

	bsub -R "rusage[mem=500]" smt run default.param -r "Testing the new synchro mechanism." -t "test, twospines"
