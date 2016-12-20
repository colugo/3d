slide_width = 40;
slide_depth = 2.5;
slide_height = 55;

module slide() {
	color([0,0,1])translate([-slide_width/2,-21.5,0])cube([slide_width, slide_height, slide_depth]);
}

module star(){
translate([0,0,-5])
linear_extrude(height = 10) import("star.dxf");
}

difference(){
slide();
star();
}