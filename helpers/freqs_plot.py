
from matplotlib import pyplot as plt

freq_4Hz = [-60, -57]
freq_8Hz = [-60, -56]
freq_50Hz = [-60, -52]
abs (-60 - -57)
abs (-60 - -56)
abs (-60 - -52)
x = [4,8,50]
y = [3,4,8]
plt.plot(x, y, marker='o', linestyle='-', label='ele_and_bio')
y_1 = [0,0,0]
plt.plot(x, y_1, marker='o', linestyle='-', label="only_ele")
plt.xlim(0,55)
plt.ylim(-0.5, 10)

plt.ylabel('Delta between trains [mV]')
plt.xlabel('Frequencies [Hz]')
plt.legend(loc=0)
#plt.savefig('../../../../writings/thesis/gfx/Frequencies_variation.pdf')
