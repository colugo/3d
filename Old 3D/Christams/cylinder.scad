height = 70;
radius = 25;
wall = 1.5;

module slice(){
	intersection(){
		difference() {
			cylinder(height, radius, radius);
			translate([0,0,wall])cylinder(height, radius - wall, radius - wall);
		}
		rotate([0,15,0])cube([wall, radius, height * 1.5]);

	}
}

module base() {
union(){
	for(i = [0:(360 / 22):360]) {
		rotate([0,0,i]){
			slice();
		}
	}
	cylinder(wall,2,2);
	}
}

module rim() {
	translate([0,0,height]){
		difference() {
				cylinder(2 * wall, radius, radius);
				cylinder(2 * wall, radius - wall, radius - wall);
		}
	}
}

base();
rim();

