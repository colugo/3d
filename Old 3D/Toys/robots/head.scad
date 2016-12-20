include <pins.scad>
include <pin_joints.scad>

head_r = 14;
head_h = 20;
bevel_h = 2;
eyeAngle = 35;

module eyeconnector(){
	pin(h=8, r=2.5, lh=3, lt=0.5, t=0.2, side=true);
	translate([0,1.5,0])rotate([0,0,180])pin(h=8, r=2.5, lh=3, lt=0.5, t=0.2, side=true);
}


module springy(){
	union(){
		pin(h=8, r=2.5, lh=3, lt=0.5, t=0.2, side=true);
		translate([0,-21.5,0])rotate([0,0,180])pin(h=8, r=2.5, lh=3, lt=0.5, t=0.2, side=true);
		difference(){
			translate([-2.5,-21.5,0.05])	cube([5,21.5,3.5]);
			translate([1,-3,0])scube();
			translate([-1,-7,0])scube();
			translate([1,-11,0])scube();
			translate([-1,-15,0])scube();
			translate([1,-19,0])scube();
		}
	}
}

module scube(){
	cube([5,2.5,10],center=true);
}

//translate([0,0,26])rotate([90,0,0])springy();
asm();
//translate([0,0,10])bauble();

module bauble(){
	br=6;
	difference(){
		translate([0,0,br])sphere(r=br);
		pinhole(h=8, r=2.5, lh=3, lt=0.5, t=0.2);
	}
}

module inplaceeye(rot=0){
	translate([-1 * head_r,0,2])rotate([0,90,0]){
		eye(rot);
	}

}

module eye(rot = 0){
	eye_r = 6;
	rotate([rot,rot,0]){
		intersection(){
			sphere(r=6);
			rotate([20,10,0])cube([2 * eye_r,2 * eye_r,0.8 * eye_r], center=true);
		}
		translate([0,0,-1.5])sphere(r=4);
	}
}


module asm(){

	difference(){
		head();
		rotate([0,0,6])translate([0,0,-6])smile();
	}
}

module head(){
	rotate([0,0,eyeAngle])inplaceeye();
	rotate([0,0,-1 * eyeAngle])inplaceeye(180);
	difference(){
		hull(){
			cylinder(r=head_r, h=head_h - 2* bevel_h, center=true);
			translate([0,0,-1])cylinder(r=head_r-bevel_h, h=head_h, center=true);
		}
		translate([0,0,-1 * head_h/2 -0.9])pinhole(h=9,t=tolerance);
		//translate([0,0,head_h/2 - 1])rotate([180,0,0])pinhole(h=8, r=2.5, lh=3, lt=0.5, t=0.2);
	}
}

module tooth(a){
	tooth_w = 4;
	rotate([0,a,0]){
		hull(){
			translate([0,head_r * 0.5,0])cube([tooth_w * 0.35,1,0.1], center=true);
			translate([0,head_r * 1.2,0])cube([tooth_w,1,2], center=true);
		}
	}
}

module smile(){
	teeth = 6;
	for(t=[1:1:teeth]){
		rotate([0,0,26 * t - 13])tooth(15);
		rotate([0,0,26 * t])tooth(-15);
	}
}