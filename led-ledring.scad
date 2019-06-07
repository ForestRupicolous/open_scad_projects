// 68.15 - 54.37 mm

$fn = 120;

// 24-led ring
//outerRadius = 85.85 / 2;
//innerRadius = 71.86 / 2;

// 16-led ring
outerRadius = 69.8 / 2;
innerRadius = 54.37 / 2;

centerRadius = (outerRadius + innerRadius) / 2;
ringThickness = (outerRadius - innerRadius);

difference() {
    cylinder(r=outerRadius,h=1);
    translate([0,0,-0.5])
    cylinder(r=innerRadius,h=2);
}
translate([0,0,-5])
    difference() {
        cylinder(r=outerRadius,h=5);
        cylinder(r=outerRadius-0.9,h=5.01);
    }

translate([0,0,1])
rotate_extrude(angle=1, convexity=2) {
    translate([centerRadius,0,0])
    difference() {
        circle(r=ringThickness / 2);
        translate([-ringThickness / 2, -ringThickness, 0])
            square(size=ringThickness);
    }
}
