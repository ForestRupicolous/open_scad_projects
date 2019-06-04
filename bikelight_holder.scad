//holder for usb bike light
// Idea:
//But light in, fit ruber through slot to fixiate light

LIGHT_OUTER_DIAMETER = 40.2;
LIGHT_HEIGHT = 15.8;
THICKNESS = 2;
HOLDER_HEIGHT = 25;
RUBBER_WIDTH = 22;
RUBBER_THICKNESS = 3.2;
$fn =80;
rotate([180,0,0])
difference()
{
    cylinder(d= LIGHT_OUTER_DIAMETER+2*THICKNESS, h=HOLDER_HEIGHT);
    cylinder(d= LIGHT_OUTER_DIAMETER, h=HOLDER_HEIGHT-2);
    cylinder(d= LIGHT_OUTER_DIAMETER-2*THICKNESS, h=HOLDER_HEIGHT);
    translate([-50,-RUBBER_WIDTH/2,HOLDER_HEIGHT-THICKNESS-LIGHT_HEIGHT-RUBBER_THICKNESS])
        cube([100,RUBBER_WIDTH,RUBBER_THICKNESS]);
    
    cube([20,300,2*HOLDER_HEIGHT-2*THICKNESS],center=true);    
    translate([0,50,-10])
    rotate([90,0,0])
      cylinder(d=31,h=100);

}

    
