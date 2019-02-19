//Watschelfrosch
$fn = 60;
cyl_lenght = 100;
wood_diameter = 9.8; //incl. toleranze, wood has 9.4
cyl_thickness = 4;

difference()
{
    union()
    {
        translate([0,0,cyl_lenght])
            cylinder(d1=wood_diameter+2*cyl_thickness, d2=wood_diameter+3, h=5);
        cylinder(d=wood_diameter+2*cyl_thickness, h=cyl_lenght);
        translate([0,0,-5])
        cylinder(d2=wood_diameter+2*cyl_thickness, d1=wood_diameter+3, h=5);
    }
    translate([0,0,-20])
        cylinder(d=wood_diameter, h=cyl_lenght*2);
}