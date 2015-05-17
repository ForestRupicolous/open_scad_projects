//---------------------------------------------------------------------------------------------
//-- Printable ring tester
//-- (c) Martin Korinek	m.ko@inode.at
//-- March-2015
//---------------------------------------------------------------------------------------------
//--
//---------------------------------------------------------------------------------------------

//fragment minimum angle
  $fa=5.0;

//fragment minimum size
  $fs=0.1;

  Thickness = 1.5;
  RingHeigth = 2.5;
  
  difference(){  
	cylinder(h = RingHeigth, d = 16+Thickness, center = true);
	cylinder(h = 3.2, d = 16, center = true);
};

translate([20,0,0])
{
	difference(){  
		cylinder(h = RingHeigth, d = 16.5+Thickness, center = true);
		cylinder(h = 3.2, d = 16.5, center = true);
	}
};

translate([0,20,0])
{
	difference(){  
		cylinder(h = RingHeigth, d = 17.5+Thickness, center = true);
		cylinder(h = 3.2, d = 17.5, center = true);
	}
};

translate([20,20,0])
{
	difference(){  
		cylinder(h = RingHeigth, d = 15.5+Thickness, center = true);
		cylinder(h = 3.2, d = 15.5, center = true);
	}
};
