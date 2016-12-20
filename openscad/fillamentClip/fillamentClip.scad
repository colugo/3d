$fn = 30;
rad_fillamet = 1.6;
rad_clip = 6;
dim_prong = 1.5;
dim_hieght = 9;

inner();
translate([ rad_clip * 1.6, 0, 0])inner();

module inner(){
	rotate([ 180, 0, 0]){
		difference() {
			union(){
				cube([dim_prong, 2 * rad_clip, dim_hieght], center=true);
				rotate([ 0, 0, 90])cube([dim_prong, 2 * rad_clip, dim_hieght], center=true);
			}
			cylinder( h=4 * dim_hieght, r=rad_fillamet, center=true);
			translate([ 0, 0, dim_hieght * -0.376])cylinder( h= 0.25 * dim_hieght, r2 = 0, r1=rad_clip - 2.5, center=true);
		}
		difference() {
			cylinder(r = rad_clip, h=dim_hieght, center=true);
			cylinder(r = rad_clip - 2.5, h=dim_hieght * 2, center=true);
		}
	}
}