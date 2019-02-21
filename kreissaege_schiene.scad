//Führungsschiene für die Kreissäge von Bosch
//Idee: Schiene die in Nut der Kreissäge passt mit versenkten Bohrlöchern
//ev. Möglichkeit um mehrere Schienen exakt aneinander auszurichten
rail_lenght = 200;
rail_width = 15;
rail_height = 5;
screw_top_diameter = 7;
screw_shaft_diameter = 3.6;

$fn=60;
difference()
{
    cube([rail_width,rail_lenght,rail_height]); //50 for testing, make it longer when in use#

    translate([0,10,0])
        screw_hole(8);
    translate([0,rail_lenght/2,0])
        screw_hole(8);        
    translate([0,rail_lenght-10,0])
        screw_hole(8);
}

module screw_hole(used_dia=screw_top_diameter)
{
    translate([rail_width/2,0,rail_height-used_dia/2-0.5])
    {
    cylinder(d2=used_dia, d1=0, h=used_dia/2 );
    translate([0,0,(used_dia/2)])
       cylinder(d=used_dia, h=10 ); 
    translate([0,0,-(30-used_dia/2)])
        cylinder(d1=screw_shaft_diameter, d2=screw_shaft_diameter,h=30);
    }
}

