include <Pulley_T-MXL-XL-HTD-GT2_N-tooth.scad>
use <pins.scad>;

retainer = 1;
retainer_ht = 2;
idler = 1;
idler_ht = retainer_ht;
teeth = 17;
motor_shaft = 0;
pulley_t_ht = 7;	// length of toothed part of pulley, standard = 12
pulley_b_ht = 0;	// pulley base height, standard = 8. Set to same as idler_ht if you want an idler but no pulley.
pulley_b_dia = 8;	// pulley base diameter, standard = 20
no_of_nuts = 1;		// number of captive nuts required, standard = 1
nut_angle = 90;		// angle between nuts, standard = 90
nut_shaft_distance = 1.2;	// distance between inner face of nut and shaft, can be negative.

m6=12.2;

axle_recess_depth=5;
axle_r = 3.8;

608_d=7;
608_r=11.15;
frame_wall=3.5;
main_r = 608_r + frame_wall;
frame_l = 55;
frame_h = 15;

bar_r = 8.4;
frame_bar_r = bar_r + frame_wall;
frame_squeze_w = 5;
frame_squeze_l = 20;

608_support = (frame_h - 608_d)/2;

m6_h = 5.1;
bar_offset_x = main_r/bar_r;

tightner_h=15;

lever_l = 70;

module m6nut(){
	rotate([0,0,30])cylinder(r=m6/2,h=m6_h,$fn=6);
}

module myPulley(){
	color([0.8,0,0])
	union(){
		translate([0,0,idler_ht])
		difference(){
			pulley ( "T5" , T5_pulley_dia , 1.19 , 3.264 );
			//translate([0,0,-1*idler_ht-0.1])cylinder(r=axle_r,h=axle_recess_depth,$fn=20);
			translate([0,0,-1*idler_ht])coupling(doPin=false);
		}
		//translate([0,0,608_support/-2])b608_support();
	}
}

module b608_support(){
	difference(){
		cylinder(r2=6,r1=5.5,h=608_support,center=true);
		cylinder(r=axle_r,h=608_support+2,center=true,$fn=20);
	}
}

module axle(){
	color([0.7,0.7,0.7])rotate([0,90,0])cylinder(r=axle_r,h=2*axle_recess_depth + frame_h,$fn=20);
}

module asm(){
	myPulley();
	translate([0,0,axle_recess_depth])rotate([0,90,0])axle();
	frame();
	translate([0,0,-1*608_d])b608();
	translate([-1 * bar_r-1,frame_l - frame_squeze_l/3 - bar_r + 1,frame_h/-2])rotate([0,-90,0])tightner();
	translate([0,0,-1*frame_h])rotate([0,180,-90])applier();
	translate([main_r*0.5,0,-1*frame_h-10])rotate([-90,180,90])lever();
	translate([-1*lever_l,0,-1*frame_h-10])rotate([90,180,90])handle();
}

module b608(){
	difference(){
		cylinder(r=608_r,h=608_d,center=true);
		cylinder(r=4,h=608_d+1,center=true);
	}
}

module tube(or,ir,h){
	difference(){
		cylinder(r=or,h=h,center=true,$fn=60);
		cylinder(r=ir,h=h+2,center=true);
	}
}

module frame(){
	translate([0,0,-0.5 * frame_h])
	color([0.7,0.7,0.7]){
		union(){
			difference(){
				union(){
					hull(){
						translate([bar_offset_x,0,0])tube(or=frame_bar_r,ir=bar_r,h=frame_h);
						translate([bar_offset_x,frame_l,0])tube(or=frame_bar_r,ir=bar_r,h=frame_h);
					}
					hull(){
						tube(or=main_r,ir=608_r,h=frame_h);
						translate([bar_offset_x,0,0])tube(or=frame_bar_r,ir=bar_r,h=frame_h);
					}
				}
				cylinder(r=608_r,h=frame_h+2,center=true);
				translate([bar_offset_x,frame_l,0])cylinder(r=bar_r,h=frame_h+2,center=true);
				translate([bar_offset_x,frame_l - frame_squeze_l/2 - bar_r + 1,0])cube([frame_squeze_w,frame_squeze_l,frame_h+2],center=true);
				translate([bar_offset_x,frame_l - frame_squeze_l - bar_r + 1,0])cylinder(r=frame_squeze_w/2,h=frame_h+2,center=true,$fn=30);
				translate([0,frame_l - frame_squeze_l/3 - bar_r + 1,0])rotate([0,90,0])cylinder(r=3.2,h=40,$fn=20,center=true);
				translate([bar_r+0.25,frame_l - frame_squeze_l/3 - bar_r + 1,0])rotate([0,90,0])m6nut();
			}
			translate([0,0,(frame_h-608_support)/2])tube(or=main_r,ir=7,h=608_support);
		}
	}
}

module tightner(){
	color([0.8,0,0])
	union(){
		difference(){
			cylinder(r=frame_h/2,h=2,$fn=40);
			cylinder(r=3.1,h=30,$fn=40,center=true);
		}
		translate([0,0,2])
		difference(){
			hull(){
				union(){
					cylinder(r=frame_h*0.8,h=8,$fn=40);
					for(r=[0:360/5:360]){
						rotate([0,0,r])translate([frame_h-4,0,0])cylinder(r=4,h=8,$fn=40);
					}
				}

			}
			
			rotate([0,0,35])
			for(r=[0:360/5:360]){
				rotate([0,0,r])translate([frame_h+2,0,0])scale([1,1.5,1])cylinder(r=6,h=20,center=true,$fn=40);
			}
			translate([0,0,3.01])m6nut();
			cylinder(r=3.1,h=30,$fn=40,center=true);
		}
	}
}

asm();