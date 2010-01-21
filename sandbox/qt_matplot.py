

import numpy as np
import matplotlib
matplotlib.use("Qt4Agg")
matplotlib.interactive(True)
import matplotlib.pyplot as plt

x = np.linspace(0,10)

plt.plot(x, np.sin(x))
