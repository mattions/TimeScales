from numpy import array
import matplotlib.pyplot as plt
x = [10, 20, 30, 40]
y_roll = [62678.12, 102494.94, 84215.69, 136696.58] #s
y_roll_min = array(y_roll)/60.0
y_event= [79124.49, 109847.80, 71891.65, 77114.13]
y_event_min = array(y_event)/60.0

plt.plot(x, y_roll_min, label='rollback', color='green')
plt.plot(x, y_roll_min, 'o', label='rollback', color='green') 
plt.plot(x, y_event_min, label='event', color='blue')
plt.plot(x, y_event_min, 'o', label='event', color='blue')

