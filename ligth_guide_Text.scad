$fa=1;
difference()
{
    cube([5,50,30]);
    translate([3,5,0])
        cube([4,4,20]);
    translate([2,5,5])
        cube([6,40,20]);
}

translate([0,10,7])
t("MK");

// Helper to create 3D text with correct font and orientation
module t(t, s = 16, style = "") {
  rotate([90, 0, 90])
    linear_extrude(height = 10)
      text(t, size = s, font = str("Liberation Sans", style), $fn = 16);
}