use <Thread_Library.scad>

rad_lower = 10 / 2;
rad_upper = 32.9 / 2;
dim_low_h = 15;


translate([0,0,2.5])
difference(){
	cylinder(r=rad_upper + 4,h=5,center=true);	
	cylinder(r=rad_upper,h=100,center=true);
}

translate([ 0, 0, -1 * dim_low_h - 4])
difference(){
	cylinder(r=rad_lower + 6,h=8,center=true);	
	cylinder(r=rad_lower,h=100,center=true);
}


rotate([0,180,0])
difference(){
	cylinder(r1 = rad_upper + 4, r2 = rad_lower+6,h=dim_low_h);
	cylinder(r1 = rad_upper, r2 = rad_lower,h=dim_low_h);
}