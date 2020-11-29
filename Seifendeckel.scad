// Seifendeckel - Soap Cover
// by Martin Korinek
// Nov. 2020


use <openscad_libraries/rounded_Box.scad>
$fn = 60;
box_lenght = 75;
box_width = 70;

rotate([0,180,0])
    difference()
    {
        translate([0,0,15]) rounded_cube([box_width,box_lenght,30],center = true, radius=5);
        cube([70,70,10],center = true);
        translate([box_width/2,0,0]) cube([20,box_lenght,10],center = true);
        translate([-box_width/2,0,0]) cube([20,box_lenght,10],center = true);
        translate([0,0,10])rounded_cube([box_width-5,box_lenght-5,30],center = true, radius=5);
    }