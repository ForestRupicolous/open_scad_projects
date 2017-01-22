//Parametric clamp

/*
Parameters:
	base : Enable / disable clamp base
	base_thickness : Thickness of clamp base if enabled
	base_width : Width of clamp base if enabled
	ring_thickness : Tickness of clamp ring
	ring_inner_dia : Inner diameter of clamp ring
	jaws_thickness : Thickness of clamp jaws
	jaws_width : Width of clamp jaws
	break_width : Width of break in clamp jaws
	screw_diameter : Screw hole diameter
	screw_count : Screw hole count
	nut_recess : Enable / disable nut recess in clamp
	nut_diameter : Nut recess diameter
	nut_thickness : Nut recess depth
	height : Clamp height
*/

//translate([-25, 0, 25]) 
clamp(base_thickness = 20);
//translate([25, 0, 25]) clamp(base = false);
//translate([-25, 0, -25]) clamp(screw_count = 2);
//translate([25, 0, -25]) clamp(height = 25);

module clamp(base = true, base_thickness = 7, base_width = 50, ring_thickness = 2, ring_inner_dia = 51, jaws_thickness = 4, jaws_width = 17.5, break_width = 5, screw_diameter = 7, screw_count = 1, nut_recess = true, nut_diameter = 12, nut_thickness = 3, height = 15) {

	//Check base thickness
	if(base && base_thickness < ring_thickness)
		echo("Base thickness must be at least ring thickness, ring will protrude through base");

	//Check jaws width
	if(jaws_width < ring_thickness)
		echo("Jaw width must be at least ring thickness, ring will protrude through jaws");

	//Calculate ring inner radius
	ring_inner_rad = ring_inner_dia / 2;

	//Calculate screw spacing
	screw_spacing = (height - (screw_diameter * screw_count)) / (screw_count + 1);

	//Base
	if(base)
		translate([ring_inner_rad + (base_thickness / 2), 0, 0])
			intersection()
                {
                    cube([base_thickness, base_width, height],                  center=true);
                    #rotate([0,90,0]) 
                        translate([0,0,-base_thickness])
                            cylinder(d1=base_width, d2=base_width                       , 2*base_thickness);
                }
	//Clamp
	difference() {
		union() {
			//Outer cylinder
			cylinder(r=ring_inner_rad + ring_thickness, h=height, center=true);

			//Jaws
			translate([0 - ring_inner_rad - (jaws_width / 2), 0, 0])
				cube([jaws_width, (jaws_thickness * 2) + break_width, height], center=true);
		}
	
		//Inner cylinder
		cylinder(r=ring_inner_rad, h=height + 10, center=true);

		//Break
		translate([0 - ((jaws_width + ring_thickness + (ring_inner_dia / 2) + 10) / 2), 0, 0])
			cube([jaws_width + ring_thickness + (ring_inner_dia / 2) + 10, break_width, height + 10], center=true);

		//Screw hole(s)
		for(i = [1 : screw_count])
			translate([0 - (ring_inner_dia / 2) - (jaws_width / 2), 0, (height / 2) - (screw_diameter / 2) - (screw_spacing * i) - (screw_diameter * (i - 1))])
				rotate([90, 0, 0])
					union() {
						cylinder(r=screw_diameter / 2, h=jaws_thickness * 2 + break_width + 10, center=true, $fn=20);
						if(nut_recess) translate([0, 0, nut_thickness-((nut_thickness + 10)/2)-(break_width/2)-jaws_thickness]) 
                         rotate([0,0,90])   cylinder(r=nut_diameter/2, h=nut_thickness + 10, center=true, $fn=6);
					}
	}
}