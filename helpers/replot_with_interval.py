import os
import sys

import matplotlib
matplotlib.use('Agg')
import pylab

from visualizerBiochemical import VisualizerBiochemical
top = sys.argv[1] 

for root, dirs, files in os.walk(top, topdown=False):
    if len(dirs) == 0:
        visualBio = VisualizerBiochemical(root, save=True)
        visualBio.main()
    


