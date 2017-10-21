$fa=0.1;
difference()
{
    cube([20,7,9]);
    translate([0.5,0.5,-0.5])
        #cube([19,6,10]);
    
}
translate([1,0,1])
    t("MK");


// Helper to create 3D text with correct font and orientation
module t(t, s = 6, style = "") {
  rotate([90, 0, 0])
    linear_extrude(height = 1)
      text(t, size = s, font = str("Liberation Sans", style), $fn = 16);
}