//P
//Parameters for nylonrail
//P

// diameter of nylonrail
diameter = 2;
// length of nylonrail
length = 5;
// number of rails (5 corner star -> 5 rails)
number = 5;
// angle between two rails
angle = ((number-2)*180)/number;
//strength of screw rings
ring_strength = 2;
//strength of nylon rails
rail_strength = 1;


//M
//Screw Measurements
//M
//M2 screw, for better hold decrease slightly
screw_diameter = 2;
//smallest diameter of nut
nut = 4;
//largest diameter of nut
nut_l=4.5;

//P
//Parameters for screw ring placement
//P

//with center at the crossing of the two rails,
//this is the distance of the center of the screw ring:

distance = tan(angle/2) * 2 * sin(angle/2) / (rail_strength*2+diameter);
