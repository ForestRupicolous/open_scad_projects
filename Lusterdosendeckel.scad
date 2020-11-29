// Lusterdosendeckel
include <snowflakerator.scad>

DeckelDicke = 6*0.24;
DeckelDurchmesser = 90;
LochDurchmesser = 60; 
ZapferlDicke = 1.2;
ZapferlBreite = 10;
ZapferlHoehe = 15;

$fn = 6;
{
    cylinder(d1 = DeckelDurchmesser, d2 = DeckelDurchmesser+2*DeckelDicke, h = DeckelDicke);  //45° Chamfer
    zapferl(0);
    zapferl(120);
    zapferl(240);
}

module zapferl(rot = 0)
{
    rotate([0,0,rot]) 
        translate([LochDurchmesser/2-ZapferlDicke/2,0,0])
            translate([-ZapferlDicke/2,-ZapferlBreite/2,0]) 
                {
                    cube([ZapferlDicke,ZapferlBreite,ZapferlHoehe+DeckelDicke]);
                     translate([-0.5,0,ZapferlHoehe-2]) rotate([0,45,0]) cube([2,ZapferlBreite,2]);
                }
}