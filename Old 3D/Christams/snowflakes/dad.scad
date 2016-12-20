h = 5;



module loop() {
	translate([0,44,0]) {
		union(){
			difference() {
				cylinder(h,6,6, center = true);
				cylinder(h,3,3, center = true);
			}
			//translate([0,-7,0])cube([5,5,5], center = true);
		}
	}
}


union() {
	rotate([0,0,30])
	translate([0,0,-2.5])scale([0.82,0.82,3.3])import(filename="storm.stl");
	loop();
}

//translate([0,0,-5]) color([0,1,0]) cylinder(h,40,40);