# File : qtDesigner_test.py
import sys
from PyQt4 import QtGui, QtCore, uic

def pushed():
    print ("Pushed!!!")

if __name__ == "__main__":
    app = QtGui.QApplication(sys.argv)
    window = uic.loadUi("myApp.ui")
    window.pushButton.connect(window.pushButton, QtCore.SIGNAL('clicked()'), pushed)
    window.show()
    app.exec_()

