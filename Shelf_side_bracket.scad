// Shelf side bracket with 2 screws
// Feel free to adapt to size
// by Martin Korinek
// Oct. 2020

//Number of fragments, used for different styles, not used for screw holes
$fn = 120; //[4:45°,6:Asymmetrical-flat,8:Asymmetrical,10:Asymmetrical 3-faced,12:Symmetrical 3-faced,24:Stepped,120:Round,360:Round High Res]
//Height on wall, width under board, currently only square profile implemented
bracket_size = 40; // [10:100]
//Bracket width, tested with 180 mm length, longer might need additional screws
bracket_width = 180; // [50:300]
//Thinnest part, measured from a circle e.g. $fn120
bracket_thickness = 1; // [100]
//Inner hole diameter
screw_diameter = 3.8;
//Screw head diameter for flush countersunk screw
head_diameter = 7;

difference()
{
    cube([bracket_size,bracket_width,bracket_size]);
    translate([bracket_size+bracket_thickness,0,bracket_size+bracket_thickness]) 
        rotate([-90,0,0]) 
            cylinder(h=bracket_width,r=bracket_size);
    //screw hole #1
    translate([bracket_size/2,bracket_width/8,2]) screw_hole(screw_diameter,head_diameter);
    //screw hole #2
    translate([bracket_size/2,bracket_width-bracket_width/8,2]) screw_hole(screw_diameter,head_diameter);
}

module screw_hole(screw_diameter = 3.8,head_diameter = 7)
{   
    $fn =120; 
    
    translate([0,0,head_diameter/2-0.5])
        cylinder(h=100, d1=head_diameter+0.02, d2=head_diameter+0.02);
    translate([0,0,-0.5])cylinder(h=head_diameter/2, d1=0, d2=head_diameter+0.02);
    translate([0,0,-18])cylinder(h=20, d=screw_diameter);
}