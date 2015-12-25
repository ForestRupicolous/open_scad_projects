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
	translate([HalterDicke,HalterDicke,HalterDicke])
    cube([HolzBreite,HolzLaenge,HalterHoehe-HalterDicke]);
	
}
translate([-HolzBreite/2+2*HalterDicke,-PlattenBreite/2+HalterDicke,0])
cube([HolzBreite+PlattenBreite,HolzLaenge+PlattenBreite,HalterDicke]);




