include <parameters-nylonhaken.scad>;

module hook_ring(strength, hook_diameter)
{
	difference()
	{
		circle(r=hook_diameter/2 + strength);
		circle(r=hook_diameter/2);
		translate([-hook_diameter/2 + -strength, -hook_diameter + -2*strength, 0])
		square(hook_diameter + 2*strength);
	}
}

module trapez_close_ring(strength, hook_opening, hook_diameter)
{
	translate([- hook_diameter/2 - strength, -hook_diameter, 0])
	square([strength, hook_diameter]);

	translate([hook_diameter/2, 0, 0])
	polygon(points=[	[0,0], 
					[strength,0], 
					[strength-hook_diameter+hook_opening, -hook_diameter], 
					[-hook_diameter + hook_opening, -hook_diameter]], paths=[[0,1,2,3]]);
}

module trapez_opening(strength, hook_opening, hook_diameter)
{
	translate([0, -2*hook_diameter, 0])
	square([strength, 2*hook_diameter]);

	translate([strength + hook_opening, 0, 0])
	polygon(points=[	[0,0], 
					[strength,0], 
					[strength+ hook_diameter, -2*hook_diameter], 
					[strength, -2*hook_diameter]], paths=[[0,1,2]]);
}

module haken(strength, hook_diameter, hook_opening)
{
	union()
	{
		hook_ring(strength, hook_diameter);

		trapez_close_ring(strength, hook_opening, hook_diameter);

		translate([-strength - hook_diameter/2, -hook_diameter, 0])
		trapez_opening(strength, hook_opening, hook_diameter);
	}
}

haken(strength, hook_diameter, hook_opening);