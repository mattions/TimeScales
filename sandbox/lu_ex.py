# Example given by Lu to run E-Cell

import os

#loadModel("modelFile/model_20081212/biomd183_latest2.eml")
loadModel("../biochemical_circuits/biomd183.eml")

ca =  createEntityStub( 'Variable:/Spine:ca' )
ca_in = createEntityStub('Process:/Spine:ca_in')

List=['ca','moles_bound_ca_per_moles_cam','Rbar','PP2Bbar','CaMKIIbar']


Dict = {}
for aVariableName in List:
    Dict[ aVariableName ]  = createLoggerStub( "Variable:/Spine:" + aVariableName + ":Value" )
    Dict[ aVariableName ].create()

def ca_initial(value):
	ca['MolarConc']=value
	return

#use for calcium signal input
def calcium_peak(value,time):
	basal=ca_in['k']
	ca_in['k'] = value
	run(time)
	ca_in['k'] = basal
	return


#ca_initial(1e-5)
ca_initial(0)




#spikes=30
#interval=0.1

message('Start simulation')
run(800)
message('ca input, la la la')
#for i in range(spikes):
#	calcium_peak(4.0e8,0.00001)
#	run(interval)
run(400)


from ecell.ECDDataFile import *

base_dir = os.getcwd() + "/Results/"
print base_dir

for aVariableName in List:
	aDataFile = ECDDataFile( Dict[ aVariableName ].getData() )
	aDataFile.save(aVariableName + ".ecd")

# you MUST write _ca+aNumber


message('End simulation')