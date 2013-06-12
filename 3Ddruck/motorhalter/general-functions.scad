//openscad settings
$fn=100;

// M
// Measurements of the Kopter(cm):
// M
//radius of the balloon
outer_radius = 70/2;
//thickness of carbon ring
thickness = 0.1;
//height of the carbon ring (= width of carbon band)
height = 1;  // 0.94 measured
//rotor radius
rotor = 4.1;

// motor holder parameters

//M
//motor measurements
//M
motor_height = 0.55;
motor_radius = 0.5 * 0.32;
motor_drill = 0.25;
motor_wires = 0.45;
wire_cutout = motor_height - motor_drill;

// P
//parameters for motor ring
// P
ring_thickness = 0.3;
//angle covered by one motor holder
angle= 15;
//factor for increasing thickness of rail
rail_strength = 0.1;
//radius of arms holding motors
arm_strength = 0.4;
//distance for rotors needs to include motor_radius and ring_thickness
//to make sure the motor ring is where the arms meet
rotor_r = rotor + motor_radius + ring_thickness;

// C
// calculation of lengths, angles for motor arms
// C
betta = 90 - angle/2;   			//angle = alpha
be = cos(betta) * outer_radius;	//outer_radius = r_Kopter
fe = outer_radius * (1 -cos(angle/2));
ce = rotor_r + fe; //
bc = sqrt(ce*ce + be*be);
gamma = atan(be/ce);
length = bc + 4*arm_strength;  
//add arm_strength so arms completely intercect with large circle
delta_h= arm_strength/(sin(gamma)); 


//M
//Screw Measurements
//M
//M2 screw, for better hold decrease slightly
screw_diameter = 0.2;
//smalles diameter of nut
nut = 0.4;


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
