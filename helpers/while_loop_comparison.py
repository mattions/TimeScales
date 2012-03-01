from numpy import array
import matplotlib.pyplot as plt

FIRST_TRAIN_STIM = 18
SECOND_TRAIN_STIM = 6


Num_inputs = array([10, 20, 30, 40])
x = Num_inputs * FIRST_TRAIN_STIM + Num_inputs * SECOND_TRAIN_STIM


# Time Analysis
# while_sync organized in dictionary: 
# Key: numb_inputs, Value: Time [s] 
while_1ms = {10 : 1706.60,
             20 : 1609.41, 
             30 : 2000.67, 
             40 : 1872.98 }
while_10ms = {10 : 80233.95, 
              20 : 107879.38,
              30 : 113829.47,
              40:  116230.06}

while_sync_1ms = array([62171.03, 73263.17, 75811.31])
r_20 = array([81626.53, 74990.55, 72281.77])
r_30 = array([71874.88 , 83235.84, 78298.66, 75257.20])
r_40 = array([83678.98, 78842.45, 85668.27 ])

e_10 = array([79124.49 , 70542.38])
e_20 = array([75348.20, 77029.46])
e_30 = array([76859.15, 81260.09])
e_40 = array([79219.01, 87400.55])



y_roll = [r_10.mean(), r_20.mean(), r_30.mean (), r_40.mean()] #s
y_event= [e_10.mean(), e_20.mean(), e_30.mean(), e_40.mean()]

y_roll_min = array(y_roll)/60.0
y_event_min = array(y_event)/60.0

plt.plot(x, y_roll_min, label='rollback', color='green')
plt.plot(x, y_roll_min, 'o', color='green') 
plt.plot(x, y_event_min, label='event', color='blue')
plt.plot(x, y_event_min, 'o', color='blue')
plt.legend(loc=0)
plt.xlabel("Number of Events")
plt.ylabel("Time [min]")

# Time deviation

plt.figure()
plt.plot([10], [r_10.std()],'bo', label="r_10")
plt.plot([20], [r_20.std()],'go', label="r_20")
plt.plot([30], [r_30.std()],'ro', label="r_30")
plt.plot([40], [r_40.std()],'mo', label="r_40")
plt.plot([10], [e_10.std()],'b+', label="e_10")
plt.plot([20], [e_20.std()],'g+', label="e_20")
plt.plot([30], [e_30.std()],'r+', label="e_30")
plt.plot([40], [e_40.std()],'m+', label="e_40")
plt.xlim(5,45)

# Memory Analysis
mem_event = array([31266, 31462,  31295, 30675])
swap_event = array([51485, 51282,  51200, 51215])

mem_rollback = array([31266, 31269, 31020, 31256])
swap_rollback = array([51485, 63096, 63384, 63624])

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





plt.show()

