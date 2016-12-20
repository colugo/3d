base_flat_h = 1.2;
base_flat_w = 5.3;
base_flat_l = 35;

base_up_h = 3;
base_up_w = 3.75;
base_up_l = 35;

inner_r = 4.9 / 2;
outer_r = 8 / 2;

fn = 30;

mount_top_lip = 1.3;
mount_top_total = 2.5;
mount_r = inner_r + 2.37;

outer_inner_rs = 14.58;

union() { 
	base();
	top();
}

module top(){
	translate ([0, 0, mount_top_total + base_up_h + base_flat_h-0.1]) {
		mirror([1,0,0])translate ([-1 * ((outer_inner_rs / 2) - inner_r-0.04), 0, 0]) top_half();
		translate ([-1 *( (outer_inner_rs / 2) - inner_r), 0, 0]) top_half();
	}
}
module top_half(){
sq = 2 * mount_r;
rotate (a = [0, 180, 90]) 
	difference(){
		union(){
			translate ([-0.5 * sq, -0.5*sq, 0]) cube (size = [sq, sq*1.22, mount_top_total]) ;
			cylinder (h = mount_top_total, r = mount_r, $fn = fn);
		}
		translate ([0, 0, mount_top_lip -0.1]) cylinder (h = mount_top_total - mount_top_lip + 1, r = outer_r, $fn = fn);
		cylinder (h = 10, r = inner_r, center = true, $fn = fn);
		translate ([5, 0, 0]) cube (size = [10, inner_r * 1.85, 10], center=true) ;
		translate ([5, 0, 1.5 * mount_top_lip-0.1]) cube (size = [10, outer_r * 2, mount_top_lip + 0.1], center=true) ;
	}
}

module base(){
gap = 16.6;
	difference() { 
		union(){
			translate([ -1/2 * base_flat_l , -1/2 * base_flat_w ,0]) cube (size = [base_flat_l, base_flat_w, base_flat_h]) ;
			translate([ -1/2 * base_up_l , -1/2 * base_up_w ,base_flat_h]) cube (size = [base_up_l, base_up_w, base_up_h]) ;
		}
			translate ([base_flat_l * 0.4,0,0])cylinder (h = 10, r = 0.9, center = true, $fn = fn);
			translate ([base_flat_l * -0.4,0,0])cylinder (h = 10, r = 0.9, center = true, $fn = fn);
			translate ([-0.5 * gap, -5, -0.01]) cube (size = [gap,  10, base_up_h + base_flat_h + 0.02]) ;
	}
}