h = 5;
scale = 0.9;

module feature(){
		translate([0,13,0])scale([scale,scale,1])translate([0,0,-h/2])import("heart.stl");
}

module six_feature(){
	union() {
		for(i = [0:360 / 6:360]){
			rotate([0,0,i]) feature();
		}
	}
}

module base(){
	scale([0.7,0.7,1])
	translate([0,0,-h/2])linear_extrude(height = h) import("snowflake.dxf");
}


module loop() {
	translate([0,45,0]) {
		union(){
			difference() {
				cylinder(h,6,6, center = true);
				cylinder(h,3,3, center = true);
			}
			translate([0,-10,0])cube([5,10,5], center = true);
		}
	}
}

difference() {
	union() {
		six_feature();
		base();
		loop();
	}
	for(i = [0:360 / 6 : 360]) {
		rotate([0,0,i]) {
			translate([0,15,0])scale([0.5,0.5,1])feature();
		}
	}
}

//translate([0,0,-5]) color([0,1,0]) cylinder(h,40,40);