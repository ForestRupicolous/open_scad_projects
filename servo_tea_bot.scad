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

//Plate
translate([35,0,7])
rotate([90,0,0])
{
    difference()
    {
        cube([70,90,1],center = true);
        //cube([30,30,2],center = true);

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
}
 
  heigth =30;


difference()
{  
    cube([28,20,38]);
    translate([-0.1,3.5,7.5])
    {
        //size of micro servo
        #cube([24,13,24]);
        translate([13,1.5,23.8])
        #cube([30,10,5]);
        translate([0,0,-5])
		#cube([3,13,33]);
	}
}



