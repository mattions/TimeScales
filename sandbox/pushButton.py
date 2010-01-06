#!/usr/bin/python

# pushButton.py

import sys
from PyQt4 import QtGui, QtCore





class Button(QtGui.QWidget):
    def __init__(self, parent=None):
        QtGui.QWidget.__init__(self, parent)

        self.setGeometry(300, 300, 250, 150)
        self.setWindowTitle('Quit button')

        push = QtGui.QPushButton('PushMe', self)
        push.setGeometry(10, 10, 60, 35)

        self.connect(push, QtCore.SIGNAL('clicked()'), self.pushed)

    def pushed(self):
        print ("Button pushed")

app = QtGui.QApplication(sys.argv)
pb = Button()
pb.show()
sys.exit(app.exec_())

