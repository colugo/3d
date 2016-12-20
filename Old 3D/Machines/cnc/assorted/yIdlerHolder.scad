include <tensioner_bearing_idler.scad>

m6_r = 4;
m6_washer_r = 9;
m6_head_h = 6.1;

wall_y = 10;
wall_x = 2 * retainer_h;
air_gap_y = 2;

rod_y = idler_h + 2 * (wall_y + air_gap_y);

base_z = 10;
side_offset_y = 0.5 * idler_h + air_gap_y;
base_y = idler_h + 2 * (wall_y + air_gap_y + 2 * m6_washer_r);
base_x = 2 * retainer_h;
air_gap_z = 4;

triangle_support_x = 0.5 * base_x - m6_washer_r - 1;
triangle_support_y = m6_washer_r;
triangle_support_z = 2 * m6_washer_r;


rod_z = base_z + air_gap_z + retainer_h;

module triangle(h,b,w){
	linear_extrude(height = w, center = true, convexity = 10, twist = 0)
	polygon(points=[[0,0],[h,0],[0,b]], paths=[[0,1,2]]);
}

module base(){
	translate([-0.5 * base_x, -0.5 * base_y,0])cube([base_x, base_y, base_z]);
}

module side(){
	translate([0,0,rod_z]){
		translate([0,wall_y,0])rotate([90,0,0])cylinder(r = retainer_h, h = wall_y);
		translate([-0.5 * wall_x, 0, - 1 * (rod_z - base_z)])cube([wall_x, wall_y, rod_z - base_z]);
	}
}

module support_triangle(){
	translate([triangle_support_x * 0.5, 0 ,base_z])rotate([0,-90,0])triangle(triangle_support_z,triangle_support_y,triangle_support_x);
}

module washer(){
	color([1,0,0]){
		cylinder(r = m6_washer_r, h = 2);
	}
}

module bolt_hole(){
	cylinder(r = m6_r, h = base_z);
}

module holder(){
	difference(){
		union(){
			base();
			translate([0, side_offset_y, 0]){
				side();
				translate([0, wall_y,0]){
					translate([0.5 * base_x - triangle_support_x,0,0])support_triangle();
					translate([-1 * (0.5 * base_x),0,0])support_triangle();
				}
			}
			translate([0, -1 * side_offset_y - wall_y, 0]){
				side();
				translate([0, wall_y - triangle_support_y,0]){
					rotate([0,0,180]){
						translate([0.5 * base_x - triangle_support_x,0,0])support_triangle();
						translate([-1 * (0.5 * base_x),0,0])support_triangle();
					}
				}
			}
		}
		translate([0, 0.5 * base_y - m6_washer_r, 0])bolt_hole();
		translate([0, -1 * (0.5 * base_y - m6_washer_r), 0])bolt_hole();
	}
}

module rod(padding = 0 ){
	translate([0,0.5 * rod_y + padding,rod_z])rotate([90,0,0])cylinder(r=3.9 + padding,h = rod_y);
}

module support_right(){
	difference(){
	intersection(){
		translate([-0.5 * base_x,side_offset_y,0.5 * base_z])cube([base_x, 0.5 * base_y, base_z + rod_z + retainer_h]); 
		holder();
	}
		rod(0.15);
	}
}

module support_left(){
	union(){
		difference(){
			holder();
			translate([-0.5 * base_x - 0.5,side_offset_y-0.01,0.5 * base_z])cube([base_x + 1, 0.6 * base_y, base_z + rod_z + retainer_h]); 
		}
		rod();
	}
}

support_left();
//support_right();