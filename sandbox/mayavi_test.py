from enthought.tvtk.api import tvtk
cs = tvtk.CylinderSource(resolution=36)
m = tvtk.PolyDataMapper(input=cs.output)
p = tvtk.Property(representation='s')
a = tvtk.Actor(mapper=m, property=p)

cs2 = tvtk.CylinderSource(resolution=36)
m2 = tvtk.PolyDataMapper(input=cs2.output)
p2 = tvtk.Property(representation='w')
a2 = tvtk.Actor(mapper=m2, property=p2)


from enthought.tvtk.tools import ivtk
v = ivtk.viewer()
v.scene.add_actors((a, a2))





