top_r = 19.4 / 2;
top_h = 6;
base_r = 31.4 / 2 + 0.2;
base_h = 5.2;
hole_r = 3.5 / 2;
hole_mount_r = 23.15 / 2;
bore_r = 8 / 2;
hole_h = 50;

bearingMount();

module bearingMount(){
	difference(){
		union(){
			cylinder(r=base_r, h=base_h,$fn=base_r*4);
			translate([0,0,base_h])cylinder(r=top_r,h=top_h);
		}
		bearingMountHoles();
	}
}

module bearingMountHoles(){
	translate([0,0,-10]){
		for(i=[0:90:360]){
			rotate([0,0,i]){
				translate([hole_mount_r,0,0])cylinder(r=hole_r,h=hole_h, $fn=hole_r * 10);
			}
		}
		cylinder(r=bore_r, h=hole_h, $fn=bore_r * 10);
	}
}