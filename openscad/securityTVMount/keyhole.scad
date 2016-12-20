rad_keyhole_head = 10 / 2;
dim_keyhole_head = 2.5;
rad_keyhole_neck = 4 / 2;
dim_keyhole_neck = dim_keyhole_head * 2;



module keyhole(length = 10){
	$fn = 30;
	translate([ 0, 0, -0.1]){
		cylinder(r = rad_keyhole_head, h = dim_keyhole_head + 1);
	
		hull(){
			translate([ 0, rad_keyhole_head, 0])cylinder(r = rad_keyhole_neck, h = dim_keyhole_neck);
			translate([ 0, rad_keyhole_head * 1.5, 0])cylinder(r = rad_keyhole_neck, h = dim_keyhole_neck);
		}
		hull(){
			translate([ 0, 0, dim_keyhole_head])cylinder(r = rad_keyhole_head, h = length);
			translate([ 0, rad_keyhole_head * 1.5, dim_keyhole_head])cylinder(r = rad_keyhole_head, h = length);
		}
	}
}

difference(){
	translate([ -5, -3.5, 0])minkowski(){cube([ 10, 15, 1]);cylinder(r=5,h=4);}
	keyhole();
}