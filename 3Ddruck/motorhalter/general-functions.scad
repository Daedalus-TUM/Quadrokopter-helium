// Measurements of the Kopter(cm):

//radius of the balloon
outer_radius = 70/2;
//thickness of carbon ring
thickness = 0.1;
//height of the carbon ring (= width of carbon band)
height = 1;  // 0.94 measured
//rotor radius
rotor_r = 4.1;

// motor holder parameters

//angle covered by one motor holder
angle= 15;
//factor for increasing thickness
rail_strength = 0.1;
//radius of arms holding motors
arm_strength = 0.4;

//openscad settings
$fn=100;


//from: http://www.thingiverse.com/thing:34027
module pie_slice(radius, angle, step) {
for(theta = [0:step:angle-step]) {
rotate([0,0,0]) linear_extrude(height = radius*2, center=true)
polygon( points = [[0,0],[radius * cos(theta+step) ,radius * sin(theta+step)],[radius*cos(theta),radius*sin(theta)]]);
}}

//from: http://www.thingiverse.com/thing:34027
module partial_rotate_extrude(angle, radius, convex) {
intersection () {
rotate_extrude(convexity=convex) translate([radius,0,0]) child(0);
pie_slice(radius*2, angle, angle/5);
}} 
