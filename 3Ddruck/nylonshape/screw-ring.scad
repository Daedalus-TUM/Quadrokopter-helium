include <parameters-nylonshape.scad>;

module screw_ring(screw_diameter, nut, nut_l, ring_strength, rail_strength, diameter)
{
	difference()
	{
	cylinder(h= ring_strength, r= nut_l/2 + 2*rail_strength + diameter);

	cylinder(h= ring_strength, r= screw_diameter/2);
	}
}


screw_ring(screw_diameter, nut, nut_l, ring_strength, rail_strength, diameter, $fn = 50);