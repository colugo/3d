module handle(){
	rotate_extrude(convexity = 10, $fn = 100)
	translate([10, 0, 0])
	circle(r = 10, $fn = 100);
	cylinder(r=10,h=20, center=true);
}


rotate([65,0,0])handle();