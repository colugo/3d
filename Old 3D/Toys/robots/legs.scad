include <pins.scad>
include <pin_joints.scad>

hips_r = 19;
hips_washer_r = 10;
hips_washer_h = 2;
hips_bevel = 1;
hips_z_scale = 0.8;
leg_hip_x = 0.55;
thigh_r = 8;
thigh_h = 10;
femur_r = 7;
femur_l = 26;
shin_l=23;
foot_r = 11;

union(){
	hips();
	rotate([180,0,0])translate([hips_r * leg_hip_x,0,0])leg();
	rotate([180,0,0])translate([-1 * hips_r * leg_hip_x,0,0])rotate([0,0,90])leg(right=true);
}

module hips(){
	difference(){
		union(){
			cylinder(h=hips_washer_h, r=hips_washer_r);
			hull(){
				difference(){
					scale([1,1,hips_z_scale])sphere(r=hips_r);
					translate([-1*hips_r,-1*hips_r,0])cube([2*hips_r,2*hips_r,hips_r]);
				}
				cylinder(h=hips_bevel, r=hips_r-hips_bevel);
			}
		}
		#translate([0,0,2])rotate([180,0,0])pinhole(h=10);
	}
}

module leg(right=false){
	translate([0,0,3]){
		rotate([-5,10,0])cylinder(h=thigh_h, r=thigh_r);
		translate([1,0,0])rotate([-5,5,0])cylinder(h=femur_l, r=femur_r);
	}
	translate([2.5,1.2,femur_l]){
		knee();
		cylinder(h=shin_l,r=femur_r);
		translate([0,0,shin_l]){
			if(!right){
				
				rotate([0,0,180])foot();
			}else{
				foot();
			}
		}
	}
}

module knee(){
	_knee();
	translate([0,0,2])rotate([180,0,180])knee();
}

module _knee(){
	hull(){
		cylinder(h=3,r=8.5);
		rotate([2.5,-2.5,0])cylinder(h=4,r=7);
	}
}

module foot(){
	hull(){
		intersection(){
			sphere(r=foot_r);
			rotate([-5,-5,0])translate([-1*foot_r,-1*foot_r,-0.6 * foot_r])cube([2* foot_r, 2 * foot_r, foot_r * 0.8]);
		}
		cylinder(r=foot_r * 0.9, foot_r * 0.3);
	}
}