h = 5;
filename = "flower.stl";
scale = 0.6;

module feature(){
	scale([scale,scale,1])translate([0,0,-h/2])import(filename);
}


module flower_feature(){
	translate([0,30,0])
	union() {
		for(i = [0:360 / 6:360]){
			rotate([0,0,i]) feature();
		}
	}
}



module six_feature(){
	union() {
		for(i = [0:360 / 6:360]){
			rotate([0,0,i]) flower_feature();
		}
	}
}

module lines() {
	for(i = [0:360 / 6:360]){
		rotate([0,0,i]) {
			translate([0,17,0]){
			difference(){
					union(){
						//cube([2,14,5], center = true);
						translate([0,-5,-2.5])	scale([0.3,0.3,1])import("heart.stl");
					}
					translate([0,-3,-2.5])scale([0.2,0.2,1])import("heart.stl");
				}
			}
		}
	}
}


module thing() {
	union() {
		lines();
		scale([1.4,1.4,1])translate([0,-30,0])flower_feature();
		six_feature();
	}
}

union() {

	thing();
	difference() {
		union()
		{
			translate([0,43,0])
			{
				difference() {
					cylinder(5,5,5,center = true);
					cylinder(5,4,4,center = true);
				}
			}
			cylinder(5,41,41,center = true);
		}
		cylinder(5,40,40,center = true);
	}
}

//translate([0,0,-5]) color([0,1,0]) cylinder(h,40,40);