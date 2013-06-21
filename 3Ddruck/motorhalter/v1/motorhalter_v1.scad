include <general-functions.scad>;
use <u-rail.scad>;
use <kopter-ring.scad>;
use <motor-arm.scad>;
use <motor-ring.scad>;

//x, y plane where the printer head moves
// z > 0 !!!
// in cm

//translate([-outer_radius, 0, rail_strength])kopter_ring(outer_radius, thickness, height);

//rail

//add some safetyparameter to heigt, so rail goes over carbon ring
rail_height = height + 0.1;
//add safetyparameter to thickness
rail_thickness = thickness + 0.2;
//rails rotate around inner radius
rail_radius = outer_radius - rail_thickness;

module motorhalter(angle, heigth, outer_radius, rail_thickness, height, rail_strength, motor_radius, motor_wires, wire_cutout, arm_strength, rotor_r, outer_radius, fe, gamma, length, ring_thickness, motor_drill)
{
	union(){
		translate([rail_thickness/2, 0, 0])
		u_rail(angle, outer_radius, rail_thickness, height, rail_strength);

		difference()
		{
			translate([rail_thickness/2 + rail_strength, 0, height/2])
			rotate([90, 0, 90])
			motor_arm(rotor_r, outer_radius, fe, gamma, length, arm_strength, height);

			//translate([rotor_r - arm_strength, 0, rail_strength])
			translate([rotor_r - motor_radius - ring_thickness, 0, 0])
			motor_cutout(motor_radius, motor_wires, wire_cutout, arm_strength);
		}

		translate([rotor_r - motor_radius - ring_thickness, 0, height/2 - arm_strength])
		motor_ring(motor_radius, motor_drill, wire_cutout, ring_thickness, arm_strength);
	}
}


// cut off everything with z < 0
// translate so important parts are _not_ cut off
difference()
{
motorhalter(angle, height, outer_radius, rail_thickness, height, rail_strength, motor_radius, motor_wires, wire_cutout, arm_strength, rotor_r, outer_radius, fe, gamma, length, ring_thickness, motor_drill);

translate([0, 0, -5])
cube(size = [220, 220, 10] ,center = true);
}

//test 3d printer parameters for daedalus 3d printer
//from:http://daedalus.ei.tum.de/index.php/de/dokumentation/projekte/3d-drucker/technische-details
//cube(size = [220, 220, 130] ,center = false);
