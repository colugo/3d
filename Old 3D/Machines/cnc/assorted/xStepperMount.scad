hole_spacing = 48;
face_dim = 55;
stepper_face = 5.12;
length = 80;
stepper_circle_h = 2.1;
stepper_cicrle_r = 20;
m3_length = 14;
m3_available_length = m3_length - stepper_face;

critical_dim = 5;
critical_face = face_dim + 2 * critical_dim;
m3_nut_flats = 5.9;	// normal M3 hex nut exact width = 5.5
m3_nut_depth = 3;	// normal M3 hex nut exact depth = 2.4, nyloc = 4
m3_head_h = 2;
m3_head_r = 2.65;

module stepper(){

	difference(){
		translate([face_dim * -0.5, face_dim * -0.5, 0])cube([face_dim, face_dim, length]);
		for(i = [0:90:360]){
			rotate([0,0,i]){
				translate([face_dim * 0.5 , face_dim * 0.5, stepper_face]){
					cylinder(r=12, h = length);
				}
			}
		}
		motor_bolt_holes();
	}
	translate([0,0,-25])cylinder(r=4, h=25);
	translate([0,0,-1 * stepper_circle_h])cylinder(h=stepper_circle_h, r=stepper_cicrle_r);
}

module motor_bolt_holes(){
	for(i = [0:90:360]){
		rotate([0,0,i]){
			translate([hole_spacing * 0.5 , hole_spacing * 0.5,-2]){
				cylinder(r=2, h = 15);
			}
		}
	}
}

module motor_bolts(){
	color([0,0,1])
	for(i = [0:90:360]){
		rotate([0,0,i]){
			translate([hole_spacing * 0.5 , hole_spacing * 0.5,0]){
				//translate([0,0,m3_length])cylinder(r = m3_head_r, h = m3_head_h);
				//cylinder(r=1.8, h = m3_length);
				translate([0,0,0.5 * m3_nut_depth])hexagon(m3_nut_flats, m3_nut_depth);
			}
		}
	}
}


module cable_space(){
	hull(){
		translate([0,0,-20])cylinder(r=16, h=20);
		translate([0,-30,-20])cylinder(r=16, h=20);
	}
}

module mount(){
	
	union(){
		translate([critical_face * -0.5, critical_face * -0.5, 0])cube([critical_face, critical_face, m3_available_length]);
		translate([-0.5 * critical_face, -0.5 * critical_face,0])difference(){
			cube([critical_dim, critical_face, length + critical_dim]);
			#translate([-1,critical_dim,m3_available_length])cube([10,10,13]);
		}
		translate([-0.8 * critical_face, -0.5 * critical_face, 0])cube([critical_face * 1.5, critical_dim, length + critical_dim]);
		translate([-0.5 * critical_face, -0.5 * critical_face, 25])rotate([0,180,0])triangle(critical_face * 0.3,critical_face * 0.8, critical_dim);
		translate([-0.5 * critical_face, -0.5 * critical_face, length - 18 - critical_dim])rotate([0,180,0])triangle(critical_face * 0.3,critical_face * 0.8, critical_dim);
	}
	
	
}

module mounting(){
	color([0,1,0])
	translate([0,critical_face * -0.5 + 8, 0]){
		rotate([90,0,0]){
			translate([critical_face * 0.58, 10,0])cylinder(h=10, r = 3);
			translate([critical_face * 0.58, length - 8,0])cylinder(h=10, r = 3);
			translate([critical_face * -0.65, 10,0])cylinder(h=10, r = 3);
			translate([critical_face * -0.65, length - 8,0])cylinder(h=10, r = 3);			
		}
	}
}

module triangle(h,b,w){
	linear_extrude(height = w, center = true, convexity = 10, twist = 0)
	polygon(points=[[0,0],[h,0],[0,b]], paths=[[0,1,2]]);
}

module hexagon(size, height) {
	boxWidth = size/1.75;
	rotate([0,0,90])
	for (r = [-60, 0, 60]) rotate([0,0,r]) cube([boxWidth, size, height], true);
}

/*

rotate([90,0,0])
{
	union(){
		//color([0.5,0.5,0.5])translate([0,0,m3_available_length])stepper();
		//color([0,0,1])motor_bolts();
		difference(){
			mount();
			mounting();
			translate([0,0, m3_available_length])cable_space();
			motor_bolt_holes();
			motor_bolts();
			translate([0,0, m3_available_length])stepper();
		}
	}
}

*/

stepper();