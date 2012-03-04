import numpy as np
import matplotlib.pyplot as plt

FIRST_TRAIN_STIM = 18
SECOND_TRAIN_STIM = 6


Num_inputs = np.array([10, 20, 30, 40])
x = Num_inputs * FIRST_TRAIN_STIM + Num_inputs * SECOND_TRAIN_STIM


# Time Analysis
# while_sync organized in dictionary: 
# Key: numb_inputs, Value: Time [s] 
while_1ms = {10 : 190999.43,
             20 : 252372.22, 
             30 : 282201.69, 
             40 : 270703.95 }
while_10ms = {10 : 80233.95, 
              20 : 107879.38,
              30 : 113829.47,
              40:  116230.06}
while_100ms= {10 : 1706.60,
              20 : 1609.41,
              30 : 2000.67,
              40 : 1872.98}
while_0_5ms = {10 : 330934.74,
               20 : 332132.42 ,
               30 : 331733.19,
               40 : 302128.32}

events = {10 : 74833.435,
          20 : 76188.83,
          30 : 79059.62, 
          40 :  83309.78}



def build_array_time(dict_time):
    "Return the time in frequencies order, scaled to mins"
    times = []
    for t in [10,20,30,40]:
        times.append(dict_time[t])
    times_in_mins = np.array(times)/60.0 
    return times_in_mins

events_times = build_array_time(events)
p1, = plt.plot(x, events_times, label='events', color='green')
plt.plot(x, events_times, 'o', color='green')
 
while_1ms_times = build_array_time(while_1ms)
p2, = plt.plot(x, while_1ms_times, label='while 1ms', color='blue')
plt.plot(x, while_1ms_times, 'o', color='blue')

while_10ms_times = build_array_time(while_10ms)
p3, = plt.plot(x, while_10ms_times, label='while 10ms', color='red')
plt.plot(x, while_10ms_times, 'o', color='red')

while_100ms_times = build_array_time(while_100ms)
p4, = plt.plot(x, while_100ms_times, label='while 100ms', color='pink')
plt.plot(x, while_100ms_times, 'o', color='pink')

while_0_5ms_times = build_array_time(while_0_5ms)
p5, = plt.plot(x, while_0_5ms_times, label='while 0.5ms', color='magenta')
plt.plot(x, while_0_5ms_times, 'o', color='magenta')


plt.legend([p1, p2, p3, p4, p5], ['events', 'while 1ms', 'while 10ms', 'while 100ms', 'while 0.5ms' ], loc=0)
plt.xlabel("Number of Events")
plt.ylabel("Time [min]")


# Number of events missed per 



## Time deviation
#
#plt.figure()
#plt.plot([10], [r_10.std()],'bo', label="r_10")
#plt.plot([20], [r_20.std()],'go', label="r_20")
#plt.plot([30], [r_30.std()],'ro', label="r_30")
#plt.plot([40], [r_40.std()],'mo', label="r_40")
#plt.plot([10], [e_10.std()],'b+', label="e_10")
#plt.plot([20], [e_20.std()],'g+', label="e_20")
#plt.plot([30], [e_30.std()],'r+', label="e_30")
#plt.plot([40], [e_40.std()],'m+', label="e_40")
#plt.xlim(5,45)
#
## Memory Analysis
#mem_event = array([31266, 31462,  31295, 30675])
#swap_event = array([51485, 51282,  51200, 51215])
#
#mem_rollback = array([31266, 31269, 31020, 31256])
#swap_rollback = array([51485, 63096, 63384, 63624])
#
#combined_rollback = mem_rollback + swap_rollback
#combined_event = mem_event + swap_event
#
#plt.figure()
#plt.plot(x, combined_rollback, label='rollback', color='green')
#plt.plot(x, combined_rollback, 'o', color='green') 
#plt.plot(x, combined_event, label='event', color='blue')
#plt.plot(x, combined_event, 'o', color='blue')
#plt.legend(loc=0)
#plt.xlabel("Number of Events")
#plt.ylabel("Memory Used [MB]")





plt.show()

