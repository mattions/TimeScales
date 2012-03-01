import matplotlib.pyplot as plt
import os 

#from helpers.plotter import DoublePlotter, StimulPlotter
import neuronvisio.manager

filename = 'storage.h5'

#stimulated_spines = ['spine554', 'spine555', 'spine556', 
#                     'spine558', 'spine559', 'spine560', 
#                     'spine562', 'spine563', 'spine564', 
#                     'spine1468', 'spine1469', 'spine1470', 
#                     'spine1472', 'spine1473', 'spine1474', 
#                     'spine1476', 'spine1477', 'spine1478']
stimulated_spines = ['spine559', 'spine560']

#stimulated_spines = ['spine554']
#dirs = {'cpm_8Hz' : 'Data_rmt/30-04-2011/Sim_0/',
#        'cpm_20Hz' : 'Data_rmt/29-04-2011/Sim_2/',
#        'cpm_40Hz' : 'Data_rmt/29-04-2011/Sim_1/',
#        'cpm_50Hz' : 'Data_rmt/29-04-2011/Sim_0/',
#        'cpm_40Hz_long' : 'Data_rmt/25-06-2011/Sim_0/',
#        }
dirs = {'small_volume_20Hz' : 'Data_rmt/26-02-2012/Sim_0/',
        'right_volume_20Hz' : 'Data_rmt/29-02-2012/Sim_0/'
        }


def plotting(fig_fil):
    pass



for condition, dir in dirs.iteritems():
    h5_filename = dir + 'storage.h5'
    neuronvisio.manager = reload(neuronvisio.manager)
    prefix = 'bio_' 
    name = "%s_enzymes_%s_%s%s" %(prefix, condition, 'spine1478', '.png')
    tstop_bio = 300
    if not os.path.exists(os.path.join(dir, name)):
        man = neuronvisio.manager.Manager()
        man.load_from_hdf(h5_filename)
        #dp = DoublePlotter()
        #sp = StimulPlotter()
        
        
        for spine_num in stimulated_spines:
            name = None
            fig_filename = None
            name = prefix + condition + "_" + spine_num + '.png'
            fig_filename = os.path.join(dir, name)
    
            if not os.path.exists(fig_filename):
                bio_group = 'timeSeries_' + spine_num
                
                sec_name = "%s_head" %spine_num
                
                # Scaling time
                t = man.groups[bio_group]
                t_ms = (t.read()- tstop_bio) * 1e3 #scaling to ms
                
                # Plotting the vars
                vars = ['PP2Bbar', 'CaMKIIbar', 'PP1abar', 'Dpbar']
                fig = plt.figure()
                for var in vars:
                    
                    vec_bio = man.get_vector(spine_num, var, group=bio_group)
                
                    plt.plot(t_ms, vec_bio, label=var)
                    plt.ylabel('Normalized activation')
                    plt.xlabel('Time [ms]')
                    plt.xlim(0,20000)
                    plt.ylim(0, 1.0)
                    plt.legend()
                    plt.title(spine_num)
                    
                    for ext in ['.png', '.pdf']:            
                        name = "%s_enzymes_%s_%s%s" %(prefix, condition, spine_num, ext)
                        fig_filename = os.path.join(dir, name)
                        plt.savefig(fig_filename)
                        print "Saved file %s" %fig_filename
                    
                # Calcium
                fig = plt.figure()
                vec_bio = man.get_vector(spine_num, 'ca_conc', group=bio_group)
                label ="%s_ca" %spine_num
                plt.plot(t_ms, vec_bio[:], 'r-', label=label)
                plt.xlabel('Time [ms]')
                plt.ylabel('Concentration [mM]')
                plt.xlim(0,20000)
                #sp.plot_input(spine_num, man, height_in_the_graph=0.0005)
                #plt.ylim(0, 0.010)
                
                for ext in ['.png', '.pdf']:            
                    name = "%s_calcium_%s_%s%s" %(prefix, condition, spine_num, ext)
                    fig_filename = os.path.join(dir, name)
                    plt.savefig(fig_filename)
                    print "Saved file %s" %fig_filename
            else:
                print "File %s exist. Skipping" %fig_filename
        del man
    else:
        print "Skipping dir %s" %dir