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


$fn = 80;
//variables
OuterRadius = 8;
InnerRadius = 8;
BearingInnerRadius = 8/2;
BearingOuterRadius = 22/2;
BearingHeight = 7;
SpoolHeight = 30;
RingHeight = 1.5;
BoarderThickness = 3;
RopeRadius = 0.8;
Tolerance = 0.1;


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
        mainRoll();
        //hole
        bearingHole();
        translate([0,0,SpoolHeight/2+BoarderThickness])
            rotate([90,0,0])
                ropeHole();
        
    }
    //bearing holder
            

    translate([0,0,SpoolHeight+2*BoarderThickness])    bearingInnerPart();
       
}
module mainRoll()
{
    rollBoarder();
    translate([0,0,BoarderThickness])
        chamferCylinder(height = SpoolHeight, radius = InnerRadius, chamferHeight =-OuterRadius, chamferHeight2= -OuterRadius, angle = 0, quality = 0.5);
    translate([0,0,SpoolHeight+BoarderThickness])
        rollBoarder();
}    
    

module mainHolder()
{
    //spoolHolder
    //electric holder
    //Endstop
}

module rollBoarder()
{
    cylinder(BoarderThickness, 2* OuterRadius, 2*OuterRadius);
}

module bearingInnerPart()
{
    cylinder(BearingHeight, BearingInnerRadius-Tolerance, BearingInnerRadius);
    cylinder(2,BearingInnerRadius+1,BearingInnerRadius+1);
}

module bearingHole()
{
    cylinder(BearingHeight+Tolerance, BearingOuterRadius+Tolerance, BearingOuterRadius+Tolerance);
    translate([0,0,BearingHeight])
        cylinder(BearingHeight, BearingOuterRadius+Tolerance, BearingInnerRadius+Tolerance);
}

module ropeHole()
{
    chamferCylinder(height = InnerRadius, radius = RopeRadius, chamferHeight =0, chamferHeight2=-1, angle = 0, quality = 0.5);
    translate([0,0,-InnerRadius])
        cylinder(InnerRadius,RopeRadius*2,RopeRadius*2);
}
