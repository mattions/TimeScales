#
# tree.py - a simple tree with QListView
#
import sys
from qt import *


class MainWindow(QMainWindow):

    def __init__(self, *args):
        apply(QMainWindow.__init__, (self,) + args)
        self.tree = QListView(self)
        self.setCentralWidget(self.tree)
        self.tree.addColumn("item")
        self.tree.setRootIsDecorated(1)
        self.items=[]
        self.items.append(QListViewItem(self.tree, "testself1"))
        self.items.append(QListViewItem(self.items[-1], "child 1"))
        self.items.append(QListViewItem(self.items[-2], "child 2"))

def main(args):
    app=QApplication(args)
    win=MainWindow()
    win.show()
    app.connect(app, SIGNAL("lastWindowClosed()"),
                app, SLOT("quit()"))
    app.exec_loop()

if __name__=="__main__":
    main(sys.argv)

