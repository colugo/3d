include <pins.scad>
include <pin_joints.scad>

rotate([90,0,0])

union(){
	pin();
	translate([0,0,0.1])rotate([0,180,0])pin();
}
