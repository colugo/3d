use<parametric_involute_gear_v5.0.scad>
include<config.scad>

module motorGear(){
	if(fast){
		cylinder(r = 6, h = dim_gear_thickness);
	}
	if(!fast){
		gear (
			circular_pitch=200,
			bore_diameter = motor_bore,
			number_of_teeth = num_motor_teeth,
			gear_thickness = dim_gear_thickness,
			rim_thickness = dim_gear_thickness,
			hub_thickness = dim_gear_thickness,
			circles=0);
	}
}
