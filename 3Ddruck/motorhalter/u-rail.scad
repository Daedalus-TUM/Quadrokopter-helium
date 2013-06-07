include <general-functions.scad>;

u_rail(angle, outer_radius, thickness, height, strength);


module u_shape(thickness, height, strength)
{
	polygon(points=[[0,0], [thickness+2*strength,0], [thickness+2*strength, height+strength], [thickness+strength, height+strength], [thickness+strength, strength], [strength, strength],[strength, strength+height], [0, strength+height]], paths=[[0,1,2,3,4,5,6,7]]);
}

module u_rail(angle, outer_radius, thickness, height, strength)
{
	partial_rotate_extrude(angle, outer_radius, 10, $fn=200)u_shape(thickness, height, strength);
}


//from: http://www.thingiverse.com/thing:34027
module pie_slice(radius, angle, step) {
for(theta = [0:step:angle-step]) {
rotate([0,0,0]) linear_extrude(height = radius*2, center=true)
polygon( points = [[0,0],[radius * cos(theta+step) ,radius * sin(theta+step)],[radius*cos(theta),radius*sin(theta)]]);
}}

//from: http://www.thingiverse.com/thing:34027
module partial_rotate_extrude(angle, radius, convex) {
intersection () {
rotate_extrude(convexity=convex) translate([radius,0,0]) child(0);
pie_slice(radius*2, angle, angle/5);
}} 
