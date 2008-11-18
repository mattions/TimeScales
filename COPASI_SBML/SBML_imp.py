import COPASI
datamodel = COPASI.CCopasiDataModel.GLOBAL

def this_crash():
    filename = "folder1/BIOMD0000000067.xml"
    x = datamodel.importSBML(filename)
    if x == True:
        print "import on a nested directory worked!"
    
def this_work():
    filename = "BIOMD0000000067_.xml"
    x = datamodel.importSBML(filename)
    if x == True:
        print "import on the same directory worked!"

this_work()
this_crash()

