include <Chamfers-for-OpenSCAD/Chamfer.scad>;


//variables:
OuterRadius = 14;
InnerRadius = 10;
Height = 22;
FloorThickness = 3;

/**
  * chamferCylinder returns an cylinder or cone with 45° chamfers on
  * the edges of the cylinder. The chamfers are diectly printable on
  * Fused deposition modelling (FDM) printers without support structures.
  *
  * @param  height         Height of the cylinder
  * @param  radius         Radius of the cylinder (At the bottom)
  * @param  radius2        Radius of the cylinder (At the top)
  * @param  chamferHeight  The "height" of the chamfer at radius 1 as
  *                        seen from one of the dimensional planes (The 
  *                        real width is side c in a right angled triangle)
  * @param  chamferHeight2 The "height" of the chamfer at radius 2 as
  *                        seen from one of the dimensional planes (The 
  *                        real width is side c in a right angled triangle)
  * @param  angle          The radius of the visible part of a wedge
  *                        starting from the x axis counter-clockwise
  * @param  quality        A circle quality factor where 1.0 is a fairly
  *                        good quality, range from 0.0 to 2.0
  */

for (i = [0:3]) 
{ 
    translate([0,i*2*(OuterRadius-0.7),0]) onePlug();
}

module outerPart()
{
    chamferCylinder(height = Height+FloorThickness, radius = OuterRadius, chamferHeight = 2, chamferHeight2= 0.5, angle = 0, quality = 0.5);
}

module innerPart()
{
    chamferCylinder(Height, InnerRadius, InnerRadius, 6, -1,quality = 0.5);
}

module onePlug()
{
    difference()
    {
        outerPart();
        translate([0, 0, FloorThickness]) 
            innerPart();
    }
}