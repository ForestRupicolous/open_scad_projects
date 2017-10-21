// Customizable hex pattern
// Created by Kjell Kernen
// Date 22.9.2014

/*[Pattern Parameters]*/
// of the pattern in mm:
//width=20;       // [10:100]

// of the pattern in mm:
//lenght=20;      // [10:100]

// of the pattern in tens of mm:
height=5;       // [2:200]

// in tens of mm:
border_width=20;// [2:100]

// in mm:
//hex_radius=2;   // [1:20]

// in tens of mm:
hex_border_width=15; // [2:50]

/*[Hidden]*/

module hex(x,y,hex_height=height,hex_radius=2)
{
	difference()
	{
		translate([x,y,-hex_height/2])
			cylinder(r=(hex_radius+hex_border_width/20), h=hex_height, $fn=6);
		translate([x,y,-hex_height/2-0.1])//0.1 to have clear cuts
			cylinder(r=(hex_radius-hex_border_width/20), h=hex_height+0.2, $fn=6);//0.2 for the clear cuts
	}
}

////main()
//drawHexPattern(width, lenght, height, hex_radius);
//drawFrame(width, lenght, height, border_width);

//Pattern
module drawHexPattern(width = 10, lenght = 20, height=5, hex_radius = 2)
 {
	x=sqrt(3/4*hex_radius*hex_radius);
 	ystep=2*x;
 	xstep=3*hex_radius/2;
	intersection()
	{
		for (xi=[0:xstep:width])
			for(yi=[0:ystep:lenght])
				hex(xi-width/2,((((xi/xstep)%2)==0)?0:ystep/2)+yi-lenght/2,height, hex_radius);
		translate([-width/2, -lenght/2, -height/2])
			cube([width,lenght,height]);
	}
}

// Frame
module drawFrame(width = 10, lenght = 20, height=5, border_width=20)
{
	xborder=(border_width/10<width)?width-border_width/10:0;
	yborder=(border_width/10<lenght)?lenght-border_width/10:0;
		difference()
		{
			translate([-width/2, -lenght/2, -height/20])
				cube([width,lenght,height/10]);
			translate([-xborder/2, -yborder/2, -(height/20+0.1)])
				cube([xborder,yborder,height/10+0.2]);
		}
}
