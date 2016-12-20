include <tensioner_bearing_idler.scad>
bearing_ir = 4;
support_w = 10;
bearing_gap = 1;
rod_l = retainer_h + 2*support_w + 2*bearing_gap;
support_dim = 14;
support_h = 35;
base_h = 2.5;
base_l = 25;
mounting_r = 2;

module rod(){
	color([0.8,0.8,0.8])
	translate([0, 0.5 * rod_l, 0])
	rotate([90,0,0]){
		cylinder(r=bearing_ir, h=rod_l);
	}
}

module base_support(){
	union(){
		translate([0,0.5 * support_w,0]){
			hull(){
				rotate([90,0,0]){
					cylinder(h = support_w, r = support_dim);
				}
				translate([-1 * support_dim, -1 * support_w, -1 * (support_h - support_dim)])
				cube([2*support_dim, support_w, 2*support_dim,]);
			}
		}
		translate([0,5,-1 * (support_h - support_dim)])rotate([0,270,0])triangle(15,10,5);
		translate([-1 * support_dim, -0.5 * support_w, -1 * (support_h - support_dim) - base_h]){
			cube([2*support_dim, base_l, base_h]);
		}
	}
}

module left_support(){
	union(){
		translate([0, (-0.5 * rod_l) - (-0.5 * support_w), 0]){
			rotate([0,0,180])base_support();
		}
		rod();
		translate([-1 * support_dim, (-0.5 * rod_l) - (base_l - support_w), -1 * (support_h - support_dim) - 2*base_h]){
			cube([2*support_dim, (base_l - support_w) * 2 + rod_l, base_h]);
		}
		
	}
}

module right_support(){
	difference(){
		translate([0, (0.5 * rod_l) - (0.5 * support_w), 0]){
			base_support();
		}
		scale([1.05, 1.05, 1.05])rod();
	}
}


module triangle(h,b,w){
	linear_extrude(height = w, center = true, convexity = 10, twist = 0)
	polygon(points=[[0,0],[h,0],[0,b]], paths=[[0,1,2]]);
}

module mounting_holes(){
	color([1,0,0]){
		translate([support_dim * 0.6, base_l, -1 * (support_h - support_dim) - 2.5*base_h]) cylinder(h=base_h * 3, r = mounting_r);
		translate([support_dim * -0.6, base_l, -1 * (support_h - support_dim) - 2.5*base_h]) cylinder(h=base_h * 3, r = mounting_r);
		translate([support_dim * 0.6, -1 * base_l, -1 * (support_h - support_dim) - 2.5*base_h]) cylinder(h=base_h * 3, r = mounting_r);
		translate([support_dim * -0.6, -1 * base_l, -1 * (support_h - support_dim) - 2.5*base_h]) cylinder(h=base_h * 3, r = mounting_r);
	}
}

difference(){
	union(){
		//idler_with_inner();
		left_support();
		right_support();
	}
	mounting_holes();
}
