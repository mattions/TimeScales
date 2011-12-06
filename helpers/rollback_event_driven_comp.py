from numpy import array
import matplotlib.pyplot as plt

FIRST_TRAIN_STIM = 18
SECOND_TRAIN_STIM = 6


Num_inputs = array([10, 20, 30, 40])
x = Num_inputs * FIRST_TRAIN_STIM + Num_inputs * SECOND_TRAIN_STIM


# Time Analysis

y_roll = [62678.12, 102494.94, 84215.69, 136696.58] #s
y_roll_min = array(y_roll)/60.0
y_event= [79124.49, 75348.20, 71891.65, 77114.13]
y_event_min = array(y_event)/60.0

plt.plot(x, y_roll_min, label='rollback', color='green')
plt.plot(x, y_roll_min, 'o', color='green') 
plt.plot(x, y_event_min, label='event', color='blue')
plt.plot(x, y_event_min, 'o', color='blue')
plt.legend(loc=0)
plt.xlabel("Number of Events")
plt.ylabel("Time [min]")


# Memory Analysis
mem_event = array([31266, 39875, 47691, 46807])
swap_event = array([51485, 51132, 50951, 51575])

mem_rollback = array([31266, 31269, 30868, 31256])
swap_rollback = array([51485, 63096, 63578, 63624])

combined_rollback = mem_rollback + swap_rollback
combined_event = mem_event + swap_event

plt.figure()
plt.plot(x, combined_rollback, label='rollback', color='green')
plt.plot(x, combined_rollback, 'o', color='green') 
plt.plot(x, combined_event, label='event', color='blue')
plt.plot(x, combined_event, 'o', color='blue')
plt.legend(loc=0)
plt.xlabel("Number of Events")
plt.ylabel("Memory Used [MB]")
