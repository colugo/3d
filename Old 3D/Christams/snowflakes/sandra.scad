h = 5;
filename = "owl.dxf";
scale = 0.23;

module feature(){
		translate([0,26,0])scale([scale*1.2,scale,1])translate([0,0,-h/2])linear_extrude(height = h) import(filename);
}

module six_feature(){
	union() {
		for(i = [0:360 / 6:360]){
			rotate([0,0,i]) feature();
		}
	}
}

module base(){
	difference(){
		scale([0.7,0.7,1]) translate([0,0,-h/2])linear_extrude(height = h) import("snowflake.dxf");
		cut();
	}
}


module loop() {
	translate([0,45,0]) {
		union(){
			difference() {
				cylinder(h,6,6, center = true);
				cylinder(h,3,3, center = true);
			}
			translate([0,-8,0])cube([5,8,5], center = true);
		}
	}
}

module cut() {
	translate([0,0,-5])
	difference() {
		cylinder(2 * h,80,80);
		cylinder(2 * h,20,20);
	}
}

union() {
	six_feature();
	base();
	loop();
}

//translate([0,0,-5]) color([0,1,0]) cylinder(h,40,40);