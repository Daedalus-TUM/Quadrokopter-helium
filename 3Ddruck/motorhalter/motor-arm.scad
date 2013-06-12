include <general-functions.scad>;

module motor_arm(outer_radius, rotor_r, arm_strength, angle)
//add motor arms to circle at given radius
//circle goes through (0,0,0)
//angle between arms is calculated so they mark the area of the circle,
//given by the angle in the variables
{
	difference()
	{
		translate([0,0,rotor_r])
		rotate([180,0,0])
		v_arms(outer_radius, rotor_r, arm_strength, angle);
		rotate([90,0,0])
		translate([0, -outer_radius-0.1, -3])
		//translate a bit further to make sure part connects well with other parts
		cylinder(h = 6, r= outer_radius);
	}
}


module v_arms(outer_radius, rotor_r, arm_strength, angle)
//construct motor arms with correct angles, lenths
{

 	translate([0, 0, delta_h])
	rotate ([0,gamma,0])
	cylinder(h = length, r= arm_strength);
	translate([0, 0, delta_h])
	rotate ([0,-gamma,0])
	cylinder(h = length, r= arm_strength);
}


//v_arms(outer_radius, rotor_r, arm_strength, angle);
motor_arm(outer_radius, rotor_r, arm_strength, angle);
