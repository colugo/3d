use <knurledFinishLib_v2.scad>;

module knob(){
difference() { 
	union(){
		knurl(k_cyl_hg	= 8,	k_cyl_od	= 34.5);
		//cylinder (h = 8, r= 18);
		cylinder (h = 8.5, r = 10, $fn = 30);
	}
	cylinder (h = 20, r = 3, center = true, $fn = 30);
	translate ([0, 0, 4]) rotate (a = [0, 90, 0]) cylinder (h = 40, r = 1, $fn = 30); 
	translate ([10, 0, 4]) rotate (a = [0, 90, 0]) cylinder (h = 40, r = 2.5, $fn = 30); 
}
}