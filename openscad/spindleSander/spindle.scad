rad_spindle = 25;
rad_wall = 6;
dim_spindle_h = 20;
rad_inner = 10;
rad_hole = 5;

difference(){
union(){
difference(){
	cylinder(r = rad_spindle, h = dim_spindle_h);
	cylinder(r = rad_spindle - rad_wall, h = dim_spindle_h * 3, center=true);
}

difference(){
	cylinder(r = rad_inner, h = dim_spindle_h);
	cylinder(r = rad_hole, h = dim_spindle_h * 3, center=true);
}

for(rot = [0:120:360])rotate([0,0,rot + 90])
translate([ rad_inner - 2, rad_wall * -0.5,0])cube([rad_spindle - rad_inner, rad_wall, dim_spindle_h]);
}
translate([ 0, rad_spindle + 2 , 0])cube([2,10,100],center=true);
}