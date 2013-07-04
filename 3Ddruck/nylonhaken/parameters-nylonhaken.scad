//openscad settings
$fn=100;

// M
// Measurements of the Kopter(mm):
// M
//radius of the balloon
outer_radius = 700/2;
//thickness of carbon ring
thickness = 1.5;
//height of the carbon ring (= width of carbon band)
// increased by 0.5mm to account for printer errors
height = 12;  // 0.94 measured, but turns out smaller when printing with 10.5
//rotor radius
//increased by 1cm from 41 to 51, to give rotors some space
rotor = 51;

// P
// Parameters of the hooks
// P

// angle of the ring covered by the rail
rail_angle = 0.5;
// opening of the rail
rail_opening = height - 3;
// strength of rail, hook
strength = 1.2;
// diameter in the hook, where nylon will go through
hook_diameter = 1;
// diameter of hook opening; nylon diameter is 0.25mm
hook_opening = 0.3;
// strength of the hook

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
