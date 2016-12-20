rad_hood = 30.53 / 2;
dim_min_width = 25.65; // 25.65 was measured
ang_arms = 4.15;
dim_depth = 30;
dim_height = 1.5;
dim_wall = 2;
rad_shroud = 130;
rad_m3_tap = 2.5 / 2;

shroudWithoutInterference();

module shroudWithoutInterference(){
	difference() {
		shroud();
		difference() {
			translate([0,0,-4.5])rotate([24,0,0])mirror([1,0,0])cube(60);
			translate([ -12, 0, 0])cube(30);
			cube([120,120,2 * dim_height], center = true);
		}
		cube([40,2,30], center = true);
	}
}

module shroud(){
	translate([0, -1 * rad_shroud, 0])for(r = [0:0.5:4])rotate([ r, 0, 0])
	translate([0, dim_depth + rad_shroud, 0]){
		arm();
		mirror([ 1, 0, 0])arm();
		curve();
	}
	translate([0, dim_depth, 0]){
		arm(stoppers=true, extra=true);
		mirror([ 1, 0, 0])arm(stoppers = true);
	}
}

module curve(){
	$fn = 30;
	curve_orig = -1 *(rad_hood - 7) ;
	difference() {
		translate([ 0, curve_orig, 0])difference() {
			cylinder(r=rad_hood + dim_wall - 0.18, h=dim_height);
			translate([ 0, 0, -1])cylinder(r=rad_hood + 0.05, h=dim_height + 2);
		}
	translate([ -2 * rad_hood, -2 * rad_hood, -1])cube([rad_hood * 4, rad_hood * 2, dim_height + 2]);
	}
}

module arm(stoppers = false, extra = false){
	shroud_thickness = 2.5;
	offset = stoppers ?  (shroud_thickness + 5) : 0;
	wallAmt = extra ? 7 : 5;
	mounting = extra ? -3 : -1;

	translate([ dim_min_width * 0.5, 0, 0])rotate([ 0, 0, ang_arms * 0.5])translate([ -1 * offset, -1 * dim_depth, 0]){
		if(offset == 0){
			cube([dim_wall + offset, dim_depth, dim_height]);
		}
		if(extra){
				translate([ -2, dim_depth - 2, 0])cube([2, 2, dim_height]);
		}

		if(offset != 0){
			difference() {
				union(){
					cube([dim_wall + offset, dim_depth, dim_height]);
					translate([ 5 - wallAmt, 0, 0])cube([wallAmt, dim_depth - 1, dim_height * 5]);
					translate([ mounting, 0, 0])rotate([ 0, 0, -0.5 * ang_arms])cube([dim_wall + offset, dim_depth, dim_height]);
				}
				if(extra){
					translate([ 1.5, 7, 0])cylinder(r= rad_m3_tap, h=50, center=true, $fn=30);
					translate([ 1.5, 7 + 15, 0])cylinder(r= rad_m3_tap, h=50, center=true, $fn=30);
				}
			}
		}
	}
}