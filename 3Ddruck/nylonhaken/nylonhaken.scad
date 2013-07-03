include <parameters-nylonhaken.scad>;
use <u-rail-nylonhaken.scad>;
use <haken-nylonhaken.scad>;

translate([-strength, 0, 0])
c_shape(thickness, height, strength, rail_opening);

module hook_shape
{
	translate([-hook_diameter/2 - strength, (height-rail_opening)/2 +strength, 0])
	rotate(a=[0,180,0]) 
	{ 
		haken(strength, hook_diameter, hook_opening);
	}
}