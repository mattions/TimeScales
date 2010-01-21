
import sys
from PyQt4 import QtGui, QtCore, uic

app=QtGui.QApplication(sys.argv)     

a_ui = uic.loadUi("/home/mattions/Work/model/MSN/Neuronvisio/neuronvisio/animation.ui")

#a_ui.view.connect(a_ui.view, QtCore.SIGNAL('changed()'),
#                               self.draw_gradient)
                               
scene = QtGui.QGraphicsScene()
text = scene.addText("hello")
line = scene.addLine(0, 1, 0, 10)

a_ui.view.setScene(scene)
a_ui.view.show()
a_ui.show()

app.exec_()

#def draw_gradient():
#    
#    gradient = QtGui.QLinearGradient(0, 0, 0, 400)
#    gradient.setColorAt(0.0, self.ui.starting_color_btn.color)
#    gradient.setColorAt(1.0, self.ui.ending_color_btn.color)
#    brush = QtGui.QBrush(gradient)
#    scene = QtGui.QGraphicsScene()
#    
#    rect = QtCore.QRectF(0, 0, 400, 200)
#    #scene.addRect(rect, brush=brush)
#    
#    scene.addText("Hello")
#    self.a_ui.view(scene)
#    self.a_ui.view.show()


