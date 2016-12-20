use <keyhole.scad>;

module mounting_holes(){
	dim_gap_y_left = 43;
	dim_gap_y_right = 38;
	dim_gap_x = 29;
	rad_m3 = 1.6;
	$fn = 30;

	translate([ dim_gap_x * -0.5, 0, 0]){
		// bottoms	
		cylinder(r=rad_m3, h = 50, center=true);
		translate([ dim_gap_x, 0, 0])cylinder(r=rad_m3, h = 50, center=true);

		// tops
		translate([ 0, dim_gap_y_left, 0])cylinder(r=rad_m3, h = 50, center=true);
		translate([ dim_gap_x, dim_gap_y_right, 0])cylinder(r=rad_m3, h = 50, center=true);
	}

}

module plate(){
	dim_width = 80;
	dim_height = 55;
	dim_thickness = 5;
	rad_corner = 10;
	dia_corner = 2 * rad_corner;
	
	minkowski(){
		translate([ -0.5 * (dim_width - dia_corner), 3.5, 0])cube([ dim_width - dia_corner, dim_height - dia_corner, dim_thickness]);
		cylinder(r = rad_corner, h = 0.001);
	}
}

difference(){
	plate();
	mounting_holes();
	
	translate([0,18,5])rotate([ 180, 0, 180]){
		translate([ 32,0,0])keyhole();
		translate([ -32,0,0])keyhole();	
	}
	
	cube([51,200,4.2],center=true);
}
