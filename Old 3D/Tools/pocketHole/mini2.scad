grip_l = 45;
grip_w = 30;
grip_h = 15;
grip_base_h = 5;
grip_wall = 4;

grip_recess_l = (grip_l - 4 * grip_wall) / 2;
grip_recess_w = (grip_w - 3 * grip_wall) / 2;

window_l = 13;

head_l = 45;
head_h = 30;
head_w = 30;

angle = 15;
////////////////////////////////////
fn = 80;
pocket_hole_r = 5.3;
drill_r = 4.2;
pocket_sheath_r = 7;
bearing_d = 7;
bearing_r = 11.3;
////////////////////////////////////

double();
//part();

module double(){

translate ([grip_w*0.5, 0, 0]) part();
translate ([grip_w*-0.5 + grip_wall - 1, 0, 0]) part();

}

module part(){
	difference() { 
		body();
		tube();
		translate ([0, 0, -100]) cube (size = [200, 200, 200], center = true); 
		translate ([0, 0, 132]) cube (size = [200, 200, 200], center = true); 
		translate ([0, -1 * (head_l + window_l - 3.5), 8]) cube (size = [drill_r * 2, 10, 10], center = true); 
		translate ([0, 1, 0]) cube (size = [head_w + 10, 1.9, 15],center = true) ;
	}
}


module body(){
	translate ([grip_w / -2, -1 * (grip_l + window_l + head_l), 0]) {
		translate ([0, grip_l + window_l + head_l, 0]) head();
		grip();
	}
	sheath();
}

module sheath(){
	translate ([0, 0, (head_h + grip_base_h)/2]) rotate (a = [90 + angle,0,0])translate ([0, 0, 10]) cylinder (h = 65, r= pocket_sheath_r, $fn = fn);
}

module tube(){
	translate ([0, 0, (head_h + grip_base_h)/2]) rotate (a = [90 + angle,0,0])translate ([0, 0, -60]) cylinder (h = 100, r= pocket_hole_r, $fn = fn);
	translate ([0, 0, (head_h + grip_base_h)/2]) rotate (a = [90 + angle,0,0])cylinder (h = 100, r= drill_r, $fn = fn);
	translate ([0, 0, (head_h + grip_base_h)/2]) rotate (a = [90 + angle,0,0])translate ([0, 0, bearing_d]) cylinder (h = bearing_d, r= bearing_r * 0.75, $fn = fn);
	translate ([0, 0, (head_h + grip_base_h)/2]) rotate (a = [90 + angle,0,0])translate ([0, 0, bearing_d - 3.5]) cylinder (h = bearing_d, r= bearing_r, $fn = fn);
}


module head(){
	hull(){
		rotate (a = [angle, 0, 0]) translate ([(grip_w - head_w) / 2, 0, 0]) cube (size = [ head_w, 1, head_h + grip_base_h]);
		translate ([0, -1 * head_l, 0]) cube (size = [ grip_w, 1, grip_h + grip_base_h]);
	}
}

module grip(){
	difference() { 
		cube (size = [grip_w, grip_l + window_l, grip_h + grip_base_h]);
		grip_recess_row();
		translate ([0, grip_recess_l + grip_wall, 0]) grip_recess_row();
		translate ([0, grip_recess_l + grip_wall + grip_recess_l + grip_wall , 0])hull() grip_recess_row();
		//translate ([0, grip_recess_l + grip_wall + grip_recess_l + grip_wall + grip_recess_l + grip_wall , 0]) hull()grip_recess_row();
	}
}
module grip_recess_row(){
	translate ([grip_wall, grip_wall, 0]) grip_recess();
	translate ([grip_wall + grip_recess_w + grip_wall, grip_wall, 0]) grip_recess();
}
module grip_recess(){
	translate ([0, 0, grip_base_h]) cube (size = [grip_recess_w, grip_recess_l, grip_h + 0.1]);
}