dim_thickness = 16;
angle_screw = 15;
$fn=60;

jig();

module jig(){
	difference() {
		union(){
			//cube([55,50,dim_thickness]);
			//mirror([1,0,0])color([1,0,0])cube([50,50,dim_thickness]);
			color([0,1,0])translate([0,-15,dim_thickness])mirror([1,0,0])cube([90,30,20]);
			hull(){
				color([0,1,0])translate([-70,-15,dim_thickness + 20])mirror([1,0,0])cube([20,30,5]);
				color([0,1,0])translate([0,-15,dim_thickness])mirror([1,0,0])cube([20,30,5]);
				color([0,0,1])translate([-95,-15,dim_thickness])mirror([1,0,0])rotate([0,360-angle_screw,0])cube([1,30,25]);
			}

		}
		translate([0,0,0.5 * dim_thickness])rotate([0,90 + angle_screw,0])cylinder(r=4, h=500, center=true);
		translate([0,0,0.5 * dim_thickness])rotate([0,90 + angle_screw,0])translate([0,0,-105])cylinder(r=5, h=100, center=true);
	}
}

module stopper(){

difference() {

	cylinder(r=12, h=10,center = true);
	cylinder(r=4, h=11,center = true);
	translate([-1,0,-10])cube([2,15,20]);
	translate([0,7.5,0])rotate([0,90,0])cylinder(r=1.2,h=100,center = true);
	translate([0,7.5,0])rotate([0,90,0])cylinder(r=1.6,h=100);
	translate([5,7.5,0])rotate([0,90,0])cylinder(r=3.5,h=100);

}
}