import matplotlib
matplotlib.use("Qt4Agg")
matplotlib.interactive(True)
import matplotlib.pyplot as plt
import numpy as np

x = np.linspace(0,50)
plt.plot(x)

plt.figure(2)
plt.plot(x, 'r-')


### Close Figure 1 Using the closing button on the top

plt.figure(1)   # <-- Raise the Run Time error
                # Should create a new figure with index 1


