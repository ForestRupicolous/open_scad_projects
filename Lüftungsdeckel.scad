// Lüftungsdeckel

DeckelDicke = 6*0.24;
DeckelDurchmesser = 115;
LochDurchmesser = 93; 
ZapferlDicke = 1.2;
ZapferlBreite = 10;
ZapferlHoehe = 30;

$fn = 120;

cylinder(d1 = DeckelDurchmesser, d2 = DeckelDurchmesser+2*DeckelDicke, h = DeckelDicke); //45° Chamfer
difference()
{
    cylinder(d = LochDurchmesser, h = ZapferlHoehe+DeckelDicke);
    cylinder(d = LochDurchmesser-2, h = ZapferlHoehe+DeckelDicke+1);
}


module zapferl(rot = 0)
{
    rotate([0,0,rot]) 
        translate([LochDurchmesser/2-ZapferlDicke/2,0,0])
            translate([-ZapferlDicke/2,-ZapferlBreite/2,0]) 
                cube([ZapferlDicke,ZapferlBreite,ZapferlHoehe+DeckelDicke]);
}