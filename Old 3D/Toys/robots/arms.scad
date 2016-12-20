include <pins.scad>
include <pin_joints.scad>

tolerance = 0.3;

shoulder_r = 10;
shoulder_h = 15;
washer_h = 1;

arm_h = 25;
arm_lower_percent = 0.8;
arm_lower_h = arm_h * arm_lower_percent;
arm_a = 60;


union(){
	shoulder(type=1, left=true);
	forearm();
	//hand();
}

module shoulder(type = 1, left=true){
	if(!left){
		rotate([0,0,180]){
			translate([washer_h + shoulder_h,0,0])_shoulder(type);
		}
	}
	else{
		_shoulder(type);
	}
}

module _shoulder(type){
	difference(){
		union(){
			rotate([0,90,0]){
				translate([0, 0, -1 * washer_h])cylinder(r=5,h=washer_h);
				translate([0, 0, -1 * shoulder_h])cylinder(r=shoulder_r, h = shoulder_h-washer_h);
			}
			
			difference(){
				translate([-1 * shoulder_h,0 ,0]){
					scale([0.5,1,1]){
						sphere(r=shoulder_r * 0.9);
					}
				}
				if(type==2){
					translate([-1.75 * shoulder_h,0,0]){
						sphere(r=shoulder_r);
					}
				}
			}
		}
		
		rotate([0,-90,0])pinhole(h=10);
	}
}

module forearm(){
	type1_r = 7;
	translate([-1 * washer_h + -0.5 * (shoulder_h - washer_h),0,-1 * arm_h]){
		cylinder(r=type1_r, h=arm_h-shoulder_r/2);
		sphere(r=type1_r);
		
		rotate([arm_a,0,0]){
			translate([0,0, -1 * arm_lower_h]){
				
				difference(){
					cylinder(r=type1_r, h=arm_lower_h);
					pinhole(h=10, t=tolerance);
				}	
				
			}
		}
	}
}




module hand(type=1){
	type1_r = 9;
	type1_h = 7;
	difference(){
		union(){
			
			translate([0,0, -1 * type1_h]){
				cylinder(r=type1_r, h=type1_h);
				scale([1,1,0.7]){
					sphere(r=type1_r * 0.8);
				}
				for(r=[0:120:360]){
					rotate([0,0,r]){
						translate([0,type1_r * 0.6,-5]){
							rotate([30,0,0])cube([type1_r * 0.5, type1_r * 0.5, 10], center=true);
							translate([0,1.2,-7.5]){
								rotate([-10,0,0])
								cube([type1_r * 0.5, type1_r * 0.5, 10], center=true);
							}
						}
					}
				}
			}
			
			rotate([180,0,0])pinhole();
		}
	}
}