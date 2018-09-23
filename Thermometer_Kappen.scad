include <Chamfers-for-OpenSCAD/Chamfer.scad>;


//variables:
OuterRadius = 14;
InnerRadius = 17.7/2;
Height = 24;
RingHeight = 1.5;
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

for (i = [0:1]) 
{ 
    translate([0,i*2*(OuterRadius-0.5),0]) onePlug();
}

module outerPart()
{
    chamferCylinder(height = Height+FloorThickness, radius = OuterRadius, chamferHeight =3, chamferHeight2= 1, angle = 0, quality = 0.5);
    translate([0,0,Height+FloorThickness])
        cylinder(RingHeight, InnerRadius+0.4, InnerRadius+0.4);
}

module innerPart()
{
    chamferCylinder(Height+RingHeight, InnerRadius, InnerRadius, 6, 0.3,quality = 0.5);
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