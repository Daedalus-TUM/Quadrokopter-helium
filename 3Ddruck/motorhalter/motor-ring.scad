include <general-functions.scad>;

//	rotate ([0,gamma,0])
//	cylinder(h = length, r= arm_strength);
//	translate([0, 0, delta_h])
//	rotate ([0,-gamma,0])
//	cylinder(h = length, r= arm_strength);

motor_ring(motor_radius, motor_drill, wire_cutout, ring_thickness, arm_strength);
//cut_ring();
//screw_fastener(motor_radius, ring_thickness, nut, arm_strength, motor_wires);

module motor_ring(motor_radius, motor_drill, wire_cutout, ring_thickness, arm_strength)
{
	difference()
	{
		union()
		{
		cylinder(h= 2*arm_strength, r = ring_thickness + motor_radius);
		screw_fastener(motor_radius, ring_thickness, nut, arm_strength, motor_wires);
		}

		motor_cutout(motor_radius, motor_wires, wire_cutout, arm_strength);

		cut_ring(arm_strength);
	}
}

module motor_cutout(motor_radius, motor_wires, wire_cutout, arm_strength)
{
	translate([0, 0, -0.1])
	cylinder(h= 10* arm_strength + 0.2, r= motor_radius);
	//cutout for wires
	translate([0, 0, 2*arm_strength - wire_cutout])
	rotate([0, 90, 0])
	linear_extrude(height = wire_cutout, center = false, convexity = 10, twist = 0)
	translate([-2*motor_radius, -motor_radius, 0])
	square(2*motor_radius);
}

module cut_ring(arm_strength)
{
	translate([0, -0.5, -5])
	linear_extrude(height = 20, center = false, convexity = 10, twist = 0)
	square([20, 1]);
}	

module screw_fastener(motor_radius, ring_thickness, nut, arm_strength, motor_wires)
{
	//thickness of motor ring where motor wires go:
	wire_ring = ring_thickness - motor_wires + 2*motor_radius; 
	difference()
	{
		rotate([90, 0, 0])
		translate([motor_radius+ring_thickness+nut/2, arm_strength, -1.5]) 
		cylinder (h= 3, r= nut/2 + wire_ring, center= false);  //nut is a diameter

		rotate([90, 0, 0])
		translate([motor_radius+ring_thickness+nut/2, arm_strength, -1.5]) 
		cylinder (h= 3, r= screw_diameter/2, center= false);  
	}
}