include <parameters-nylonhaken.scad>;
use <u-rail-nylonhaken.scad>;
use <haken-nylonhaken.scad>;



module hook_shape(strength, hook_diameter, hook_opening, height, rail_opening, thickness)
{
	translate([strength, 0, 0])
	difference()
	{
		union()
		{
			c_shape(thickness, height, strength, rail_opening);

			translate([-hook_diameter/2, (height-rail_opening)/2 +strength, 0])
			rotate(a=[0,180,0]) 
			{ 
				haken(strength, hook_diameter, hook_opening);
			}
		
			translate([-hook_diameter/2, (height-rail_opening)/2 +strength + rail_opening, 0])
			rotate(a=[0,0,180]) 
			{ 
				haken(strength, hook_diameter, hook_opening);
			}
	
		}

	translate([-1, -2*strength -thickness -2, 0])
	square(2*strength + thickness +2);   //+2 for some overlap in xdirections

	translate([-1, height + 2*strength, 0])
	square(2*strength + thickness+2);   //+2 for some overlap in xdirections
	}
}


module u_rail(rail_angle, outer_radius, thickness, height, strength, hook_diameter, hook_opening, rail_opening, thickness)
{
    translate([-outer_radius - strength - thickness, 0, 0])
    rotate([90, 0, 0])
    partial_rotate_extrude(rail_angle, outer_radius, 15)hook_shape(strength, hook_diameter, hook_opening, height, rail_opening, thickness);
}




hook_shape(strength, hook_diameter, hook_opening, height, rail_opening, thickness);
u_rail(rail_angle, outer_radius, thickness, height, strength);
//partial_rotate_extrude(rail_angle, outer_radius, 15)hook_shape(strength, hook_diameter, hook_opening, height, rail_opening, thickness);

