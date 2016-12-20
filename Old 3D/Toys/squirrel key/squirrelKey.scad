keyhead_thickness = 2.4;


module squirrel(){
	import("squirrel.stl");
}

module keyhead(){
	translate([0,35,-15])mirror([0,1,0])rotate([90,0,90])linear_extrude(file = "keyhead.dxf",  height = keyhead_thickness, center = true, convexity = 10);
}


module face(){
	color([1,0,0])
	intersection(){
		squirrel();
		translate([-50,-100,0])cube([100,100,100]);
	}
}

module tail(left=0){
	color([0,1,0])
	difference(){
		intersection(){
			squirrel();
			translate([-1 * left,0,0])cube([100,100,100]);
		}
		keyhead();
	}
}

face();
//tail();
//tail(100);



/*
%squirrel();
keyhead();
*/