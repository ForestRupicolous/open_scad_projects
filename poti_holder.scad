//---------------------------------------------------------------------------------------------
//-- Print of OpenBeam
//-- (c) Martin Korinek	m.ko@inode.at
//-- April-2015
//---------------------------------------------------------------------------------------------
//--
//---------------------------------------------------------------------------------------------

use <MCAD/fonts.scad>

//fragment minimum angle
  $fa=10.0;

//fragment minimum size
  $fs=0.2;
  
  extr_heigth=20;
	SmallPinsDiameter = 2.7;

difference()
{
	cube([70,90,2],center = true);
	//cube([40,40,2],center = true);
	translate([0,0,-2])
	{
		translate([28,38,0])
			cylinder(d = 7, h = 5);
		translate([-28,38,0])
			cylinder(d = 7, h = 5);
		translate([28,-38,0])
			cylinder(d = 7, h = 5);
		translate([-28,-38,0])
			cylinder(d = 7, h = 5);
	}
	
}


		translate([7.5,10,0])
			cylinder(d = SmallPinsDiameter, h = 10);
		translate([-7.5,10,0])
			cylinder(d = SmallPinsDiameter, h = 10);
		translate([7.5,-10,0])
			cylinder(d = SmallPinsDiameter, h = 10);
		translate([-7.5,-10,0])
			cylinder(d = SmallPinsDiameter, h = 10);



