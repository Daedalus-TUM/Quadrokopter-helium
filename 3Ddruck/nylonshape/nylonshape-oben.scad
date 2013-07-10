include <parameters-nylonshape-oben.scad>;
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

			//screwholder(screw_diameter, nut, nut_l, ring_strength, rail_strength, diameter,distance);					

		}
	
		//move to positive z-axis values
		translate([0,0,diameter/2 + rail_strength])
		x_cutout(diameter, length, angle, rail_strength);
	}
}




//screwholder(screw_diameter, nut, nut_l, ring_strength, rail_strength, diameter,distance);
//cutout_screwholder(ring_strength, nut_l, distance);:w:
//nylonshape(screw_diameter, nut, nut_l, ring_strength, rail_strength, diameter, length, angle);

translate([15,15,0])
rotate([0,0,90])
nylonshape(screw_diameter, nut, nut_l, ring_strength, rail_strength, diameter, length, angle);

translate([-15,-15,0])
rotate([0,0,90])
nylonshape(screw_diameter, nut, nut_l, ring_strength, rail_strength, diameter, length, angle);

translate([-15,15,0])
rotate([0,0,90])
nylonshape(screw_diameter, nut, nut_l, ring_strength, rail_strength, diameter, length, angle);

translate([15,-15,0])
rotate([0,0,90])
nylonshape(screw_diameter, nut, nut_l, ring_strength, rail_strength, diameter, length, angle);#

translate([0,0,0])
rotate([0,0,90])
nylonshape(screw_diameter, nut, nut_l, ring_strength, rail_strength, diameter, length, angle);



