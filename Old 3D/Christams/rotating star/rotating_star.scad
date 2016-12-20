print_gap = 0.5;
outer_r = 40;
middle_r = 37;
inner_r = 35;
height = 10;
star_height = 5;

module star() {
	union(){
		difference(){
			cylinder(star_height,middle_r, middle_r, center=true);
			cylinder(star_height,inner_r, inner_r, center=true);
		}
		difference(){
			scale([0.97,0.97,0.97]){
				translate([0,5.8,-1.7]){
					import("Classic-star.stl");
				}
			}
			difference(){
				cylinder(star_height,outer_r, outer_r, center=true);
				cylinder(star_height,middle_r, middle_r, center=true);
			}
			translate([0,41.2,0])cube([10,10,15], center=true);
		}
	}
}

module rim() {

	difference(){
		union() {
			translate([0,40,0]){
				difference() {
					cylinder(height * 0.7 , 8,8, center = true);
					cylinder(height * 0.7, 5,5, center = true);
				}
			}
			cylinder(height,outer_r, outer_r, center=true);
		}
		cylinder(height,inner_r, inner_r, center=true);
		cylinder(star_height + (2 * print_gap) ,middle_r + (2 * print_gap), middle_r + (2 * print_gap), center=true);
	}
	//	translate([0,0,12])cube([100,100,20],center=true);}
}

star();
rim();
