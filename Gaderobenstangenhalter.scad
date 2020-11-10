$fn=120;


Rod_Diameter = 28.5;
Holder_Thickness = 2;
Holder_Height = 10;
Holder_Diameter = Rod_Diameter+2*Holder_Thickness;
Base_Height = 3;
Base_Diameter = 52;

crash_rips();
difference()
{
    union()
    {
        cylinder(h=Base_Height, d1=Base_Diameter, d2=Base_Diameter-1);
        translate([0,0,Base_Height])cylinder(h=Holder_Height, d1=Holder_Diameter, d2=Holder_Diameter-2);
    }
    translate([0,0,-0.1])cylinder(h=Base_Height+Holder_Height+1, d=Rod_Diameter);
    
    
    
    translate([(Base_Diameter-Holder_Diameter)/4+Holder_Diameter/2,0,Base_Height-7/2])  screw_hole();
    rotate([0,0,120])translate([(Base_Diameter-Holder_Diameter)/4+Holder_Diameter/2,0,Base_Height-7/2])  screw_hole();
    rotate([0,0,-120])translate([(Base_Diameter-Holder_Diameter)/4+Holder_Diameter/2,0,Base_Height-7/2])  screw_hole();
}


module screw_hole()
{
    translate([0,0,7/2-0.5])cylinder(h=7/2, d1=7.02, d2=7.02);
    translate([0,0,-0.5])cylinder(h=7/2, d1=0, d2=7.02);
    translate([0,0,-18])cylinder(h=20, d=4);
}

module crash_rip()
{
    cylinder(h=Holder_Height+Base_Height, d=0.8);
}

module crash_rips()
{
    for(i = [0:5])
    {
        rotate([0,0,i*60]) translate([Rod_Diameter/2,0,0]) crash_rip();
    }
}   