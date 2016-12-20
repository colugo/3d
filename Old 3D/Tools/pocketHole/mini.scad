body_l = 80;
body_w = 30;
body_h = 15;

base_h = 7;

pocket_a = 15;
pocket_h = 30;
pocket_l = 60;

////////////////////////////////////
fn = 40;
pocket_hole_r = 5;
bearing_d = 6;
bearing_r = 11.1;
////////////////////////////////////

difference() { 
	pocket_housing();
	translate ([-10, -1 * body_w, -20]) cube (size = [body_l * 2, body_w * 2, 20]);
}

module pocket_housing(){
	translate ([0, body_w * -0.5, base_h]) 
		difference() { 
			union(){
				rotate (a = [0,pocket_a, 0]) cube (size = [pocket_l, body_w, pocket_h]) ;
				translate ([0, 0, -1 * base_h]) cube (size = [body_l, body_w, base_h]) ;
				translate ([40, 0, -1 * base_h]) cube (size = [body_l, body_w, body_h + base_h]) ;
			}
			rotate (a = [0,pocket_a, 0]){
				translate ([0, body_w * 0.5, pocket_h * 0.5]) rotate (a = [0,90,0]) {
					translate ([0, 0, -5]) cylinder (h = body_l + 100, r = pocket_hole_r, $fn = fn);
					translate ([0, 0, -0.05]) cylinder (h = bearing_d, r = bearing_r, $fn = fn);
				}
			}
	}
}