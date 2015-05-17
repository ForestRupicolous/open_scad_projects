/****************************************/
/* Ikea clock module holder				*/
/* clock_holder_ikea.scad				*/
/* Martin Korinek						*/
/* 25.01.2015							*/
/****************************************/

InnerTolerance=0.5;
Sidelength = 56+InnerTolerance;
Wallthickness =2;
Wallhight = 16;
Hangerlength= sqrt(pow(Sidelength+Wallthickness,2)/2);
echo(Hangerlength);


difference()
{
	union()
	{
		translate([(Sidelength+Wallthickness)/2-5,0,0])
		{
			rotate([0,0,45])
			{
				difference()
				{	
					cube([Hangerlength,Hangerlength,Wallhight],center=true);
					cube([Hangerlength-Wallthickness,Hangerlength-Wallthickness,Wallhight+0.1],center=true);
				}
			}	
	}
		cube([Sidelength+Wallthickness,Sidelength+Wallthickness,Wallhight],center=true);
	}
	cube([Sidelength,Sidelength,Wallhight+0.1],center=true);//+0.1 to be sure it is cut out
}
	
