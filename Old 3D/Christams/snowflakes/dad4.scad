h = 5;



module loop() {
	translate([0,44,0]) {
		union(){
			difference() {
				cylinder(h,6,6, center = true);
				cylinder(h,3,3, center = true);
			}
			translate([0,-7,0])cube([5,5,5], center = true);
		}
	}
}


union() {
	translate([0,0,-2.5])scale([0.82,0.82,1])linear_extrude(height = h) import(filename="rebel.dxf");
	loop();
}

//translate([0,0,-5]) color([0,1,0]) cylinder(h,40,40);