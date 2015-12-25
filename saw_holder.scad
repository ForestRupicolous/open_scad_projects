//---------------------------------------------------------------------------------------------
//-- Print of Saw_Holder
//-- (c) Martin Korinek	m.ko@inode.at
//-- 2015
//---------------------------------------------------------------------------------------------
//--
//---------------------------------------------------------------------------------------------

use <MCAD/fonts.scad>

//fragment minimum angle
  $fa=10.0;

//fragment minimum size
  $fs=0.2;
  
  
  HolzBreite = 80.0;
  HolzLaenge = 80.0;
  HalterDicke = 5;
  HalterHoehe =20.0;
  PlattenBreite = 20.0;

difference()
{
	//cube([70,90,1],center = true);
	cube([HolzBreite+2*HalterDicke,HolzLaenge+HalterDicke,HalterHoehe]);
	translate([HalterDicke,HalterDicke/2,0])
    cube([HolzBreite,HolzLaenge,HalterHoehe]);
	
}





