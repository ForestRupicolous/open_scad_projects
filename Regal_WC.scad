// Shelf side bracket with 2 screws
// Adapt to size
// by Martin Korinek
// Oct. 2020

$fn = 12; 
bracket_size = 40;
bracket_width = 180;
bracket_thickness = 1; //measured from a circle e.g. 

difference()
{
    cube([bracket_size,bracket_width,bracket_size]);
    translate([bracket_size+bracket_thickness,0,bracket_size+bracket_thickness]) 
        rotate([-90,0,0]) 
            cylinder(h=bracket_width,r=bracket_size);
    //screw hole #1
    translate([bracket_size/2,bracket_width/8,2]) screw_hole();
    //screw hole #2
    translate([bracket_size/2,bracket_width-bracket_width/8,2]) screw_hole();
}



module screw_hole()
{   
    $fn =120; 
    screw_diameter = 3.8;
    head_diameter = 7;
    
    translate([0,0,head_diameter/2-0.5])
        cylinder(h=100, d1=head_diameter+0.02, d2=head_diameter+0.02);
    translate([0,0,-0.5])cylinder(h=head_diameter/2, d1=0, d2=head_diameter+0.02);
    translate([0,0,-18])cylinder(h=20, d=screw_diameter);
}