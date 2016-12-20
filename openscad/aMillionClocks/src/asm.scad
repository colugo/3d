$fn = 30;

use<motorGear.scad>
use<handGear.scad>
include<config.scad>
use<motor.scad>
use<frame.scad>


module asm(){
	rotate([0,0,5]){
		//hourGear();
		translate([ 0, 0, dim_hand_hour_height + dim_gear_thickness / 2])rotate([ 180, 0, 0])hourHand();
	}


	translate([ 0, 0, dim_gear_thickness + dim_gear_layer]){
		//rotate([0,0,5])minuteGear();
		rotate([ 0, 0, -rad_hour_motor])
		translate([ -1 * dim_axle_offset, 0, 0]){
		}
	}

	translate([ 0, 0, 2 *dim_gear_thickness + dim_gear_layer + dim_hand_minute_height])rotate([180,0,34])minuteHand();

}

//minuteHand();
//minuteGear();
//hourGear();
//hourHand();

asm();
//motorFrame();

//motor();

//face();

module face(){
	difference() {
		cylinder(r=rad_face,h=20, center = true);
		cylinder(r=rad_face - 2 ,h=25, center = true);
	}
}