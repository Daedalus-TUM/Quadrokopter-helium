include <general-functions.scad>;

module motor_arm(outer_radius, rotor_r, arm_strength, angle)
//add motor arms to circle at given radius
//circle goes through (0,0,0)
//angle between arms is calculated so they mark the area of the circle,
//given by the angle in the variables
{
	translate([0,0,rotor_r])
	rotate([180,0,0])
	v_arms(outer_radius, rotor_r, arm_strength, angle);
}


module v_arms(outer_radius, rotor_r, arm_strength, angle)
//construct right angles, lengths for motor arms
{
	betta = 90 - angle/2;
	b = cos(betta) * outer_radius;
	c = sqrt(b*b + rotor_r*rotor_r);
	gamma = atan(b/rotor_r);
	length = c + arm_strength;
	rotate ([0,gamma,0])cylinder(h = length, r= arm_strength);
	rotate ([0,-gamma,0])cylinder(h = length, r= arm_strength);
}


//v_arms(outer_radius, rotor_r, arm_strength, angle);
motor_arm(outer_radius, rotor_r, arm_strength, angle);
rotate([90,0,0])
translate([0, -outer_radius, -3])
cylinder(h = 6, r= outer_radius);