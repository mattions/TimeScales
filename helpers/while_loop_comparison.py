import numpy as np
import matplotlib.pyplot as plt
from decimal import Decimal, getcontext

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



while_sync_sparseness =  {2: 18733.74, 4: 21888.38, 16: 29467.67, 32: 45435.57}
events_sparseness = {2: 16722.49, 4: 15879.96, 16: 19695.96, 32: 18482.28}



def build_array_time(dict_time):
    "Return the time in frequencies order, scaled to mins"
    times = []
    for t in [10,20,30,40]:
        times.append(dict_time[t])
    times_in_mins = np.array(times)/60.0 
    return times_in_mins


def create_inputs_list(delay, numbers, t_stims):

    getcontext().prec = 7
    tot_inputs = []
    for t_stim in t_stims:
        first_input = Decimal(t_stim) + Decimal(delay)
        
        inputs_time = [first_input]
        for i in range(numbers - 1):
            new_time = inputs_time[-1] + Decimal(delay)
            inputs_time.append(new_time)
        tot_inputs.extend(inputs_time)
    return tot_inputs


def calculate_number_of_events(inputs_time, delta_sync):
    syncs_time = np.arange(0, 20000, delta_sync)
    number_of_event_to_18_spines = 0
    number_of_event_to_6_spines = 0
    for x in inputs_time:
        if x in syncs_time:
#            print "event in sync time: %s" %x
            if x < 15000:
                number_of_event_to_18_spines += 1
            else:
                number_of_event_to_6_spines += 1
    number_of_events = number_of_event_to_18_spines * 18 + number_of_event_to_6_spines * 6
    return number_of_events

# Number of events missed per delta
def calc_missed_events():
    plt.figure()
    delta_t = [10, 100]
    #delta_t = [1]   
    delay = 50
    numbers = 30
    t_stims = [2000,15000]
    for dt in delta_t:
        n_events_missed = []
        for input in Num_inputs:
            inputs_time = create_inputs_list(delay, input, t_stims)
            n_events_hit = calculate_number_of_events(inputs_time, dt)
            n_events_tot = input * FIRST_TRAIN_STIM + input * SECOND_TRAIN_STIM
            n_events_missed.append( n_events_tot - n_events_hit)
        #    n_events * FIRST_TRAIN_STIM + n_events * SECOND_TRAIN_STIM
        print "dt %s tot events: %s missed events: %s" %(dt, x, n_events_missed)
        plt.plot(x, n_events_missed, marker='o', linestyle='-', label=str(dt))


# sparseness
def plot_sparseness_comparison():
    x = events_sparseness.keys()
    x.sort()
    y_whi = []
    y_ev = []
    for p in x:
        y_whi.append(while_sync_sparseness[p])
        y_ev.append(events_sparseness[p])
    plt.figure()

    plt.plot(x, np.array(y_whi)/60., marker='o', linestyle='-', label="while_sync")
    plt.plot(x, np.array(y_ev)/60., marker='o', linestyle='-', label="events")
    plt.ylabel('Time [min]')
    plt.xlabel("number of spines")
    plt.title('Sparseness comparison')
    plt.legend(loc=0)



while_0_5ms_times = build_array_time(while_0_5ms)
plt.plot(x, while_0_5ms_times, marker='o', linestyle='-', label='while 0.5ms', color='magenta')

while_1ms_times = build_array_time(while_1ms)
plt.plot(x, while_1ms_times, marker='o', linestyle='-', label='while 1ms', color='blue')

while_10ms_times = build_array_time(while_10ms)
plt.plot(x, while_10ms_times, marker='o', linestyle='-', label='while 10ms', color='red')

events_times = build_array_time(events)
plt.plot(x, events_times, marker='o', linestyle='-', label='events', color='green')

while_100ms_times = build_array_time(while_100ms)
plt.plot(x, while_100ms_times, marker='o', linestyle='-', label='while 100ms', color='pink')


#plt.legend([p1, p2, p3, p4, p5], ['events', 'while 1ms', 'while 10ms', 'while 100ms', 'while 0.5ms' ], loc=0)
plt.legend(loc=0)
plt.xlabel("Number of Events")
plt.ylabel("Time [min]")
plt.ylim(-100, 6000)


plot_sparseness_comparison()
