include <general-functions.scad>;
use <u-rail.scad>;
use <kopter-ring.scad>;
use <motor-arm.scad>;

//x, y plane where the printer head moves
// z > 0 !!!
// in cm

translate([0,0,strength])kopter_ring(outer_radius, thickness, height);

//rail

//add some safetyparameter to heigt, so rail goes over carbon ring
rail_height = height + 0.1;
//add safetyparameter to thickness
rail_thickness = thickness + 0.2;
//rail has its inner radius as parameter
rail_i_radius = outer_radius - thickness/2 - rail_strength;


//union(){
	rotate([0,0,-angle/2])
	u_rail(angle, rail_i_radius, thickness, rail_height, rail_strength);

	translate([outer_radius+thickness/2 + rail_strength, 0, height/2])
	rotate([90, 0, 90])
	motor_arm(outer_radius, rotor_r, arm_strength, angle);
//}
