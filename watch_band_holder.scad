include <openscad_libraries/rounded_Box.scad>
//##########################################################################

$fn = 100;

length = 20;
width = 6;
height = 10;
thickness = 2;

boxcornerradius = 1;

difference()
{
    advRoundedBox([length, width, height], boxcornerradius, true, false);
    translate([thickness/2,thickness/2,-0.5])
        #cube([length-thickness,width-thickness,height+1]);
    
}
translate([1,0,2])
    t("MK");


// Helper to create 3D text with correct font and orientation
module t(t, s = 6, style = "") {
  rotate([90, 0, 0])
    linear_extrude(height = 0.5)
      text(t, size = s, font = str("Liberation Sans", style), $fn = 16);
}





module box_body(length = boxlength, width = boxwidth, height = boxheight-lidheight)
{
  //color("Chartreuse", alpha=0.2)
  difference()
  {
    advRoundedBox([length, width, height], boxcornerradius, true, false);

    translate([wandthickness,wandthickness,wandthickness])
      cube([length-(2*wandthickness), width-(2*wandthickness), height]);

      //hole_usb();
  }
}