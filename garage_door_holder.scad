//---------------------------------------------------------------------------------------------
//-- Print of OpenBeam
//-- (c) Martin Korinek	m.ko@inode.at
//-- April-2015
//---------------------------------------------------------------------------------------------
//--
//---------------------------------------------------------------------------------------------


//fragment minimum angle
  $fa=5.0;

//fragment minimum size
  $fs=0.1;
  
	ExtrudedLength = 35;
	Radius = 16.95;
	BaseWidth = 5.4;
	TopWidth = 14.3;
	BaseLength = 2.7;
	Thickness = 2;


linear_extrude(height = ExtrudedLength*2/3)
{	
	difference()
	{
		circle(Radius);
		circle(4);
	}
	translate([-BaseWidth/2,Radius-Thickness,0])
		square([BaseWidth,BaseLength+Thickness]);
	translate([-TopWidth/2,Radius+BaseLength,0])	
		square([TopWidth,2.2]);
}
translate([0,0,ExtrudedLength*2/3-0.001])
{
linear_extrude(height = ExtrudedLength*4/3)
{	
	difference()
	{
		circle(Radius);
		circle(Radius-Thickness);
	}
	translate([-BaseWidth/2,Radius-Thickness,0])
		square([BaseWidth,BaseLength+Thickness]);
	translate([-TopWidth/2,Radius+BaseLength,0])	
		square([TopWidth,2.2]);
}
}

