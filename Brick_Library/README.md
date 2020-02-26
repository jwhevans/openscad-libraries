# openscad-libraries
## Brick_Library

This file contains OpenSCAD <http://www.openscad.org> modules that create 3D models of LEGO(R) compatible bricks.

**brick(LEN=4, WID=2, HGT=3, COL="grey")**

Use this module to create a basic rectangular brick. The default is a grey brick 4x2x3 units. Pass other parameters to create different sizes of brick.  A basic LEN or WID unit is 8 mm. A basic HGT unit is 3.2 mm.

**brick_90(LEN=4, WID=1, COL=grey)**

Use this module to create a brick with connectors on the top and side. The default brick with 90 deg attachment points a grey brick 4x1x3 units. This brick is always 3 units high, or 9.6 mm. 90 deg connections are only attached to one side.

**move_brick(x=0, y=0, z=0)**

This helper function moves a brick in the x, y or z access by "brick" units e.g. 1, 2, 3... It is a little easier than keeping up with the actual mm movements.

**xmove_brick(x=0), ymove_brick(y=0), zmove_brick(z=0)**

These helper functions perform the same task as move_brick() but are only used in one direction at a time.
