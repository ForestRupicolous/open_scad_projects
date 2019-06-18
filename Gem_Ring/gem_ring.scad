//by Griffin Nicoll

r1=8; //inside radius mesured at edge
r2=9; //outside radius mesured at edge
h=4; //height
gem_size=0; //if>0 gem size
gem_sides = 3; //sides of gem
gem_offset=0.8; //makes the gem farther from the ring
gem_angle = 0; //rotates gem about z
safty_gap=1; //if>0 width of cut on back
material_toggle=1; //1 prints ring, 2 prints 2nd material



translate([0,0,h/2])

if (material_toggle==1) //ring material
{
	difference()
	{
		ring(r1,r2,h,$fn=64);
		if(gem_size>0)
		{
			translate([r2+gem_size*2*sin(30)+gem_offset,0,0])gem(h,gem_size);
			%translate([r2+gem_size*2*sin(30)+gem_offset,0,0])gem(h,gem_size);
		}
		if(safty_gap>0)
		{
			translate([-(r1+r2)/2,0.0])cube(size=[h/2+r2-r1,safty_gap,h+1],center=true);
		}
		translate([r2+0.9,0,0])
			cube([0.9,10,h],true);
	}
	translate([r2,0,0])
		cube([0.9,10,h],true);
}
else //other material
{
	if(gem_size>0)
	{
		translate([r2+gem_size*2*sin(30)+gem_offset,0,0])gem(h,gem_size);
	}
	if(text_angle>0)
	{
		intersection()
		{
			ring(r1,r2,h,$fn=32);
			union()
			{
			for(i=[0:text_multiply-1])
				{
					rotate([0,0,i*360/text_multiply])text(text,h-text_offset*2,d=(r2-r1)/2+h,r=(r1+r2+h)/2,a=text_angle);
				}
			}
		}
	}
	%ring(r1,r2,h,$fn=32);
}

module ring(r1,r2,h)
{
	rotate_extrude(convexity=4)
	union()
	{
		translate([(r1+r2)/2,0,0])square([r2-r1,h],center=true);
		intersection()
		{
			translate([r1+h/2,0,0])circle(r=(h/2)*sqrt(2));
			translate([r1-h/2,0,0])square(h,center=true);
		}
		intersection()
		{
			translate([r2-h/2,0,0])circle(r=(h/2)*sqrt(2));
			translate([r2+h/2,0,0])square(h,center=true);
		}
	}
}

module gem(h,gem_size)
{
	minkowski()
	{
		rotate([0,0,180+gem_angle])cylinder(h=1/3*h,r=gem_size,center=true,$fn=gem_sides);
		
		rotate([0,0,gem_angle])union()
		{
			cylinder(h=2/3*h/2,r1=2/3*h/2,r2=0,$fn=gem_sides);
			mirror([0,0,1])cylinder(h=2/3*h/2,r1=2/3*h/2,r2=0,$fn=gem_sides);
		}
	}
}