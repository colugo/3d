ball_r = 4;
ball_support_h = 8;
ball_support_inner_r = 2;
ball_support_outer_r = 2.8;

/*
	0.05 : is pretty tight ( has caused splitting )
	0.07 : untested
	0.1 : is too loose
*/
socket_gap = 0.07;
socket_walls = 0.8;
socket_outer_r = ball_r + (2 * socket_walls);
socket_inner_r = ball_r + 2 * socket_gap;
socket_opening = (ball_support_inner_r + ball_support_outer_r) * 0.6;

mounting_dim = 4;

hand_inner_r = 2.5;
hand_d = 7;
hand_l = 10;

bicep_upper_r = 4.5;
bicep_upper_l = 18;
forearm_l = 14;
forearm_r = 4;

torso_l = 35;
torso_w = 30;
torso_r = socket_outer_r;

hips_l = 20;
hips_r = socket_outer_r;

femur_upper_r = 4.5;
femur_upper_l = 25;

head_l = 18;
head_r = socket_outer_r;

shin_upper_r = 4.5;
shin_upper_l = 30;

foot_d = 5;
foot_w = 10;
foot_l = 8;

module asm(){
	translate([0,0,torso_l + 0.7 * ball_support_h])head();
	torso();
	translate([0,torso_w * -0.5 + ball_support_h * -0.7,torso_l * 0.66]){
		bicep();
		translate([0,0,-0.9 * bicep_upper_l - socket_inner_r + 1 - ball_support_h]){
			forearm();
			translate([0,0,-1 * forearm_l - 2*socket_inner_r + 2]){
				rotate([0,0,90])hand();
			}
		}
		translate([0,-2 * (torso_w * -0.5 + ball_support_h * -0.7),0])rotate([0,0,180]){
			bicep();
			translate([0,0,-0.9 * bicep_upper_l - socket_inner_r + 1 - ball_support_h]){
				forearm();
				translate([0,0,-1 * forearm_l - 2*socket_inner_r + 2]){
					rotate([0,0,90])hand();
				}
			}
		}
	}
	translate([0,0,-0.7 * ball_support_h]){
		rotate([0,0,90]){
			hips();
			translate([-1.1 * ball_support_h,0,hips_l * -0.7]) {
				rotate([0,0,180])femur();
				translate([0,0,-0.9 * femur_upper_l - socket_inner_r + 1 - ball_support_h]){
					shin();
					translate([0,0,-0.9 * shin_upper_l - socket_inner_r + 1 - ball_support_h]){
						rotate([0,0,180])foot();
					}
				}
			}
			rotate([0,0,180]){
				translate([-1.1 * ball_support_h,0,hips_l * -0.7]) {
					rotate([0,0,180])femur();
					translate([0,0,-0.9 * femur_upper_l - socket_inner_r + 1 - ball_support_h]){
						rotate([0,0,180])shin();
						translate([0,0,-0.9 * shin_upper_l - socket_inner_r + 1 - ball_support_h]){
							foot();
						}
					}
				}
			}
		}
	}
}

//rotate([0,90,0])torso();
//rotate([90,0,90])bicep();
//rotate([90,0,90])forearm();
//rotate([90,0,90])hand();
//rotate([90,0,90])hips();
//rotate([90,90,0])femur();
//rotate([0,90,90])head();
//rotate([90,0,90])shin();
foot();
//rotate([90,90,90])sword();
//rotate([90,90,90])knife();

//asm();

//translate([0,50,-50])sword();

module knife(){
	cylinder(r1 = hand_inner_r, r2 = hand_inner_r, hand_d * 1.5);
	scale([1.5,3,1])translate([0,0,hand_d * 1.5])rotate([0,0,90])hexagon(3, 2);
	blade_h = 20;
	blade_tip = 7;
	hull(){
		scale([1,3,1])translate([0,0,hand_d * 1.5 + blade_h * 0.5])rotate([0,0,90])hexagon(2, blade_h);
		translate([0,2,hand_d * 1.5 + blade_h + blade_tip])sphere(r=1);
	}
}


module sword(){
	sphere(r=hand_inner_r * 1.5);
	cylinder(r1 = hand_inner_r, r2 = hand_inner_r, hand_d * 2.5);
	scale([1,3,1])translate([0,0,hand_d * 2.5])rotate([0,0,90])hexagon(8, 2);
	blade_h = 80;
	blade_tip = 10;
	hull(){
		scale([1,3,1])translate([0,0,hand_d * 2.5 + blade_h * 0.5])rotate([0,0,90])hexagon(3, blade_h);
		translate([0,0,hand_d * 2.5 + blade_h + blade_tip])sphere(r=1);
	}
}


module foot(){
	difference(){
		union(){
			180_socket();
			translate([0,0,-1 * foot_d - socket_outer_r * 0.5]){
				hull(){
					foot_part();
					translate([0,0,1.5])rotate([-3,0,0])scale([0.8,0.9,1])foot_part();
				}
			}
			difference(){
				translate([0,0,-7.5])rotate([0,0,90])flat_cylinder(12.5,socket_outer_r);
				translate([0,0,9])cube([10,10,10], center = true);
			}
		}
		180_socket_hollow();
		translate([0,foot_l,-1 * foot_d])rotate([00,0,90])mounting(mounting_dim, 2 * foot_d);
	}
}

module foot_part(){
	hull(){
		translate([0,foot_l,0.5 * foot_d])scale([1,1.5,1])rotate([0,0,90])hexagon(foot_w, foot_d);
		translate([-0.33 * foot_w, -0.33 * foot_w - 2,0])cube([0.66 * foot_w, 0.66 * foot_w, foot_d]);
	}
}

module shin(){
	union(){
		difference(){
			union(){
				90_socket(hole=false);
				translate([0,0,-1 * shin_upper_l - socket_inner_r + 1])rotate([0,0,0])flat_cylinder(shin_upper_l, shin_upper_r);
			}
			translate([0,0,-0.24 * shin_upper_l - socket_inner_r + 1])rotate([90,0,90])mounting(mounting_dim, 10);
			translate([0,0,-0.50 * shin_upper_l - socket_inner_r + 1])rotate([90,0,90])mounting(mounting_dim, 10);
			translate([0,0,-0.75 * shin_upper_l - socket_inner_r + 1])rotate([90,0,90])mounting(mounting_dim, 10);
			90_socket_hollow();
		}
		translate([0,0,-0.9 * shin_upper_l - socket_inner_r + 1 - ball_support_h])ball();
	}
}

module head(){
	rotate([0,180,90]){
		difference(){
			union(){
				intersection(){
					translate([0,0,-1 * head_l + socket_outer_r * 0.5])rotate([0,0,90])flat_cylinder(head_l * 2, head_r);			
					90_socket();
				}
				translate([0,0,-1 * head_l + socket_outer_r * 0.5])rotate([0,0,90])flat_cylinder(head_l, head_r);
			}
			90_socket_hollow();
			90_socket_hollow_angle();
			translate([0,0, -0.45 * head_l])rotate([90,0,0])mounting(mounting_dim, 2 * head_r);
		}
	}
}

module femur(){
	union(){
		difference(){
			union(){
				rotate([0,0,90])90_socket(hole=false);
				translate([0,0,-1 * femur_upper_l - socket_inner_r + 1])rotate([0,0,0])flat_cylinder(femur_upper_l, femur_upper_r);
			}
			translate([0,0,-0.33 * femur_upper_l - socket_inner_r + 1])rotate([90,0,90])mounting(mounting_dim, 10);
			translate([0,0,-0.66 * femur_upper_l - socket_inner_r + 1])rotate([90,0,90])mounting(mounting_dim, 10);
			90_socket_hollow();
		}
		translate([0,0,-0.9 * femur_upper_l - socket_inner_r + 1 - ball_support_h])ball();
	}
}


module hips(){
	hip_socket_r = 6;
	hip_socket_h = -0.55 * hips_l;
	difference(){
		union(){
			180_socket();
			translate([0,0,-1 * hips_l + socket_outer_r * 0.5])rotate([0,0,90])flat_cylinder(hips_l, hips_r);
		}
		180_socket_hollow();
		translate([0,0, -0.35 * hips_l])rotate([90,0,0])mounting(mounting_dim, 2 * hips_r);
		scale([1,1,1.5]){
			translate([hips_r * 1.5,hips_r, hip_socket_h])rotate([90,0,0])cylinder(r1 = hip_socket_r, r2 = hip_socket_r, h=2*hips_r);
			translate([hips_r * -1.5,hips_r,hip_socket_h])rotate([90,0,0])cylinder(r1 = hip_socket_r, r2 = hip_socket_r, h=2*hips_r);
		}
	}
	translate([-1.1 * ball_support_h,0,hips_l * -0.7])rotate([0,90,0])ball();
	translate([1.1 * ball_support_h,0,hips_l * -0.7])rotate([0,-90,0])ball();
}

module torso(){
	difference(){
		union(){
			flat_cylinder(torso_l, torso_r);
			translate([0,-0.5 * torso_w,0.66 * torso_l])rotate([0,90,90])rotate([0,0,90])flat_cylinder(torso_w, torso_r);
			translate([0,0,-0.7 * ball_support_h])ball();
			translate([0,0,torso_l + 0.7 * ball_support_h])rotate([0,180,0])ball();
			translate([0,torso_w * 0.5 + 0.7 * ball_support_h ,0.66 * torso_l])rotate([90,0,0])ball();
			translate([0,torso_w * -0.5 + -0.7 * ball_support_h ,0.66 * torso_l])rotate([270,0,0])ball();
		}
		translate([0, torso_w * 0.3 , 0.66 * torso_l])rotate([90,0,90])mounting(mounting_dim, 2 * torso_r);
		translate([0, torso_w * -0.3 , 0.66 * torso_l])rotate([90,0,90])mounting(mounting_dim, 2 * torso_r);
		translate([0,0, 0.66 * torso_l])rotate([90,0,90])mounting(mounting_dim, 2 * torso_r);
		translate([0,0, 0.44 * torso_l])rotate([90,0,90])mounting(mounting_dim, 2 * torso_r);
		translate([0,0, 0.22 * torso_l])rotate([90,0,90])mounting(mounting_dim, 2 * torso_r);
	}
}

module hand(){
	union(){
		rotate([180,0,0])ball();
		translate([0,0,-1.31 * ball_support_h])
		rotate([90,0,0])
		difference(){
			hexagon(hand_l, hand_d);
			
			translate([0,0,-0.5 * hand_d - 1])cylinder(r1 = hand_inner_r, r2 = hand_inner_r, h = hand_d + 2);		
			translate([3.3,-3.3,0])rotate([0,0,90])cube([2.5 * hand_inner_r,2.5 * hand_inner_r,hand_d + 2], center = true);
		}
	}
	
}

module forearm(){
	difference(){
		union(){
			90_socket();
			translate([0,0,-1 * forearm_l - socket_inner_r + 1])rotate([0,0,90])flat_cylinder(forearm_l, forearm_r);
			translate([0,0,-1 * forearm_l - 2*socket_inner_r + 2])rotate([0,180,0])90_socket();
		}
		translate([0,0,-0.5 * forearm_l - socket_inner_r + 1])rotate([90,0,0])mounting(mounting_dim, 10);
		90_socket_hollow();
		translate([0,0,-1 * forearm_l - 2*socket_inner_r + 2])90_socket_hollow();
	}
}

module bicep(){
	union(){
		difference(){
			union(){
				90_socket(hole=false);
				translate([0,0,-1 * bicep_upper_l - socket_inner_r + 1])rotate([0,0,0])flat_cylinder(bicep_upper_l, bicep_upper_r);
			}
			translate([0,0,-0.5 * bicep_upper_l - socket_inner_r + 1])rotate([90,0,90])mounting(mounting_dim, 10);
			90_socket_hollow();
		}
		translate([0,0,-0.9 * bicep_upper_l - socket_inner_r + 1 - ball_support_h])ball();
	}
}


module flat_cylinder(l,r){
	difference(){
		union(){
			translate([0,0,0.5 * r])scale([1,1,0.5])sphere(r);
			translate([0,0,l - 0.5 * r])scale([1,1,0.5])sphere(r);
			translate([0,0,0.5 * r])cylinder(h = l - r, r1 = r, r2 = r, $fn = 5 * r);
		}
		difference(){
			
			translate([-1.6 * r,-2 * r,-0.5 * l])cube([r * 3.2, r *  4, 2*l]);
			translate([-0.8 * r,-1 * r,0])cube([r * 1.6, r *  2, l]);
		}
	}
}


module ball(){
	color([0.4,0,1]){
		union(){
			sphere(r = ball_r, $fn = 5*ball_r);
			cylinder(h = ball_support_h, r1 = ball_support_inner_r, r2 = ball_support_outer_r);
		}
	}
}

module 180_socket(){
	color([0.2,1,0.2]){
		difference(){
			intersection(){
				sphere(r = socket_outer_r, $fn = 5*socket_outer_r);
				translate([-1 * socket_outer_r, 0,-0.3 * socket_outer_r])rotate([0,90,0])cylinder(r1 = socket_outer_r, r2 = socket_outer_r, h=2 * socket_outer_r, $fn = 5*socket_outer_r);
				cube([30,socket_outer_r * 1.6,30],center=true);
			}
			180_socket_hollow();
		}
	}
}

module 180_socket_hollow(){
	90_socket_hollow();
	scale([0.9,2,1])translate([0 ,0 ,0.3 * socket_outer_r])sphere(r = ball_r, $fn = 5*ball_r);

}

module 90_socket(hole = false){
	color([1,0,0.4]){
		difference(){
			sphere(r = socket_outer_r, $fn = 5*socket_outer_r);
			90_socket_hollow();
			90_socket_hollow_angle()
			if(hole){
				rotate([90,0,0])cylinder(h=2 * socket_outer_r, r1 = ball_support_inner_r, r2 = ball_support_inner_r, $fn = 4*socket_opening);
				translate([0 , -1.4 * socket_outer_r, 0])sphere(r = ball_r, $fn = 5*ball_r);
			}
		}
	}
}

module 90_socket_hollow(){
	sphere(r = socket_inner_r, $fn = 5*socket_inner_r);
}

module 90_socket_hollow_angle(){
	translate([-1 * socket_opening,0,0])cube([2 * socket_opening, 10, 10]);
	translate([0 ,0 ,1 * socket_outer_r])sphere(r = ball_r, $fn = 5*ball_r);
	translate([0 , 1 * socket_outer_r, 0])sphere(r = ball_r, $fn = 5*ball_r);
	translate([0 , 0.6 * socket_outer_r, 0.6 * socket_outer_r])sphere(r = ball_r, $fn = 5*ball_r);
}

module mounting(size, height){
	//hexagon(size, height);
	translate([-0.5 * size, -0.5 * size,-0.5 * height])cube([size,size,height]);
}

module hexagon(size, height) {
	boxWidth = size/1.75;
	rotate([0,0,90])
	for (r = [-60, 0, 60]) rotate([0,0,r]) cube([boxWidth, size, height], true);
}