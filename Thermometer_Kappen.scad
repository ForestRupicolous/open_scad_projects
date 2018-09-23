//---------------------------------------------------------------------------------------------
//-- Plug holder for BRAUN ThermoScan Plugs
//-- (c) Martin Korinek	m.ko@inode.at
//-- 2018
//---------------------------------------------------------------------------------------------
//--
//---------------------------------------------------------------------------------------------
//includes
include <Chamfers-for-OpenSCAD/Chamfer.scad>;
include <openscad_libraries/text_on.scad>;

//variables
OuterRadius = 14;
InnerRadius = 17.7/2;
Height = 24;
RingHeight = 1.5;
FloorThickness = 3;
FamilyLetters =["N","K","D","M"];

//###########
//top level
for (i = [0:len(FamilyLetters)-1]) //generate one plug holder for each member
{ 
   translate([i*2*(OuterRadius-0.5),0,0]) onePlug(FamilyLetters[i]);
}
//###########

//modules
//Outer shell
module outerPart(CylinderText = " ")
{
    difference()
    {
        chamferCylinder(height = Height+FloorThickness, radius = OuterRadius, chamferHeight =3, chamferHeight2= 1, angle = 0, quality = 0.5);
        text_on_cylinder(CylinderText,[0,0,0],r=OuterRadius,h=Height+FloorThickness,eastwest=25,extrusion_height=3,size=14);
        text_on_cylinder(CylinderText,[0,0,0],r=OuterRadius,h=Height+FloorThickness,eastwest=25+180,extrusion_height=3,size=14);
    }
    translate([0,0,Height+FloorThickness])
        cylinder(RingHeight, InnerRadius+0.4, InnerRadius+0.4);
    
}

//Inner cutout
module innerPart()
{
    chamferCylinder(Height+RingHeight, InnerRadius, InnerRadius, 6, 0.3,quality = 0.5);
}

//combine outer shell and inner cutout
module onePlug(Text = " ")
{
    difference()
    {
        outerPart(Text);
        translate([0, 0, FloorThickness]) 
            innerPart();
    }
}