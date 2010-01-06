#!/usr/bin/env python
# -*- coding: utf-8 -*-
""" Launch matplotlibshell using gtk """

import gtk,gobject
gtk.set_interactive(False)
import IPython.Shell
live = False

def run_ipython():
    global live
    if live:
        return False
    
    live = True
    shell = IPython.Shell.IPShellMatplotlib()
    IPython.Shell.hijack_gtk()
    shell.mainloop()

gobject.idle_add(run_ipython)
# the following line does not work on current pygtk
#gtk.set_interactive(True)
gtk.main()
