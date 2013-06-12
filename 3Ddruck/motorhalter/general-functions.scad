//openscad settings
$fn=100;

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

//motor measurements
motor_height = 0.55;
motor_radius = 0.5 * 0.32;
motor_drill = 0.25;
motor_wires = 0.45;

//parameters for motor ring
ring_thickness = 0.3;

//angle covered by one motor holder
angle= 15;
//factor for increasing thickness
rail_strength = 0.1;
//radius of arms holding motors
arm_strength = 0.4;

// calculation of lengths, angles for motor arms
betta = 90 - angle/2;   			//angle = alpha
be = cos(betta) * outer_radius;	//outer_radius = r_Kopter
fe = outer_radius * (1 -cos(angle/2));
ce = rotor_r + fe;
bc = sqrt(ce*ce + be*be);
gamma = atan(be/ce);
length = bc + 4*arm_strength;  
//add arm_strength so arms completely intercect with large circle
delta_h= arm_strength/(sin(gamma));



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
