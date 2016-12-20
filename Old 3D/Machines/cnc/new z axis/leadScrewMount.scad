use <bearingMount.scad>;

mount_h = 15;
mount_x = 40;
mount_y = 40;

difference(){
	translate([mount_x * -0.5, mount_y * -0.5, 0 ])cube([mount_x, mount_y, mount_h]);
	bearingMount();
	bearingMountHoles();
}
