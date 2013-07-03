include <parameters-nylonshape.scad>;

module screwholder(screw_diameter, nut, nut_l, ring_strength, rail_strength, diameter,distance)
{	
	difference()
	{


		translate([0,0,ring_strength/2])
		cube([nut_l, 2*distance + nut_l, ring_strength], center=true);

		translate([0,distance,0])	
		cylinder(h= ring_strength, r= screw_diameter/2, $fn=50);

		translate([0,- distance,0])	
		cylinder(h= ring_strength +2, r= screw_diameter/2, $fn=50);

	}
}


screwholder(screw_diameter, nut, nut_l, ring_strength, rail_strength, diameter,distance);