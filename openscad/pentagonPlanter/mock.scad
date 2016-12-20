dim_side = 30;
dim_thickness = 5;

scale(0.5)face();

module full(){
	half();
	translate([ 0, 0, 66.9])rotate([180,0,0])half();
}

module half(){
	face();
	for(r = [0:360/5:360])
	rotate([ 0, 0, r])
	translate([ 0, -41.3 / 2, 0])rotate([ -63.5, 0, 0])translate([ 0, -41.3 / 2, 0])rotate([ 0, 0, 180])face();
}

module face(){
	for(r = [0 : 360 / 5 : 360]){
		rotate([ 0, 0, r])translate([  -0.5 * dim_side, -1.5 * dim_thickness  - 13.15, 0])
		side();
	}
}

module side(){	
	rad_ang = -65.9;
	rad_propper = 58.25;
	difference() {
		cube([dim_side, 1.5 * dim_thickness, dim_thickness]);
		#rotate([ rad_propper, 0, 0])translate([ -0.5, 0, 0])cube([dim_side + 1, 1.5 * dim_thickness, dim_thickness]);
		rotate([ 0, rad_ang, 0])cube(dim_thickness * 1.5 + 1);
		translate([ dim_side, 0, 0])mirror([ 1, 0, 0])rotate([ 0, rad_ang, 0])cube(dim_thickness * 1.5 + 1);
	}
}