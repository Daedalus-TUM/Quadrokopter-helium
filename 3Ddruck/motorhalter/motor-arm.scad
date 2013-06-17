include <general-functions.scad>;

module motor_arm(rotor_r, outer_radius, fe, gamma, length, arm_strength)
//add motor arms to circle at given radius
//circle goes through (0,0,0)
//angle between arms is calculated so they mark the area of the circle,
//given by the angle in the variables
{
	difference()
	{
		translate([0,0,rotor_r])
		rotate([180,0,0])
 		v_arms(delta_h, gamma, length, arm_strength);
		rotate([90,0,0])
		translate([0, -outer_radius-1, -30])
		//translate a bit further to make sure part connects well with other parts
		cylinder(h = 60, r= outer_radius);
	}
}


module v_arms_round(delta_h, gamma, length, arm_strength)
//construct round part of motor arms with correct angles, lenths
{

 	translate([0, 0, delta_h])
	rotate ([0,gamma,0])
	cylinder(h = length, r= arm_strength);

	translate([0, 0, delta_h])
	rotate ([0,-gamma,0])
	cylinder(h = length, r= arm_strength);
}

module v_arms_square(delta_h, gamma, length, arm_strength)

//construct square part of motor arms with correct angles, lenths
{

	rotate ([0,gamma,0])
 	translate([-2*arm_strength, 0, 0.75*delta_h])  //factor 0.75 is jsut an estimate...
	linear_extrude(height = length, center = false, convexity = 10, twist = 0)
	square([2* arm_strength, arm_strength]);

	rotate ([0,-gamma,0])
	translate([0, 0, 0.75*delta_h])   //factor 0.75 is jsut an estimate...
	linear_extrude(height = length, center = false, convexity = 10, twist = 0)
	square([2* arm_strength, arm_strength]);
}


module v_arms(delta_h, gamma, length, arm_strength)
//put round and square arms together
{
	union()
	{
		v_arms_round(delta_h, gamma, length, arm_strength);
		v_arms_square(delta_h, gamma, length, arm_strength);
	}
}


//v_arms(delta_h, gamma, length, arm_strength);
motor_arm(rotor_r, outer_radius, fe, gamma, length, arm_strength);
