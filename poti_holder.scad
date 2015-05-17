//---------------------------------------------------------------------------------------------
//-- Print of OpenBeam
//-- (c) Martin Korinek	m.ko@inode.at
//-- April-2015
//---------------------------------------------------------------------------------------------
//--
//---------------------------------------------------------------------------------------------

use <MCAD/fonts.scad>

thisFont=8bit_polyfont();
x_shift=thisFont[0][0];
y_shift=thisFont[0][1];

hours=["0","1","2","3","4","5","6","7","8","9","10","11",""];

//fragment minimum angle
  $fa=10.0;

//fragment minimum size
  $fs=0.2;
  
  extr_heigth=20;


difference()
{
	//cube([70,90,2],center = true);
	cube([40,40,2],center = true);
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

		translate([7,11,0])
			cylinder(d = 3, h = 10);
		translate([-7,11,0])
			cylinder(d = 3, h = 10);
		translate([7,-11,0])
			cylinder(d = 3, h = 10);
		translate([-7,-11,0])
			cylinder(d = 3, h = 10);



