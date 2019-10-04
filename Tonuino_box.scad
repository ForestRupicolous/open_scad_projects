
include <openscad_libraries/rounded_Box.scad>;

WALL_THICKNESS = 1.0;
BOX_HEIGHT = 80;
BOX_LENGHT = 160;
BOX_WIDTH = 120;
SPEAKER_DIAMETER = 100;

difference()
{
    rounded_cube([BOX_WIDTH,BOX_LENGHT,BOX_HEIGHT], center=true, radius=3);
    translate([0,0,-WALL_THICKNESS])
        rounded_cube([BOX_WIDTH-2*WALL_THICKNESS,BOX_LENGHT-2*WALL_THICKNESS,BOX_HEIGHT],center=true, radius=2);
    translate([0,-BOX_LENGHT/3,BOX_HEIGHT/2-WALL_THICKNESS-0.1])
    {
        button_array(BOX_WIDTH*5/16);
    }
    translate([0,BOX_LENGHT/7,BOX_HEIGHT/2-WALL_THICKNESS-0.1])
        speaker();
}
translate([0,-35,0])
    speakerbox();

module button()
{
    cylinder(h=20,d=24);
}

module speaker()
{
    cylinder(h=40,d=SPEAKER_DIAMETER);
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