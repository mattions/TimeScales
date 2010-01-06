'''A Line Drawing routine that outputs your efforts to IDLE window as a ready
to execute Vpython instruction.
The program re-runs after quiting so that you can draw multiple, independent objects.

Note:
    Program does not rely on Default scene object.
    Instead, it Instantiates a new display object everytime, so that userzoom and userspin
    inputs from previous times are completely removed from the New scene!

Controls:
    Intuitive mouse interaction:
        Left Mouse key point, click and drag lines into existence.
        Right Mouse key will Disconnect the drawing process so you can draw
        separate objects.
    
    delete key: to remove last line or object
    x key:      to exit and save
    esc key:    to end
'''

from visual import *

__copywrite__ = 'Basics_0 - (\xa9) Symion 2009'
__all__ = ['Startup', 'Graphic', 'MakeLine', 'LineChange',
           'LineView', 'Main', 'Output', 'Close']

class drawthing:
    def __init__(self):
        self.version = 1.0
        self.work = list()

    def Startup(self,x=0, y=0,
                width = 600, height = 600,
                title = __copywrite__,
                autoscale = False, range = 10,
                userzoom = False, userspin = False,
                show_rendertime = True,
                up = vector(0,-1,0),
                forward = vector(0, 0, -1),
                background = (1,1,1),
                foreground = (0,0,0),
                visible = False):
        '''Instantiation of scene'''
        self.scene = display(x=x, y=y,
                             width = width, height = height,
                             title = title,
                             autoscale = autoscale, range = range,
                             userzoom = userzoom, userspin = userspin,
                             show_rendertime = show_rendertime,
                             up = up,
                             forward = forward,
                             background = background,
                             foreground = foreground,
                             visible = visible)
    
    def Graphic(self):
        '''Display any resident objects (if any)'''
        # Cross hair
        curve(pos=array([(-0.10309,-2.44012,0.0),
                         (-0.10309,-0.99667,0.0)]),
              color=(0.0,0.0,0.0))
        curve(pos=array([(-0.10309,-0.48115,0.0),
                         (-0.10309,0.89356,0.0)]),
              color=(0.0,0.0,0.0))
        curve(pos=array([(0.13745,-0.75609,0.0),
                         (1.51200,-0.75609,0.0)]),
              color=(0.0,0.0,0.0))
        curve(pos=array([(-0.37800,-0.75609,0.0),
                         (-1.68382,-0.75609,0.0)]),
              color=(0.0,0.0,0.0))
        # Border
        curve(pos=array([(9.93115,-9.58867,0.0),
                         (-9.93115,-9.58867,0.0),
                         (-9.93115,9.63741,0.0),
                         (9.93115,9.63741,0.0),
                         (9.93115,-9.58867,0.0)]),
              color=(0.0,0.0,1.0))
        self.scene.visible = True

    def MakeLine(self,x,y,c):
        '''A line object: vector(x),vector(y),color'''
        self.work.append(curve(pos=((x,y)),color=c))

    def LineChange(self,a,x,c):
        '''Change existing line object[a], vector(x), color'''
        self.work[a].pos[-1] = x
        self.work[a].color = c
    
    def LineView(self,a):
        '''Line On/Off'''
        self.work[a].visible = (self.work[a].visible == False)
    
    def Main(self):
        '''Main user input'''
        draw = False
        new = True
        n = 0
        while 1:
            rate(50)
            if self.scene.mouse.events>0:
                mk = self.scene.mouse.getevent()
                if mk.press == 'left':
                    draw = True
                    if new == True:
                        self.MakeLine(self.scene.mouse.pos,self.scene.mouse.pos,(1,0,0))
                        new = False
                    else:
                        self.work[n].append(self.scene.mouse.pos)
                elif mk.release == 'left':
                    draw = False
                    self.LineChange(n,self.scene.mouse.pos,(0,0,0))
                elif mk.press == 'right':
                    if new == False:
                        n+=1
                        new = True
            elif self.scene.kb.keys>0:
                km = self.scene.kb.getkey()
                if km == 'x':
                    break
                elif km == 'delete':
                    n = len(self.work)
                    if n>0:
                        n-=1
                        self.work[n].visible = False
                        self.work.pop(n)
                        draw = False
                        new = True
            if draw:
                self.LineChange(n,self.scene.mouse.pos,(1,0,0))

    def Output(self):
        '''Display results as Vpython commands'''
        if self.work:
            for a in self.work:
                k = '%s(pos=array([' %(a.__class__.__name__)
                for b in a.pos:
                    k+= '(%0.5f,%0.5f,%0.5f),' %(tuple(b))
                k = k[:-1] + ']), color=(%0.3f,%0.3f,%0.3f))\n' %(tuple(a.color[0]))
                # Ready to output to file or IDLE window
                print k
    
    def Close(self):
        '''Nice and clean'''
        if self.work:
            for a in self.work:
                a.visible = False
        del self.work
        if self.scene.objects:
            for a in self.scene.objects:
                a.visible = False
        self.scene.visible = False
    
if __name__=='__main__':
    print '%s\n\n%s' %(__copywrite__, __doc__)
    # Repeat process
    while 1:
        program = drawthing()
        program.Startup(userzoom=True)
        program.Graphic()
        program.Main()
        program.Output()
        program.Close()
