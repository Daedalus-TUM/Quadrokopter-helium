include <parameters-nylonhaken.scad>;

//u_rail (angle, outer_radius, thickness, height, rail_strength, rail_opening)

//module c_shape(thickness, height, strength, opening)
//{
	//newline whenever new y koordinate, x koordinate stays the same
	//(-> x changes, | y changes)
	//polygon(points=[[0,0], [height+2*strength, 0],
	//	[height+2*strength, thickness+2*strenght], [height+strenght - (height-opening)/2, thickness + 2*strength],
	//	[height+strenght - (height-opening)/2, thickness + strength], [height+strength, thickness+strength],
	//	[height+strength, thickness], [strength, thickness],
	//	[strength, thickness+strength], [strength+(height-opening)/2, thickness+strength],
	//	[strength+(height-opening)/2, thickness+2*strength
difference()
	{
	square([height+2*rail_strength, thickness+2*rail_strength]);

	translate([rail_strength, rail_strength, 0])
	square([height, thickness]);

	translate([rail_strength + (height-rail_opening)/2, thickness+rail_strength-1])  //-1: make sure cutouts interlap
	square([rail_opening, rail_strength+2]); //+2: make sure cutouts interlap
	}