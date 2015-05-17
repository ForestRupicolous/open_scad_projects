//---------------------------------------------------------------------------------------------
//-- Print of OpenBeam
//-- (c) Martin Korinek	m.ko@inode.at
//-- April-2015
//---------------------------------------------------------------------------------------------
//--
//---------------------------------------------------------------------------------------------

use <MCAD/fonts.scad>

thisFont=8bit_polyfont();
x_shift=thisFont[0][0];
y_shift=thisFont[0][1];

hours=["0","1","2","3","4","5","6","7","8","9","10","11",""];

//fragment minimum angle
  $fa=10.0;

//fragment minimum size
  $fs=0.2;
  
  extr_heigth=20;



// Example combining MCAD/fonts.scad with search() function.



module clock_hour_words(word_offset=20.0,word_height=2.0) {
  for(i=[0:(len(hours)-1)]) assign( hourHandAngle=(i+1)*360/len(hours), theseIndicies=search(hours[i],thisFont[2],1,1) ) {
    rotate(90-hourHandAngle) translate([word_offset,0])
      for( j=[0:(len(theseIndicies)-1)] ) translate([j*x_shift,-y_shift/2]) {
        linear_extrude(height=word_height) polygon(points=thisFont[2][theseIndicies[j]][6][0],paths=thisFont[2][theseIndicies[j]][6][1]);
      }
  }
}

clock_hour_words(word_offset=20.0,word_height=5.0);

difference()
{
	cube([70,90,2],center = true);
	translate([0,0,-2])
	{
		cylinder(d = 13, h = 5);
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



