// Markeriungen für die Bohrlöcher der Werkbank


drillhole_markings =[20,50,80];
drillhole_side_distance = 28;
guide_lenght = 100;
guide_width = 50;
guide_thickness = 5;


cube([guide_lenght,guide_width,guide_thickness]);
top_wall();
hole_markings();
difference()
{
    side_wall();
    rotate([90,0,0])
    {   drill_guides();
        translate([0,-1/3*guide_width,0])
            drill_guides(16);  
    }
}

module drill_guides(dia = 4)
{
    translate([0,2/3*guide_width,0])
    {
        for(i = [0:len(drillhole_markings)-1])
        {
            if(drillhole_markings[i] < guide_lenght)
            {
                translate([drillhole_markings[i],0,0]) guide_hole(dia);
            }
            else
            {
                echo("marking outside of lenght");
            }
        }
    }
}

module side_wall()
{
    translate([-guide_thickness,-guide_thickness,0])
    cube([guide_lenght+guide_thickness,guide_thickness,guide_width]);
}

module hole_markings()
{
    translate([0,drillhole_side_distance,0])
    {
        for(i = [0:len(drillhole_markings)-1])
        {
            if(drillhole_markings[i] < guide_lenght)
            {
                translate([drillhole_markings[i],0,0]) hole_marker();
            }
            else
            {
                echo("marking outside of lenght");
            }
        }
    }
}







module hole_marker(markerheight = 5/3*guide_thickness)
{
    cylinder(d1=markerheight, d2=0, h=markerheight, center = false);
}

module guide_hole(guide_diameter = 4)
{
    cylinder(d=guide_diameter, h=2*guide_thickness, center = false);
}

module top_wall()
{
    intersection()
    {
        translate([-guide_thickness,0,0])
            cube([guide_thickness,guide_width,guide_width]);

        rotate([0,-90,0])
            cylinder(r=guide_width,h=guide_thickness);
    }
}
