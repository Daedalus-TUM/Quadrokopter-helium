//openscad settings
$fn=100;

// M
// Measurements of the Kopter(mm):
// M
//radius of the balloon
outer_radius = 700/2;
//thickness of carbon ring
thickness = 1;
//height of the carbon ring (= width of carbon band)
// increased by 0.5mm to account for printer errors
height = 10.5;  // 0.94 measured
//rotor radius
//increased by 1cm from 41 to 51, to give rotors some space
rotor = 51;

// motor holder parameters

//M
//motor measurements
//M
motor_height = 5.5;
motor_radius = 0.5 * 3.8; 
//increased from 3.2 to 3.5 so motor fits with slic3r settings
//3.5 too small - let's try 3.8
motor_drill = 2.5;
motor_wires = 4.5;
wire_cutout = motor_height - motor_drill;

// P
//parameters for motor ring
// P
ring_thickness = 3;
//angle covered by one motor holder
angle= 15;
//factor for increasing thickness of rail
rail_strength = 1;
//radius of arms holding motors
arm_strength = 2;
//was 4, 3 both are strong, stable

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
screw_diameter = 2;
//smalles diameter of nut
nut = 4;


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
