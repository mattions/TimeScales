from mpi4py import MPI
import os

# Removing display to import neuron properly
if os.environ.has_key("DISPLAY"):
    del os.environ['DISPLAY']

from neuron import h
pc = h.ParallelContext()

s = "mpi4py thinks I am %d of %d, NEURON thinks I am %d of %d\n"
cw = MPI.COMM_WORLD
print s % (cw.rank, cw.size, pc.id(), pc.nhost())

pc.done()
