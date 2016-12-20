bearing_r = 11.1;
retainer_h = bearing_r + 6;
wall_thickness = 2;
idler_h = 15;

module idler(){
	difference(){
		union(){
			translate([0,0,idler_h - wall_thickness]) cylinder(h=wall_thickness, r = retainer_h);
			cylinder(h=idler_h, r = bearing_r + wall_thickness);
			cylinder(h=wall_thickness, r = retainer_h);
		}
		cylinder(h=idler_h, r = bearing_r);
	}
}

module inner(){
	difference(){
		cylinder(h=idler_h, r = bearing_r);
		cylinder(h=idler_h, r = 4);
	}
}


module idler_with_inner(){
	rotate([90,0,0]){
		translate([0,0,-0.5 * idler_h]){
			idler();
			color([0.5,0.5,1])
			inner();
		}
	}
}