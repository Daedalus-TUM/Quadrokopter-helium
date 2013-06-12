include <general-functions.scad>;
use <u-rail.scad>;
use <kopter-ring.scad>;
use <motor-arm.scad>;
use <motor-ring.scad>;

//x, y plane where the printer head moves
// z > 0 !!!
// in cm

translate([-outer_radius, 0, rail_strength])kopter_ring(outer_radius, thickness, height);

//rail

//add some safetyparameter to heigt, so rail goes over carbon ring
rail_height = height + 0.1;
//add safetyparameter to thickness
rail_thickness = thickness + 0.2;
//rails rotate around inner radius
rail_radius = outer_radius - rail_thickness;


union(){
	translate([rail_thickness/2, 0, 0])
	u_rail(angle, outer_radius, rail_thickness, rail_height, rail_strength);

	difference()
	{
		translate([rail_thickness/2 + rail_strength, 0, height/2])
		rotate([90, 0, 90])
		motor_arm(rotor_r, outer_radius, fe, gamma, length, arm_strength);

		//translate([rotor_r - arm_strength, 0, rail_strength])
		translate([rotor_r - motor_radius - ring_thickness, 0, rail_strength])
		motor_cutout(motor_radius, motor_wires, wire_cutout, arm_strength);
	}

	translate([rotor_r - motor_radius - ring_thickness, 0, rail_strength])
	motor_ring(motor_radius, motor_drill, wire_cutout, ring_thickness, arm_strength);
}

