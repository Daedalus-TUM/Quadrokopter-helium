include <parameters-nylonhaken.scad>;
use <u-rail-nylonhaken.scad>;
use <haken-nylonhaken.scad>;



module hook_shape(strength, hook_diameter, hook_opening, height, rail_opening, thickness)
{
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

hook_shape(strength, hook_diameter, hook_opening, height, rail_opening, thickness);