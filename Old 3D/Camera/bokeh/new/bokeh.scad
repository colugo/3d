gap = 0.25;
slide_width = 40;
slide_depth = 2.5;
slide_height = 41;
holder_thickness = 2;

holder_width = slide_width + ( holder_thickness * 2 );
holder_height = slide_height + holder_thickness;

retainer_height = holder_height / 8;

bokeh_outer_d = 57;
bokeh_outer_fudge = 0.25;
bokeh_outer_r = bokeh_outer_d / 2;
bokeh_inner_r = slide_width / 2;
bokeh_outer_h = 3;
bokeh_body_thickness = 3;



module slide() {
	color([0,0,1])cube([slide_width + gap, slide_height + gap, slide_depth + gap], center = true);
}


module slide_holder() {
	color([0,1,0])
	difference() {
		translate([0,-holder_thickness / 2, 0])cube([holder_width, holder_height, slide_depth], center = true);
		slide();
	}
	translate([0,17.3,0]) slide_retainer();
	translate([0,-15,0]) slide_retainer();
}

module slide_retainer() {
	translate([0,0,holder_thickness])
	color([0,1,0]) {
		difference(){
			cube([holder_width, retainer_height, holder_thickness], center = true);
			cube([holder_width - ( 4 * holder_thickness ), retainer_height + gap, holder_thickness + gap], center = true);
		}
	}
}

module bokeh_body() {
	translate([0,0,-bokeh_body_thickness + 0.25]) {
		cylinder(bokeh_body_thickness, bokeh_outer_r - bokeh_outer_fudge, bokeh_outer_r - bokeh_outer_fudge, center = true);
	}
	bokeh_body_grip();
}

module bokeh_body_grip(){
	difference() {
		translate([0,0,-1]) {
			cylinder(bokeh_body_thickness * 2, bokeh_outer_r, bokeh_outer_r, center = true);
		}
		difference(){
			cube([bokeh_outer_d,bokeh_outer_d, 10], center = true);
			cube([bokeh_outer_d,bokeh_outer_d / 2, 10], center = true);
		}
		rotate([0,0,-10])cube([holder_width, holder_height,10], center = true);
		cube([holder_width, holder_height,10], center = true);
	}
	
	
}

module bokeh_body_contractor() {
	translate([bokeh_outer_r - 4,10,0])rotate([0,0,-10])cube([3,40,10], center = true);
}

module bokeh(){
	difference(){
		bokeh_body();
		cylinder(10, bokeh_inner_r, bokeh_inner_r, center = true);
		bokeh_body_contractor();
		rotate([0,0,180])bokeh_body_contractor();

	}
}

union() {
	slide_holder();
	//slide();
	bokeh();
}