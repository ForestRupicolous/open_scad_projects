//---------------------------------------------------------------------------------------------
//-- Light Cube
//-- (c) Martin Korinek	m.ko@inode.at
//-- 2018
//---------------------------------------------------------------------------------------------
//--
//---------------------------------------------------------------------------------------------
//includes
//include <Chamfers-for-OpenSCAD/Chamfer.scad>;
include <openscad_libraries/rounded_Box.scad>;

CubeSize = 80;
CornerRadius = 10;
//roundedcube_simple(CubeSize,true,CornerRadius);

advRoundedBox(size = [CubeSize,CubeSize,CubeSize], radius = CornerRadius, sidesonly = false, center=true);
