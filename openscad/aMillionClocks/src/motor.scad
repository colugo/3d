include<config.scad>


module motor(){
	color("LightSlateGray"){
		cylinder(r = rad_motor, h = dim_motor_len - 1);
		cylinder(r = 1.5, h = dim_motor_len);
		translate([ 0, 0, dim_motor_len - dim_motor_mount - 1]){
			rotate([ 0, 0, -40])translate([ rad_motor, 0, 0]) _motor_screw_mount();
			rotate([ 0, 0, 40])translate([ rad_motor, 0, 0]) _motor_screw_mount();
		}
	}
	//translate([ 0, -2, 0])cube(4);
}

module _motor_screw_mount(){
	difference() {
		cylinder(r = 1.5, h = dim_motor_mount);
		cylinder(r = rad_14_screw, h = 3, center = true);
	}
}