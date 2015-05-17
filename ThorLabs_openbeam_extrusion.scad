//---------------------------------------------------------------------------------------------
//-- Print of OpenBeam
//-- (c) Martin Korinek	m.ko@inode.at
//-- April-2015
//---------------------------------------------------------------------------------------------
//--
//---------------------------------------------------------------------------------------------

//fragment minimum angle
  $fa=10.0;

//fragment minimum size
  $fs=0.2;
  
  extr_heigth=20;

linear_extrude(height = extr_heigth, center = true, convexity = 10)
   import (file = "ThorLabs.dxf");