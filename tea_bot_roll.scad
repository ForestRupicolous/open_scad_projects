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


$fn = 10; //10 for development /80
//variables
OuterRadius = 16;
InnerRadius = 8;
BearingInnerRadius = 8/2;
BearingInnerRing = 1;
BearingOuterRadius = 22/2;
BearingHeight = 7;
SpoolCore = 30;
RingHeight = 1.5;
BoarderThickness = 3;
RopeRadius = 0.8;
Tolerance = 0.1;
SpoolHeight = SpoolCore+2*BoarderThickness; //total spool hight
HolderHeight = 3*(OuterRadius+InnerRadius);
HolderWidth = 3*(OuterRadius+InnerRadius);
HolderThickness = 5;
HolderAxis= 2*(OuterRadius+InnerRadius);
BlockLenght = SpoolHeight+2*HolderThickness+2*BearingInnerRing;
BlockWidth = HolderWidth;
BlockThickness = 5;
echo(BlockLenght);
echo(BlockWidth);
//###########
//top level
//translate([HolderWidth/2,HolderThickness+BearingInnerRing,HolderAxis]) rotate([-90,0,0]) //deactivate for printing
    spool();
//spoolHolder();
//###########
//bearingAxis();
//modules
//Outer shell


module spool()
{
    difference()
    {
        //mainpart
        mainRoll();
        translate([0,0,SpoolHeight/2+BoarderThickness])
            rotate([90,0,0])
                ropeHole();
        
    }
    //bearing holders
    rotate([180,0,0])   bearingInnerPart();

    translate([0,0,SpoolHeight])    bearingInnerPart();
       
}
module mainRoll()
{
    rollBoarder();

    translate([0,0,BoarderThickness])
    {
      //  chamferCylinder(height = SpoolCore, radius = InnerRadius, chamferHeight =-OuterRadius, chamferHeight2= -OuterRadius, angle = 0, quality = 0.5);
        cylinder(h = SpoolCore/3, r1=OuterRadius, r2=InnerRadius);
    translate([0,0,SpoolCore/3])
        cylinder(h = SpoolCore/3, r1=InnerRadius, r2=InnerRadius);
    translate([0,0,2*SpoolCore/3])
        cylinder(h = SpoolCore/3, r1=InnerRadius, r2=OuterRadius);
    }
    translate([0,0,SpoolCore+BoarderThickness])
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
    cylinder(BoarderThickness, OuterRadius, OuterRadius);
}

module bearingInnerPart()
{
    cylinder(BearingHeight+BearingInnerRing, BearingInnerRadius, BearingInnerRadius);
    cylinder(BearingInnerRing,BearingInnerRadius+1,BearingInnerRadius+1);
}

module bearingHole()
{
    cylinder(BearingHeight+Tolerance, BearingOuterRadius+Tolerance, BearingOuterRadius+Tolerance);
    translate([0,0,BearingHeight])
        cylinder(BearingHeight/4, BearingOuterRadius+Tolerance, BearingInnerRadius+Tolerance);
}

module ropeHole()
{
    chamferCylinder(height = InnerRadius, radius = RopeRadius, chamferHeight =0, chamferHeight2=-1, angle = 0, quality = 0.5);
    translate([0,0,-InnerRadius])
        cylinder(InnerRadius,RopeRadius*2,RopeRadius*2);
}

module spoolHolder()
{
    //Mounting block
    mountingBlock();
    difference()
    {
        holderBlock();
        translate([HolderWidth/2, -0.01, HolderAxis])
            rotate([-90,0,0])
                bearingHole();
    }
    translate([0,SpoolHeight+HolderThickness+2*BearingInnerRing,0])
        difference()
        {
            holderBlock();
            translate([HolderWidth/2, -0.01, HolderAxis])
                rotate([-90,0,0])
                    bearingHole();
        }
    //Bearing Hole
    //InnerBearing
    //Motor Hole
}

module bearingAxis()
{
    cylinder(HolderThickness-1,BearingInnerRadius+2,BearingInnerRadius+1);
    cylinder(HolderThickness,BearingInnerRadius+1,BearingInnerRadius+1);
    translate([0, 0, HolderThickness])
        bearingInnerPart();
    translate([0,0,-5])
        cylinder(5,BearingInnerRadius+2,BearingInnerRadius+2);

}

module mountingBlock()
 {
     chamferCube(BlockWidth, BlockLenght, BlockThickness);
 }

 module holderBlock()
 {
     chamferCube(HolderWidth, HolderThickness, HolderHeight);
 } 
 
