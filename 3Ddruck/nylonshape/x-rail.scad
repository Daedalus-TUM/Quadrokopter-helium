include <parameters-nylonshape.scad>;

module x_cutout(diameter, length, angle)
{
	union()
	{
		rotate([90,0,angle/2])
		cylinder(r=diameter/2, h=length*2, center=true, $fn = 50);

		rotate([90,0,-angle/2])
		cylinder(r=diameter/2, h=length*2, center=true, $fn = 50);
	}

}


module x_rails(diameter, length, angle, rail_strength)
{
	union()
	{
		rotate([90,0,angle/2])
		cylinder(r=diameter/2 + rail_strength, h=length, center=true, $fn = 50);

		rotate([90,0,-angle/2])
		cylinder(r=diameter/2 + rail_strength, h=length, center=true, $fn = 50);
	}

}


difference()
{
	x_rails(diameter, length, angle, rail_strength);
	x_cutout(diameter, length, angle, rail_strength);
}