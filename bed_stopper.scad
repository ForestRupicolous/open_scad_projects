//---------------------------------------------------------------------------------------------
//-- Printable holder for washer
//-- (c) Martin Korinek	m.ko@inode.at
//-- Jan-2015
//---------------------------------------------------------------------------------------------
//--
//---------------------------------------------------------------------------------------------

//fragment minimum angle
  $fa=10.0;

//fragment minimum size
  $fs=0.5;

  diameter = 40;
  hold_hight = 12;
union()
{
	{ 
		//Washer holder
		difference()
		{  
			cylinder(h = 5, d = diameter);
			translate([0,0,-1])
				cylinder(h = 6, d = 15);
			translate([0,0,2.5])
				cylinder(h = 3, d = 25);
		}


		translate([-diameter/2,1,0])
		
		intersection()
		{
			difference()
			{
				//main part of holder
				cube(size = [diameter,4,hold_hight+12]);
				//inner hole
				translate([diameter/2,2,-0.1])	
					cylinder(h = hold_hight, r1= diameter/2-2, r2 = 3);
				//middle round hole
				translate([diameter/2,-1,hold_hight+3])
					rotate([-90,0,0])
						cylinder(h = hold_hight-2, d = 8.5);
				//upper hole
				translate([diameter/2,-1,28])
					rotate([-90,0,0])
						cube(size = [5,20,20], center = true);
			}
			//outer boarder
			translate([diameter/2,2,-0.1])	
			cylinder(h = hold_hight+12, r1= diameter/2+2, r2 = 4);
			
			
		}
		
	}
	//cylinder(h = 50, d = diameter);
}
	//	cylinder(h = 28, r1= diameter, r2 = diameter/2);
