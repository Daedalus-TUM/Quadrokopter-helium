include <parameters-nylonhaken.scad>;

//u_rail (angle, outer_radius, thickness, height, strength, rail_opening)

module c_shape(thickness, height, strength, railopening)
{
	difference()
	{
		square([thickness+2*strength, height+2*strength]);

		translate([strength, strength, 0])
		square([thickness, height]);

		translate([-1, strength + (height-rail_opening)/2, 0])  //-1: make sure cutouts interlap
		square([strength+2, rail_opening]); //+2: make sure cutouts interlap
	}
}

module u_rail(angle, outer_radius, thickness, height, strength)
{
	translate([-outer_radius - strength - thickness, 0, 0])
	rotate([0, 0, -angle/2])
	partial_rotate_extrude(angle, outer_radius, 15)c_shape(thickness, height, strength);
}

u_rail(rail_angle, outer_radius, thickness, height, strength);
c_shape(thickness, height, strength, opening);
