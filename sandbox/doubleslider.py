from PyQt4.QtCore import *
from PyQt4.QtGui import *

class DoubleSlider(QSlider):

        __pyqtSignals__ = ("valueDoubleChanged(double)",)
        
        def __init__(self,parent = None):
        
                QSlider.__init__(self,parent)
                self.setOrientation(Qt.Horizontal)
                self.connect( self , SIGNAL("valueChanged(double)") , 
self.setValueDouble)       

        @pyqtSignature("setValueDouble(double)")
        def setValueDouble(self):
                self.emit(SIGNAL("valueDoubleChanged(double)") , 
                          self.value())
                
if __name__ == "__main__":

    import sys

    app = QApplication(sys.argv)
    slider = DoubleSlider()
    slider.show()
    app.exec_() 