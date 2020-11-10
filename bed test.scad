//difference()
//{
//    cube([200,200,0.2],center = true);
//    cube([190,190,0.3],center = true);
//}

difference()
{
    cube([40,40,0.2],center = true);
    cube([30,30,0.3],center = true);
}


rotate([0,0,45])
    cube([270,5,0.2],center = true);


rotate([0,0,-45])
    cube([270,5,0.2],center = true);
