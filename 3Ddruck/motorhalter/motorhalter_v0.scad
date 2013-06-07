include <general-functions.scad>;
use <u-rail.scad>;
use <kopter-ring.scad>;
use <kopter-arm.scad>;

//x, y plane where the printer head moves
// z > 0 !!!
// in cm

color("Khaki") kopter_ring(outer_radius, thickness, height);
color("Blue") u_rail(angle, outer_radius, thickness, height, strength);