$fn = 50;
difference(){
	union(){
		hull(){
			cylinder(r=15,h=1);
			translate([0,0,70])sphere(r=15);
		}
		cylinder(r1=30,r2=15,h=30);
	}
	cylinder(r=2.55,h=120,center = true);
	translate([0,0,27])rotate_extrude(convexity = 10, $fn = 100)translate([44.85, 0, 0])circle(r = 30, $fn = 100);
}