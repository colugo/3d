use <base.scad>;
use <cameraKnob.scad>;
pin_x=-35.3;
pin_y = -6.5;
bolt_r = 7.2/2;
pin_r = 4.1/2;
pin_h = 6;

wall_thickness = 3;
bar_r = 8.4;
width = 30;
gap=8;


bar_offset_x = 20 + bar_r;
bar_offset_z = -1 *(bar_r + wall_thickness);
main_thickness = wall_thickness + bar_r * 1.6;

pin_plate_thickness = 5;

base();

module nut(){
	cylinder (h = 5, r=6.4, $fn=6);
}

difference() { 
	union(){
		translate ([-25, width * -0.5, -25]) cube (size = [5, width, 10]) ;
		translate ([-25, width * -0.5, -33]) cube (size = [64.5, width, 8]) ;
		translate ([34.5, width * -0.5, -25]) cube (size = [5, width, 15]) ;
	}
	translate([bar_offset_x,0,bar_offset_z])rotate([90,0,0])cylinder(r=bar_r,h=100,center=true,$fn=60);
	rotate (a = [0, 180, 0]) cylinder(r=bolt_r,h=100,$fn=30);
	translate ([0, 0, -29.9]) nut();
}

//translate ([0, 0, -17]) rotate (a = [180, 0, 0]) cylinder (h = 8, r= width/2+3);

