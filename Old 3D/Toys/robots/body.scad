include <pins.scad>
include <pin_joints.scad>

body_r = 18;
body_h = 38;
bevel_h = 2;

//translate([-1 * body_r,0,body_h/2 - shoulder_r]){
//	shoulder();
//	forearm();
//}

body();

module body(){
	difference(){
		hull(){
			cylinder(r=body_r, h=body_h - 2* bevel_h, center=true);
			cylinder(r=body_r-bevel_h, h=body_h, center=true);
			
		}
		for(i = [0:180:360]){
			rotate([0,0,i])	translate([body_r,0,body_h/2 - shoulder_r])rotate([0,-90,0])pinhole(h=9, t=tolerance);
		}
		translate([0,0,-1 * body_h/2])pinhole(h=9,t=tolerance);
		translate([0,0,body_h/2])rotate([0,180,0])pinhole(h=9,t=tolerance);
	}
	translate([0,-1 * body_r,3])cube([body_r, body_r* 0.3, body_h * 0.6], center=true);
}