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
  
  
  HolzBreite = 22.0;
  HolzLaenge = 41.0;
  HalterDicke = 1.5;
  HalterHoehe =10.0;
  PlattenBreite = 20.0;

difference()
{
	//cube([70,90,1],center = true);
	cube([HolzBreite+2*HalterDicke,HolzLaenge+2*HalterDicke,HalterHoehe]);
	translate([HalterDicke,HalterDicke,])
    cube([HolzBreite,HolzLaenge,HalterHoehe]);
	
}

translate([0,-20+HalterDicke,0])
difference()
{  
    cube([HolzBreite+2*HalterDicke,20,38]);
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


