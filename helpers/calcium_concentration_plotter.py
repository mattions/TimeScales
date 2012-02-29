# IPython log file

get_ipython().magic(u'run nrnvisio Data/26-02-2012/Sim_0/storage.h5')
get_ipython().magic(u'logstart')
print "Small volume: 26-02-2012/Sim_0/storage.h5" 

# Biochemical Calcium
t_559 = controls.manager.groups['timeSeries_spine559']
t_ms = (t_559.read() - 300) * 1e3
ca_conc_559 = controls.manager.get_vector('spine559', 'ca_conc', group='timeSeries_spine559')
plot(t_ms, ca_conc_559.read()*1e6, label="bio")
xlabel('Time [ms]')
ylabel('Concentration [um]')

cai_559 = controls.manager.get_vector('spine559_head', 'cai')
cali_559 = controls.manager.get_vector('spine559_head', 'cali')
t = controls.manager.groups['t']
xlabel('Time [ms]')
ylabel('Concentration [um]')

figure()
plot(t, ((cali_559.read()+cai_559.read())*1e3), label='electrical calcium')
