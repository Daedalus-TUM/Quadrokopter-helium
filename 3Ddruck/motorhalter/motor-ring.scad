include <general-functions.scad>;

//	rotate ([0,gamma,0])
//	cylinder(h = length, r= arm_strength);
//	translate([0, 0, delta_h])
//	rotate ([0,-gamma,0])
//	cylinder(h = length, r= arm_strength);

difference()
{
	cylinder(h= motor_height, r = ring_thickness + motor_radius);
	motor_cutout(motor_height, motor_radius, motor_wires, motor_drill);
}

module motor_cutout(motor_height, motor_radius, motor_wires, motor_drill)
{
	cylinder(h= motor_height, r= motor_radius);
	//cutout for wires
	translate([0, 0, motor_drill])
	rotate([0, 90, 0])
	linear_extrude(height = motor_wires - motor_radius, center = false, convexity = 10, twist = 0)
	translate([-2*motor_radius, -motor_radius, 0])
	square(2*motor_radius);
}