include <general-functions.scad>;

//	rotate ([0,gamma,0])
//	cylinder(h = length, r= arm_strength);
//	translate([0, 0, delta_h])
//	rotate ([0,-gamma,0])
//	cylinder(h = length, r= arm_strength);

motor_ring(motor_radius, motor_drill, wire_cutout, ring_thickness, arm_strength);
//cut_ring();

module motor_ring(motor_radius, motor_drill, wire_cutout, ring_thickness, arm_strength)
{
	difference()
	{
		cylinder(h= 2*arm_strength, r = ring_thickness + motor_radius);
		motor_cutout(motor_radius, motor_wires, wire_cutout, arm_strength);
		cut_ring();
	}
}

module motor_cutout(motor_radius, motor_wires, wire_cutout, arm_strength)
{
	translate([0, 0, -0.1])
	cylinder(h= 2* arm_strength + 0.2, r= motor_radius);
	//cutout for wires
	translate([0, 0, 2*arm_strength - wire_cutout])
	rotate([0, 90, 0])
	linear_extrude(height = wire_cutout, center = false, convexity = 10, twist = 0)
	translate([-2*motor_radius, -motor_radius, 0])
	square(2*motor_radius);
}

module cut_ring()
{
	translate([0, -0.05, 0])
	linear_extrude(height = 2* arm_strength + 0.2, center = false, convexity = 10, twist = 0)
	translate([0, 0, 0])
	square([3*arm_strength, 0.1]);
}	

//module screw_closer()
//{

//}