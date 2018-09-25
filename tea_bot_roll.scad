//---------------------------------------------------------------------------------------------
//-- Tea Bot roll
//-- (c) Martin Korinek	m.ko@inode.at
//-- 2018
//---------------------------------------------------------------------------------------------
//--
//---------------------------------------------------------------------------------------------
//includes
include <Chamfers-for-OpenSCAD/Chamfer.scad>;
include <openscad_libraries/text_on.scad>;

//variables
OuterRadius = 20;
InnerRadius = 8;
BearingInnerRadius = 8/2;
BearingOuterRadius = 22/2;
BearingHeight = 7;
SpoolHeight = 60;
RingHeight = 1.5;
FloorThickness = 3;
Tolerance = 0.1;
FamilyLetters =["N","K","D","M"];

//###########
//top level
spool();
//###########

//modules
//Outer shell


module spool()
{
    difference()
    {
        //mainpart
        chamferCylinder(height = SpoolHeight, radius = OuterRadius, chamferHeight =-OuterRadius, chamferHeight2= -OuterRadius, angle = 0, quality = 0.5);
        //hole
        bearingHole();
    }
    //bearing holder
    translate([0,0,SpoolHeight])    bearingInnerPart();
       
}


module mainHolder()
{
    //spoolHolder
    //electric holder
    //Endstop
}

module bearingInnerPart()
{
    cylinder(BearingHeight, BearingInnerRadius-Tolerance, BearingInnerRadius-Tolerance);
}

module bearingHole()
{
    cylinder(BearingHeight, BearingOuterRadius+Tolerance, BearingOuterRadius+Tolerance);
}


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