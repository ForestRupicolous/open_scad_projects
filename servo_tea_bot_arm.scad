//---------------------------------------------------------------------------------------------
//-- Printable servo tea bot
//-- (c) Martin Korinek	m.ko@inode.at
//-- April-2015
//---------------------------------------------------------------------------------------------
//--
//---------------------------------------------------------------------------------------------

//fragment minimum angle
  $fa=10.0;

//fragment minimum size
  $fs=0.2;
  
  ArmHeigth =4;
  ArmWidth =8;
  ArmLength = 90; 

	difference()
	{  
		union()
		{
			cube([ArmLength,ArmWidth,ArmHeigth]);
			//translate([-15,-15,0])
				//big weigth cube
				//cube([40,30,ArmHeigth]);
		}
		translate([10,ArmWidth/2,-0.1])
		{	
			#cylinder(h=ArmHeigth-1.5,d=5);
			#cylinder(h=ArmHeigth+2,d=2.5);
			translate([0,0,ArmHeigth-0.5])
				#cylinder(h=ArmHeigth+2,d=6);
		}
		translate([ArmLength-5,-2,-0.1])
			#cube([1,8,ArmHeigth+1]);
	}


