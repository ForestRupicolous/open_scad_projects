insideRadius=25;
outsideRadius=27.5;
thickness=3;
lengthOfArm=15;

// number of sides
shape=30; //[3:Triangle, 4:Square, 5:Pentagon, 6:Hexagon, 8:Octogon, 30:Circle]
$fn=shape;


x1angle=90;


y1angle=90;


z1angle=0;


rotate([x1angle,0,0])
    translate([-outsideRadius,0,7.5])
        arm_clamp();

rotate([x1angle+180,0,0])
    translate([-outsideRadius,0,7.5])
        arm_clamp();
    
arm_outer();




//call heel

//heel();



module arm_outer(){
rotate([0,y1angle,0])
    difference()
    {
        cylinder (lengthOfArm,insideRadius+thickness,       insideRadius+thickness);
        translate([0,0,thickness])
           cylinder (lengthOfArm+1,insideRadius,insideRadius);
    }
}


module arm_clamp()
{
    arm_inner_length=20;
    difference()
    {
        cylinder (arm_inner_length,outsideRadius+thickness,outsideRadius+thickness);
        cylinder (arm_inner_length+1,outsideRadius,outsideRadius);
        #
        translate([-outsideRadius,0,0])
            cube([outsideRadius,2*(insideRadius+thickness),2*(insideRadius+thickness)],center=true);
    }
}

module heel(){

sphere(insideRadius+thickness);
$fn=50;
}
//end modules

