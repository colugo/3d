use <bearingMount.scad>;

shaft_r = 3;
shaft_h = 185;



module shaft(){
	cylinder(r=shaft_r,h=shaft_h);
	cylinder(r=shaft_r+2,h=shaft_h - 35);
}

translate([0,0,150])rotate([180,0,0])bearingMount();
bearingMount();
shaft();