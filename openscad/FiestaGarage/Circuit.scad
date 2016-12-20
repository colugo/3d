//CircuitBoard

battery_rad = 9.3 / 2;
battery_h = 32;
cb_length = 42.5;
cb_thickness = 2;

button_x = 31;
button_y = 9;
button_r = 3 / 2;
button_h = 2.5;

button_hole_r = 8.2 / 2;

hole_x = 15.5;
hole1_y = 9;
hole2_y = cb_length - 7.5;
hole_r = 3/2;

circuit();

module circuit(){
	rotate([ 0, 0, 90]){
		translate([ battery_rad, battery_h * -0.5, cb_thickness * -1]){
			difference(){
				translate([-1, 0, 0])board();
				translate([hole1_y, hole_x, 0])cylinder(r = hole_r, h = 10, center = true, $fn = 10);
				translate([hole2_y, hole_x, 0])cylinder(r = hole_r, h = 10, center = true, $fn = 10);
			}
		}
		battery();
	}
}

module board(){
	color([ 0.1, 0.7, 0.2])cube([cb_length + 1, battery_h, cb_thickness]);
	translate([ button_x, button_y, cb_thickness])color([1, 0 ,0])cylinder(r = button_r, h = 2.5, $fn = 10);
	translate([ button_x, button_y, cb_thickness])color([1, 0 ,0])cylinder(r = button_hole_r, h = 12, $fn = 30);
}


module battery(){
	color([0.9, 0.8, 0])translate([0, battery_h * 0.5 ,0])rotate([ 90, 0, 0])cylinder( r = battery_rad, h = battery_h);
}