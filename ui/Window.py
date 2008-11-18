#!/usr/bin/env python


try:
    import wx
    from wx import glcanvas
except ImportError:
    raise ImportError, "Required dependency wx.glcanvas not present"

try:
    from OpenGL.GL import *
    from OpenGL.GLU import *
    from OpenGL.GLE import *
    from OpenGL.GLUT import *
except ImportError:
    raise ImportError, "Required dependency OpenGL not present"

class glCanvas(glcanvas.GLCanvas):
    def __init__(self, parent):
        glcanvas.GLCanvas.__init__(self, parent, -1)
        self.init = False
        # initial mouse position
        self.lastx = self.lasty = 0
        
        self.Bind(wx.EVT_ERASE_BACKGROUND, self.OnEraseBackground)
        self.Bind(wx.EVT_SIZE, self.OnSize)
        self.Bind(wx.EVT_PAINT, self.OnPaint)
        self.Bind(wx.EVT_LEFT_DOWN, self.OnMouseLeftDown)
        self.Bind(wx.EVT_LEFT_UP, self.OnMouseLeftUp)
        self.Bind(wx.EVT_MOTION, self.OnMouseMotion)

    def OnEraseBackground(self, event):
        pass # Do nothing, to avoid flashing on MSW.

    def OnSize(self, event):
        size = self.size = self.GetClientSize()
        if self.GetContext():
            self.SetCurrent()
            self.Update() # Need to update the window immeditaly
            glViewport(0, 0, size.width, size.height)
        event.Skip()

    def OnPaint(self, event):
        dc = wx.PaintDC(self)
        self.SetCurrent()
        if not self.init:
            self.InitGL()
            self.init = True
        self.OnDraw()

    def OnMouseLeftDown(self, evt):
        self.CaptureMouse()
        self.lastx, self.lasty = evt.GetPosition()

    def OnMouseLeftUp(self, evt):
        self.ReleaseMouse()

    def OnMouseMotion(self, evt):
        if evt.Dragging() and evt.LeftIsDown():
            self.lastx, self.lasty = evt.GetPosition()
            self.Refresh()
    
    # GLFrame OpenGL Event Handlers

    def InitGL(self):
        """Initialize OpenGL for use in the window."""
        self.background = [1,1,1,1] # White Background
        glClearDepth (1.0)
        glEnable (GL_DEPTH_TEST)
        glClearColor(self.background[0], self.background[1], self.background[2], self.background[3]) 
        glShadeModel (GL_SMOOTH)
        glMatrixMode (GL_PROJECTION)
        # roughly, measured in centimeters */
        glFrustum (-9.0, 9.0, -9.0, 9.0, 50.0, 100.0)
        glMatrixMode(GL_MODELVIEW)
        
        # set up a light 
        lightOnePosition = (40.0, 40, 100.0, 0.0)
        lightOneColor = (0.99, 0.99, 0.99, 1.0) 
        
        lightTwoPosition = (-40.0, 40, 100.0, 0.0)
        lightTwoColor = (0.99, 0.99, 0.99, 1.0) 
        # initialize lighting */
        glLightfv (GL_LIGHT0, GL_POSITION, lightOnePosition)
        glLightfv (GL_LIGHT0, GL_DIFFUSE, lightOneColor)
        glEnable (GL_LIGHT0)
        glLightfv (GL_LIGHT1, GL_POSITION, lightTwoPosition)
        glLightfv (GL_LIGHT1, GL_DIFFUSE, lightTwoColor)
        glEnable (GL_LIGHT1)
        glEnable (GL_LIGHTING)
        glColorMaterial (GL_FRONT_AND_BACK, GL_DIFFUSE)
        glEnable (GL_COLOR_MATERIAL)

    def OnReshape(self, width, height):
        """Reshape the OpenGL viewport based on the dimensions of the window."""
        glViewport(0, 0, width, height)

        glMatrixMode(GL_PROJECTION)
        glLoadIdentity()
        glOrtho(-0.5, 0.5, -0.5, 0.5, -1, 1)

        glMatrixMode(GL_MODELVIEW)
        glLoadIdentity()

    def OnDraw(self, *args, **kwargs):
        "Draw the window."
        glClear(GL_COLOR_BUFFER_BIT)


        glClear (GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT)
        # set up some matrices so that the object spins with the mouse
        gleSetJoinStyle (TUBE_NORM_EDGE | TUBE_JN_ANGLE | TUBE_JN_CAP)
        glPushMatrix ()
        glTranslatef (0.0, 0.0, -80.0)
        glRotatef(self.lasty, 0.0, 0.0, 1.0);  
        glRotatef(self.lastx, 1.0, 0.0, 0.0); 
    
        # Phew. FINALLY, Draw the polycone
        glePolyCone(((-6.0, 6.0, 0.0), (6.0, 6.0, 0.0), (6.0, -6.0, 0.0), (-6.0, -6.0, 0.0), (-6.0, 6.0, 0.0), (6.0, 6.0, 0.0)),
                    ((0.0, 0.0, 0.0), (0.0, 0.8, 0.3), (0.8, 0.3, 0.0), (0.2, 0.3, 0.9), (0.2, 0.8, 0.5), (0.0, 0.0, 0.0)), (1, 1, 3, 0.5, 2, 1))
        
        glPopMatrix ()
        
        self.SwapBuffers()


class MainWindow(wx.Frame):
    def __init__(self, parent = None, id = -1, title = "PyOpenGL Example 1"):
        # Init
        wx.Frame.__init__(
                self, parent, id, title, size = (400,200),
                style = wx.DEFAULT_FRAME_STYLE | wx.NO_FULL_REPAINT_ON_RESIZE
        )

        # TextCtrl
        # self.control = wx.TextCtrl(self, -1, style = wx.TE_MULTILINE)
        
        #self.control = ConeCanvas(self)
        
        self.control = glCanvas(self)

        # Show
        self.Show(True)

    def OnAbout(self,event):
        message = "Using PyOpenGL in wxPython"
        caption = "About PyOpenGL Example"
        wx.MessageBox(message, caption, wx.OK)

    def OnExit(self,event):
        self.Close(True)  # Close the frame.

app = wx.PySimpleApp()
frame = MainWindow()
app.MainLoop()

# destroying the objects, so that this script works more than once in IDLEdieses Beispiel
del frame
del app
