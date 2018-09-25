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


$fn = 100;
//variables
OuterRadius = 12;
InnerRadius = 8;
BearingInnerRadius = 8/2;
BearingOuterRadius = 22/2;
BearingHeight = 7;
SpoolHeight = 40;
RingHeight = 1.5;
FloorThickness = 3;
RopeRadius = 0.8;
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
        chamferCylinder(height = SpoolHeight, radius = InnerRadius, chamferHeight =-OuterRadius, chamferHeight2= -OuterRadius, angle = 0, quality = 0.5);
        //hole
        bearingHole();
        translate([0,0,SpoolHeight/2])
            rotate([90,0,0])
                ropeHole();
        
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
    cylinder(BearingHeight, BearingInnerRadius-Tolerance, BearingInnerRadius);
    cylinder(2,BearingInnerRadius+1,BearingInnerRadius+1);
}

module bearingHole()
{
    cylinder(BearingHeight, BearingOuterRadius+Tolerance, BearingOuterRadius+Tolerance);
    translate([0,0,BearingHeight])
        cylinder(BearingHeight, BearingOuterRadius+Tolerance, BearingInnerRadius+Tolerance);
}

module ropeHole()
{
    chamferCylinder(height = InnerRadius, radius = RopeRadius, chamferHeight =0, chamferHeight2=-1, angle = 0, quality = 0.5);
    translate([0,0,-InnerRadius])
        cylinder(InnerRadius,RopeRadius*2,RopeRadius*2);
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