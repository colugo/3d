include <gears.scad>;
$fn = 100;
rad_major = 40 / 2;
dim_major = 25;
rad_roundover = 2;//6;
rad_ratraction = 1;
dim_gap = 0.3;

rad_rotor = 5;
rad_hub = rad_major - rad_rotor;

translate([0,0,0.05])base_knob();
knob_grip("bottom");
//rotor_planet();

module rotor_planet(){
	rotate([0,0,360*R*$t])translate([(ns+np1)/pitch/2,0,0])rotate([0,0,-360*R*(1+Rp)*$t])
	color([0,0,1])planet();
}


module knob_grip(thread_pos = "bottom"){

	rad_indents = 50;
	dim_indents = 5;

	color("khaki")
	difference() {
		cylinder(r1 = rad_major + 1, r2 = rad_major - rad_ratraction + 1, h = dim_major - rad_roundover - dim_gap);
		cylinder(r=rad_hub + dim_gap, h = dim_major * 3, center = true);
		//for(r = [0:360/9:360])rotate([0, 0, r])translate([ rad_indents + rad_major + 0.2, dim_indents * 0.5, 0.5 * (dim_major - rad_roundover) + 4])rotate([90,0,0])cylinder(r=rad_indents,h=dim_indents,$fn = $fn * 4);
		if(thread_pos == "bottom"){
			translate([0,0, -0.1])cylinder(r = rad_major, h = 5.1 + dim_gap);
		}
		if(thread_pos == "top"){
			translate([0,0, dim_major - rad_roundover - 5.2])cylinder(r = rad_major, h = 5.1 + dim_gap);
		}
	}
	if(thread_pos == "bottom"){
		color([0.5,0.5,0.5])ring1();
	}
	if(thread_pos == "top"){
		translate([0,0, dim_major - rad_roundover - 5.5])color([0.5,0.5,0.5])ring1();
	}
	for(r = [0:360/9:360])rotate([0, 0, r])translate([rad_major,0,(dim_major - rad_roundover) * 0.5])scale([0.3,1,2])sphere(3);
}

module base_knob(){
	
	rad_depress = 200;
	
	color("DodgerBlue")
	difference() {
		rotate_extrude(convexity=10)
			rotate([90,0,0])
				difference(){
					union(){
						polygon(points=[[0,0],[rad_major,0],[rad_major - rad_ratraction,dim_major - rad_roundover],[rad_major - rad_ratraction - rad_roundover,dim_major],[0,dim_major]], paths=[[0,1,2,3,4]]);
						translate([rad_major - rad_ratraction - rad_roundover,dim_major - rad_roundover,0])circle(rad_roundover);
					}
					//translate([0,rad_depress + dim_major - 1,0])
					//	circle(rad_depress, $fn = 100);
					translate([ rad_hub - dim_gap, 0, 0])square(dim_major - rad_roundover);
				}
		rotate([0,0,360*R*$t])translate([(ns+np1)/pitch/2,0,0])rotate([0,0,-360*R*(1+Rp)*$t]){
			translate([0,0,-0.1])cylinder(r=9.5,h=4.5 + 0.1);
			cylinder(r=plug + dim_gap * 2,h=t * 3);
		}
		difference() {
			translate([0,0,-0.1])cylinder(r=13.5, h=22);
			rotate([0,0,360*R*$t])translate([(ns+np1)/pitch/2,0,0])rotate([0,0,-360*R*(1+Rp)*$t])cylinder(r=plug * 1.8, h= 23);
		}
	}

}
