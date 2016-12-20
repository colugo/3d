include<config.scad>

dim_frame_length = dim_axle_offset + 1;
dim_motor_block_len = 5;
dim_motor_block_thickness = 9;

module motorFrame(){
	rad = rad_hour_tube + dim_frame_wall;

	difference() {
		union(){
			cylinder(h=dim_frame_thickness, r = rad);
			translate([ 0, -rad, 0])cube([dim_frame_length, 2 * rad, dim_frame_thickness]);
		}
		translate([ 0, 0, -1])cylinder(h=dim_frame_thickness + 2, r = rad_hour_tube + dim_gap);
	}

	translate([ dim_frame_length - dim_motor_block_len, - rad, -dim_motor_block_thickness]){
		cube([dim_motor_block_len, 2 * rad, dim_motor_block_thickness]);
	}
}



