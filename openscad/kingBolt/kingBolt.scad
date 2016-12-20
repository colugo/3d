dim_thread = 15;
dim_shaft = 38;
difference(){
	union(){
		translate([0,0,-1])cylinder(r=4.15,h=dim_thread);
		rotate([180,0,0])cylinder(r=3.5,h=dim_shaft - dim_thread);
		translate([0,0,-(dim_shaft - dim_thread) ])rotate([180,0,0])cylinder(r=6,h=5);
	}
	#translate([0,0,-(dim_shaft - dim_thread) - 5.1])
	{
		cylinder(r=3,h=4.1,$fn=6);
		//cube([5,5,5],center=true);
	}
}
