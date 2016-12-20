use<parametric_involute_gear_v5.0.scad>
include<config.scad>

module handGear(){
	if(fast){
		cylinder(r=dim_axle_offset - 6, h=dim_gear_thickness);
	}
	if(!fast){
		gear (
			circular_pitch=qty_circular_pitch,
			bore_diameter = 0,
			number_of_teeth = num_hand_teeth,
			gear_thickness = dim_gear_thickness,
			rim_thickness = dim_gear_thickness,
			hub_thickness = dim_gear_thickness,
			circles=8);
	}
}


module minuteGear(){
	color("DarkSeaGreen"){
		difference() {
			union(){
				handGear();
				cylinder(h = dim_hand_minute_height, r=rad_hour_tube);
				translate([ 0, 0, dim_hand_minute_height])cylinder(r=dim_hand_minute_connector, h = dim_hand_thickness, $fn = 6);
			}
			cylinder(h = 40, r=rad_hour_tube-1 , center=true);
		}
	}
}

module minuteHand(){
	color("OliveDrab"){
		difference() {
			union(){
				cylinder(r = dim_hand_width / 2, h = dim_hand_thickness);
				//cylinder(h = dim_hand_minute_height, r=rad_hour_tube);
				translate([- 0.5 * dim_hand_width, 0, 0])cube([dim_hand_width,dim_hand_minute, dim_hand_thickness]);
			}
			rotate([ 0, 0, 90])cylinder(r=dim_hand_minute_connector + 0.1, h = 100, $fn = 6, center = true);
		}
	}
}

module hourHand(){
	color("Chocolate"){
		difference() {
			union(){
				cylinder(h = dim_hand_thickness, r=rad_hour_tube + 0.5);
				translate([- 0.5 * dim_hand_width, 0, 0])cube([dim_hand_width,dim_hand_hour, dim_hand_thickness]);
				cylinder(h = dim_hand_hour_height - dim_gear_thickness, r=rad_hour_tube - 1.1);
				//translate([-0.5 * dim_hand_hour_connector, -0.5 * dim_hand_hour_connector, dim_hand_hour_height - dim_gear_thickness]) cube([dim_hand_hour_connector, dim_hand_hour_connector, dim_gear_thickness / 2 + dim_gear_layer]);
			}
			translate([ 0, 0, dim_hand_hour_height - ( dim_14_screw )]) cylinder(r=  rad_14_screw, h=dim_14_screw);
		}
		cylinder(r = dim_hand_width / 2, h = dim_hand_thickness + 0.45 );
	}
}


module hourGear(){
	color("BurlyWood"){
		difference() {
			union(){
				//handGear();
				cylinder(r=5,h=dim_gear_layer + dim_gear_thickness);
			}
			translate([ -0.5 * dim_hand_hour_connector, -0.5 * dim_hand_hour_connector, dim_gear_thickness / 2])cube([dim_hand_hour_connector, dim_hand_hour_connector, 20]);
			cylinder( h = 20, r= rad_14_screw_pass, center=true);
		}
		difference() {
			translate([ 0, 0, dim_gear_thickness * 1])cylinder(r = 18,h=dim_gear_layer);
			cylinder(r=16,h=20,center = true);
		}
	}

}