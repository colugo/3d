// Leg
include <dims.scad>;
use <ybrace.scad>;

leg();

module leg(){
	dim_hypLength = ASA(90 - ang_vertical,dim_tableHeight - dim_thickness,90);
	dim_upperLeg = dim_lowerLeg + ASA(90, dim_hypLength, ang_vertical);
	filletYLow = ASA(90 - ang_vertical, dim_thickness, ang_vertical);
	filletYUp = ASA(ang_vertical, dim_thickness, 90 - ang_vertical);
	
	difference(){
		union(){
			// lower leg
			cube([ dim_critical, dim_lowerLeg, dim_thickness]);

			// vertical
			translate([ 0, dim_lowerLeg, 0])mirror([ 0, 1, 0])rotate([ ang_vertical, 0, 0])cube([ dim_critical, dim_thickness, dim_hypLength]);
	

			// upper leg
			translate([0,0,dim_tableHeight - dim_thickness])cube([ dim_critical, dim_upperLeg, dim_thickness]);

			// lower fillet
			translate([ 0, dim_lowerLeg - dim_thickness+ filletYLow, dim_thickness])fillet(rad_lower, ang_vertical, dim_critical);
	
			// upperFillet
			translate([0, dim_upperLeg - dim_thickness ,dim_tableHeight - dim_thickness])mirror([ 0, 0, 1])fillet(rad_upper, -ang_vertical, dim_critical);
		}
		translate([0,0,-1])rotate([0,0, ang_horizontal / 4])mirror([0,1,0])cube([1000,1000,1000]);
		rotate([ 0, 0,ang_horizontal / 4])translate([ -100 + dim_baseExtension, 0, 0])cube([200,200,2000], center=true);
		
		translate([ dim_critical * -0.5, 0, -1 * dim_ply])plate();
		translate([ dim_critical * -0.5, 0, dim_thickness - dim_ply])plate();
		
		translate([ dim_critical * -0.5, 0, dim_tableHeight -1 * dim_ply])plate();
		translate([ dim_critical * -0.5, 0, dim_tableHeight -1 * dim_ply - dim_thickness])plate();
	}

}


module fillet( rad, angle, thickness ){
	yAmt = ASA((angle+90)/2, rad, 90-((angle+90)/2));
	difference(){
		mirror([ 1, 0, 0])rotate([ -angle, 0, 0])rotate([ 0, -90, 0])slice(r = yAmt, deg = angle + 90, thick = thickness);
		translate([ -1, -yAmt, rad])rotate([ 0, 90, 0])cylinder(r = rad, h = thickness + 2);
	}
}

module slice(r = 10, deg = 30, thick = 10) {
	degn = (deg % 360 > 0) ? deg % 360 : deg % 360 + 360;
	difference() {
		cylinder(r = r, h = thick);
		if (degn > 180) intersection_for(a = [0, 180 - degn]) rotate(a) translate([-r, 0, -1]) cube([r * 2,r * 2,thick + 2]);
		else union() for(a = [0, 180 - degn]) rotate(a) translate([-r, 0, -1]) cube([r * 2,r * 2,thick + 2]);
	}
}
