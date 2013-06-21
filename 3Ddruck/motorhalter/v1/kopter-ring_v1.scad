include <general-functions.scad>;

module kopter_ring(outer_radius, thickness, height)
{
	inner_radius= outer_radius - thickness;
difference()
	{
		cylinder(h= height, r= outer_radius);
		// translate cutting object for clean cut
		translate([0,0,-1]) cylinder(h= height+2, r= inner_radius);
	}
}


kopter_ring(outer_radius, thickness, height);