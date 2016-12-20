outer_diameter = 71 / 2;
grip = 3 + outer_diameter;
grip_height = 5;
rail_dim = 1.4;
rail_degrees = 70;
nub_gap_degrees = 5;
inner_diameter = outer_diameter - (1 * rail_dim);

module outer(){
	difference(){
		cylinder(grip_height, grip, grip);
		translate([0,0,-0.5])cylinder(grip_height + 1, outer_diameter, outer_diameter);
	}
}

module inner() {
	color([1,0,0])
	difference(){
		union(){
			pie_slice(outer_diameter, 70);
			rotate([0,0,180])pie_slice(outer_diameter, 70);
		}
		translate([0,0,-0.5])cylinder(rail_dim + 1, inner_diameter, inner_diameter);	
	}
	rotate([0,0,-1 * nub_gap_degrees])nub();
	rotate([0,0,180 - nub_gap_degrees])nub();
}

module nub(){
	color([0,0,1])
	translate([outer_diameter ,0,0])
	cylinder(rail_dim, rail_dim / 1.5, rail_dim / 1.5);
}

module nub_gap(){
	dim = outer_diameter + 2;
	color([0,1,0])
	intersection(){
		difference(){
			translate([0,0,-5])cylinder(10, dim, dim);
			translate([0,0,-5.5])cylinder(11, dim - rail_dim/2, dim - rail_dim/2);
		}
		rotate([0,0,-15])translate([0,0,-5])pie_slice(grip, 20, 10);
	}
}

module pie_slice(r=3.0, a=30, h=rail_dim) {
  $fn=64;
  intersection() {
    cylinder(h,r,r);
    cube([r,r,h]);
    rotate(a-90) cube([r,r,h]);
  }
}


difference(){
	union(){
		outer();
		inner();
	}
	nub_gap();
	rotate([0,0,180])nub_gap();
}