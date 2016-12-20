head_width = 15/2;
bolt_r=7.9/2;
x=80;
y=30;
z=10;

/*
difference(){
	translate([0,0,z/2+1])cube([x,y,z],center=true);
	translate([-25,0,0])head();
	translate([25,0,0])head();
}
*/

difference(){
translate([0,0,0.5])handle();
head();
}
module handle(){
	h=10;
	hull(){
		for(r=[0,180]){
			rotate([0,0,r])translate([20,0,0])cylinder(r=8,h=h,$fn=20);
		}
		cylinder(r=12,h=h,$fn=20);
	}
	hull(){
		for(r=[90,270]){
			rotate([0,0,r])translate([20,0,0])cylinder(r=8,h=h,$fn=20);
		}
		cylinder(r=12,h=h,$fn=20);
	}
}

module head(){
	cylinder(r=head_width,h=8,$fn=6);
	cylinder(r=bolt_r,h=20,$fn=20);
	//color([1,0,0])cube([12.8,12.8,12.8],center=true);
}