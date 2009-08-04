import os
import sys

from visualizerBiochemical import VisualizerBiochemical

import matplotlib
matplotlib.use('Agg')
import pylab

top = sys.argv[1] 

for root, dirs, files in os.walk(top, topdown=False):
    if len(dirs) == 0:
        visualBio = VisualizerBiochemical(root, save=True)
        visualBio.main()
    


