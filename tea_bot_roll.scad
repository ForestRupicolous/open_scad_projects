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
OuterRadius = 8;
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
HolderHeight = 2*(OuterRadius+InnerRadius);
HolderWidth = 2*(OuterRadius+InnerRadius);
HolderThickness = 5;
HolderClipIn = 5;
BlockLenght = SpoolHeight+2*HolderThickness+2*BearingInnerRing;
BlockWidth = 2*(OuterRadius+InnerRadius);
BlockThickness = 5;


//###########
//top level
translate([HolderWidth/2,HolderThickness+BearingInnerRing,HolderHeight-HolderClipIn]) rotate([-90,0,0]) //deactivate for printing
        spool();
spoolHolder();
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
            

    translate([0,0,SpoolHeight])    bearingInnerPart();
       
}
module mainRoll()
{
    rollBoarder();
    translate([0,0,BoarderThickness])
        chamferCylinder(height = SpoolCore, radius = InnerRadius, chamferHeight =-OuterRadius, chamferHeight2= -OuterRadius, angle = 0, quality = 0.5);
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
    cylinder(BoarderThickness, 2* OuterRadius, 2*OuterRadius);
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
    holderBlock();
    translate([HolderWidth/2, HolderThickness, HolderHeight-HolderClipIn])
        rotate([-90,0,0])
            bearingInnerPart();
    translate([0,SpoolHeight+HolderThickness+2*BearingInnerRing,0])
        difference()
        {
            holderBlock();
            translate([HolderWidth/2, -0.01, HolderHeight-HolderClipIn])
                rotate([-90,0,0])
                    bearingHole();
        }
    //Bearing Hole
    //InnerBearing
    //Motor Hole
}

module mountingBlock()
 {
     /**
  * chamferCube returns an cube with 45° chamfers on the edges of the
  * cube. The chamfers are diectly printable on Fused deposition
  * modelling (FDM) printers without support structures.
  *
  * @param  sizeX          The size of the cube along the x axis
  * @param  sizeY          The size of the cube along the y axis
  * @param  sizeZ          The size of the cube along the z axis
  * @param  chamferHeight  The "height" of the chamfers as seen from
  *                        one of the dimensional planes (The real
  *                        width is side c in a right angled triangle)
  * @param  chamferX       Which chamfers to render along the x axis
  *                        in clockwise order starting from the zero
  *                        point, as seen from "Left view" (Ctrl + 6)
  * @param  chamferY       Which chamfers to render along the y axis
  *                        in clockwise order starting from the zero
  *                        point, as seen from "Front view" (Ctrl + 8)
  * @param  chamferZ       Which chamfers to render along the z axis
  *                        in clockwise order starting from the zero
  *                        point, as seen from "Bottom view" (Ctrl + 5)
  */
     chamferCube(BlockWidth, BlockLenght, BlockThickness);
 }

 module holderBlock()
 {
     chamferCube(HolderWidth, HolderThickness, HolderHeight);
 } 
