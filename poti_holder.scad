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
  
  SmallPinHight = 20.0;
  BigPinHeight = 13.0;
  SmallPinsDiameter = 2.7;
  BigPinsDiameter = 5.0;   

difference()
{
	//cube([70,90,1],center = true);
	cube([30,30,2],center = true);
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
{       
	cylinder(d = SmallPinsDiameter, h = SmallPinHight);
    cylinder(d = BigPinsDiameter, h = BigPinHeight);
};
translate([-7.5,10,0])
{
   	cylinder(d = SmallPinsDiameter, h = SmallPinHight);
    cylinder(d = BigPinsDiameter, h = BigPinHeight); 
}

translate([7.5,-10,0])
{
   	cylinder(d = SmallPinsDiameter, h = SmallPinHight);
    cylinder(d = BigPinsDiameter, h = BigPinHeight); 
}
		
translate([-7.5,-10,0])
{
   	cylinder(d = SmallPinsDiameter, h = SmallPinHight);
    cylinder(d = BigPinsDiameter, h = BigPinHeight); 
}



