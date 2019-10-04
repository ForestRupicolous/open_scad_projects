
include <openscad_libraries/rounded_Box.scad>;

WALL_THICKNESS = 2.0;
BOX_HEIGHT = 110;
BOX_LENGHT = 110;
BOX_WIDTH = 110;
//Speaker measurements from https://www.visaton.de/en/products/fullrange-systems/fr-10-hm-8-ohm
SPEAKER_DIAMETER = 100;
SPEAKER_HEIGHT = 46;
SPEAKER_SCREW_HOLE = 116.5/2;
CORNER_RADIUS = 4;


$fn = 120;
difference()
{
    rounded_cube([BOX_WIDTH,BOX_LENGHT,BOX_HEIGHT], center=true, radius=CORNER_RADIUS);
    translate([0,0,-WALL_THICKNESS])
        rounded_cube([BOX_WIDTH-2*WALL_THICKNESS,BOX_LENGHT-2*WALL_THICKNESS,BOX_HEIGHT],center=true, radius=CORNER_RADIUS-1);
    rotate([-90,0,0])
    translate([0,-BOX_LENGHT/4,BOX_HEIGHT/2-WALL_THICKNESS-0.1])
    {
        button_array(BOX_WIDTH*5/16);
    }
    translate([0,0,BOX_HEIGHT/2-SPEAKER_HEIGHT+0.1])
        speaker();
    rotate([90,0,0])
        translate([0,-BOX_LENGHT/6,-BOX_HEIGHT/2+WALL_THICKNESS])
            nfc_reader();
}




module button()
{
    cylinder(h=20,d=24);
}

module speaker()
{
    cylinder(h=SPEAKER_HEIGHT, d2=SPEAKER_DIAMETER, d1=60);
    for(i=[0:3])
    {
        rotate([0,0,45+90*i])
        translate([SPEAKER_SCREW_HOLE,0,0])
            cylinder(h=100, d=4.8);
    }

}

module speakerbox()
{
    cube([BOX_WIDTH,WALL_THICKNESS,BOX_HEIGHT],center=true);
}

module button_array(button_space=5)
{
        translate([-button_space,0,0])
            button();
        button();
        translate([button_space,0,0])
            button();
}

module nfc_reader()
{
    cube([62,42,WALL_THICKNESS],center=true);
}