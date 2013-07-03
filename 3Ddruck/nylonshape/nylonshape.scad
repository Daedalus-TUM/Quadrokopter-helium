include <parameters-nylonshape.scad>;
use <x-rail.scad>;
use <screw-ring.scad>;

module nylonshape(screw_diameter, nut, nut_l, ring_strength, rail_strength, diameter, length, angle)
{
difference()
	{
		union()
		{
			//move to positive z-axis values
			translate([0,0,diameter/2 + rail_strength])
			x_rails(diameter, length, angle, rail_strength);

			screwholder(screw_diameter, nut, nut_l, ring_strength, rail_strength, diameter,distance);					

		}
	
		//move to positive z-axis values
		translate([0,0,diameter/2 + rail_strength])
		x_cutout(diameter, length, angle, rail_strength);
	}
}




//screwholder(screw_diameter, nut, nut_l, ring_strength, rail_strength, diameter,distance);
//cutout_screwholder(ring_strength, nut_l, distance);
nylonshape(screw_diameter, nut, nut_l, ring_strength, rail_strength, diameter, length, angle);
