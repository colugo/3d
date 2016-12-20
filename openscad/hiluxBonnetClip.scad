$fn = 100;

rad_main = 9/2;
rad_outer = rad_main * 3;
dim_outer_h = 2;
dim_main_h = 8;
rad_hole = 3.5/2;
rad_tap = 1.3;
dim_teeth_h = 5;


module base(){
	difference() {
		union(){
			cylinder(r=rad_outer,h=dim_outer_h);
			cylinder(r=rad_main,h=dim_main_h + dim_outer_h);

			difference(){
				cylinder(r=rad_main,h=dim_main_h + dim_teeth_h + dim_outer_h);
				translate([ 0, 0, dim_teeth_h * 0.5 + dim_outer_h + dim_main_h])cube([9.1, 6,dim_teeth_h + 0.1],center = true);

			}
		}
		
		cylinder(r=rad_tap,h=100, center=true);
	}
}



module top(){
	translate([ 0, 0, dim_main_h + dim_outer_h + 0.1])
	difference() {
		cylinder(r=rad_outer,h=dim_outer_h);
		translate([ 0, 3.75, 0])cube([7,1.8,dim_main_h * 4], center = true);
		translate([ 0, -3.75, 0])cube([7,1.8,dim_main_h * 4], center = true);
		cylinder(r=rad_hole,h=10, center=true);
	}
}


base();
//top();