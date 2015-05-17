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
  
  lang=60;
  breit=80;
  
difference()
{
//big test incl 1mm 2mm 3mm 4mm 
	cube([lang,breit,2]);
	translate([1,2,0])
		cube([lang-4,breit-6,2]);
}