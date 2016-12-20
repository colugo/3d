side_width = 25;
side_height = 30;
side_circle = side_width / 3;
total_width = side_width + 40;
amount = side_width *0.6;
recess = 0.4;

module half_side() {
	translate([0,side_width*0.5,0])
	difference(){
		union(){
			hull(){
				translate([side_width * 0.5 ,side_height,0])circle(side_circle);
				translate([0,side_height * 0.6,0])square([side_width / 2,side_width * 0.5]);
			}
			square([side_width / 2,side_height]);
		}
		translate([side_width * 0.5 ,side_height,0])circle(3.5 / 2);
	}

}



module side(flip){
	translate([-1.5,-1.5,-3])rotate([0,flip,-45]){
		difference(){
			linear_extrude(height = 3, center = false){
				half_side();
				rotate([0,180,0])half_side();
				difference(){
					translate([0,0, 0]){
						rotate([0,0,45]){
							square([side_width, side_width]);
						}
					}
				}
			}
			screw_recess();
		}
		side_ramp();

	}		
}

module screw_recess(){
	translate([side_width * 0.5 ,side_height + side_width*0.5,-3])sphere(side_circle / 2);
	translate([-side_width*0.5 ,side_height + side_width*0.5,-3])sphere(side_circle / 2);
}

module side_ramp(){
	color([0,1,0]){
		translate([0,0,-5.5])rotate([10,0,0])
		linear_extrude(height = 3, center = false){
			hull(){
				translate([0,15,0]){
					circle(side_width * 0.3);
					translate([0,side_width * 0.5,0])square(side_width / 2, center=true);
				}
			}
		}
	}
}

module wrong_corner(){
	translate([-1.5,-1.5,-1.5]){
		union(){
			translate([0,0,1.5])side(0);
			translate([0,-4.5,0])rotate([90,0,0])side(180);
			translate([-4.5,0,0])rotate([0,-90,0])side(180);
		}
		translate([amount * recess,amount * recess,amount * recess])sphere(amount);
	}
}

module corner(){
	difference(){
		difference(){
			wrong_corner();
			color([1,0,0])cube([100,100,100]);
		}
		translate([3,3,3])#sphere(6,center=true);
	}
}

//rotate([45,45,90])
corner();
