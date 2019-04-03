// Markeriungen für die Bohrlöcher der Werkbank


drillhole_markings =[20,50,80];
drillhole_side_distance = 30;
guide_lenght = 100;
guide_width = 60;
guide_thickness = 5;
cube([guide_lenght,guide_width,guide_thickness]);

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

module hole_marker(markerheight = 5/3*guide_thickness)
{
    cylinder(d1=markerheight, d2=0, h=markerheight, center = false);
}
