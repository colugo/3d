include<roundRect.scad>;

base_length = 60;
base_height = 7;
base_width = 60;
mounting_hole_radius = 3.1;
mounting_hole_offset = 8;
fn = 100;
boltOffset = 3;
bearingMount_r = 6;
slider_h = 20;

support_w = 21;
support_h = 3.5;


608_d=7;
608_r=11;
m8_d = 12;
m8_r = 3.5;

//pipe();
roller();

module roller(){
	difference() { 
		union(){
			translate([ 0, 0, -0.5 * base_height])
			roundRect( 
					size = [ base_width, base_length, base_height],
					center = true,
					holeRadius = mounting_hole_radius,
					holeOffset = mounting_hole_offset,
					fn = fn,
					holeTaper = true,
					taperType = "m6",
					cornerRadius =  5
					);
			angleSupport( base_length - 15, 38, 15 );
		}
		m8Bolts();
		support();
	}
}

module m8Bolts(){
		translate ([-12, boltOffset, 9]) rotate (a = [0, -45, 0]) bearing608Bolt();
		rotate (a = [0, 0, 180])  translate ([-12, boltOffset, 9]) rotate (a = [0, -45, 0]) bearing608Bolt();
}

module support(){
	translate ([0, 0, 0.5 * support_h - base_height - 0.1]) cube (size = [support_w, base_length -20, support_h], center = true);
}

module bearing608Mount(){
	//%cylinder (h = 608_d, r = 608_r ); 
	translate ([0, 0, -2]) cylinder (h = 2, r = bearingMount_r, $fn = fn ); 
}

module bearing608Bolt(){
	translate ([0, 0, -m8_d + 0.1]) cylinder (h = m8_d, r = m8_r, $fn = fn ); 
}


module angleSupport(length, width, height){
		union(){
			hull () { 
				translate ([0, length * 0.5 - width * 0.375, 0])  scale (v = [1, 0.75, 1])  rightCylinder( width / 2, height );
				translate ([0, length * -0.5 - width * -0.375, 0])  scale (v = [1, 0.75, 1])  rightCylinder( width / 2, height );
			}
			translate ([-12, boltOffset, 9]) rotate (a = [0, -45, 0]) bearing608Mount();
			rotate (a = [0, 0, 180])  translate ([-12, boltOffset, 9]) rotate (a = [0, -45, 0]) bearing608Mount();
		}	
}

module rightCylinder( baseR, height){
	extra = baseR - height;
	cylinder (h = height, r1 = baseR, r2 = extra, $fn = fn);
}

module pipe(){
	color ([0,1,0]) translate ([0, 0, 27]) rotate (a = [90, 0, 0])  cylinder(r=10,h=100, center = true);
}