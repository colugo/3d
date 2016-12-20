// bird lamp clamp
use <Thread_Library.scad>
rad_pole = 12.73 / 2;
rad_clampOuter = rad_pole * 1.5;
dim_clampH = 15;
rad_shade = 42/2;
rad_shadeOuter = 65 / 2;
m3_len = 14;

///
length=13;
pitch=3;
pitchRadius=rad_shade - 5.7; 

rad_tap = 1.2;
rad_pass = 1.7;
///


//side1();
side2();

//nut();

module nut(){
	difference(){
		union(){
			cylinder(r = rad_shade + 5, h = 8);
			for(r = [0:360/15:360])rotate([0,0,r])
			translate([ rad_shade + 4, 0, 0])cylinder(r = 3, h = 8);
		}
		female();
	}
}

module side1(){
	difference(){
		union(){
			cylinder(r = rad_clampOuter, h = dim_clampH);
			intersection(){
				cylinder(r = rad_shade - 5, h = dim_clampH);
				//translate([ rad_clampOuter * -2, m3_len * -0.5, 0])cube([ rad_clampOuter * 4, m3_len, dim_clampH]);
				male();
			}
			translate([ 0, 0, -3])cylinder(h = 3, r = rad_shade + 5);
			translate([ 0, 0, -8])cylinder(r1 = rad_clampOuter, h = 5, r2 = rad_shade + 5);
		}
		translate([ 0, 0, -1])cylinder(r = rad_pole, h = 100, center = true); 
		
		translate([ 9, 0, 7])rotate([90, 0, 0]){
			cylinder(r = rad_tap, h = 100, center = true, $fn = 30);
			cylinder(r = rad_pass, h = 100, $fn = 30);
			translate([ 0, 0, 4])cylinder(r = 4, h = 100, $fn = 30);
		}
		
		translate([ -9, 0, 7])rotate([90, 0, 0]){
			cylinder(r = rad_tap, h = 100, center = true, $fn = 30);
			cylinder(r = rad_pass, h = 100, $fn = 30);
			translate([ 0, 0, 4])cylinder(r = 4, h = 100, $fn = 30);
		}
	
		
		translate([ -50, -0.5, -50])cube([100,100,100]);
	}
}

module side2(){
	difference(){
		union(){
			cylinder(r = rad_clampOuter, h = dim_clampH);
			intersection(){
				cylinder(r = rad_shade - 5, h = dim_clampH);
				//translate([ rad_clampOuter * -2, m3_len * -0.5, 0])cube([ rad_clampOuter * 4, m3_len, dim_clampH]);
				male();
			}
			translate([ 0, 0, -3])cylinder(h = 3, r = rad_shade + 5);
			translate([ 0, 0, -8])cylinder(r1 = rad_clampOuter, h = 5, r2 = rad_shade + 5);
		}
		translate([ 0, 0, -1])cylinder(r = rad_pole, h = 100, center = true); 
		
		translate([ 9, 0, 7])rotate([90, 0, 0]){
			cylinder(r = rad_tap, h = 100, center = true, $fn = 30);
			cylinder(r = rad_pass, h = 100, $fn = 30);
			translate([ 0, 0, 4])cylinder(r = 4, h = 100, $fn = 30);
		}
		
		translate([ -9, 0, 7])rotate([90, 0, 0]){
			cylinder(r = rad_tap, h = 100, center = true, $fn = 30);
			cylinder(r = rad_pass, h = 100, $fn = 30);
			translate([ 0, 0, 4])cylinder(r = 4, h = 100, $fn = 30);
		}
	
		
		translate([ -50, -99.5, -50])cube([100,100,100]);
	}
}


//color([1,0,0])difference(){
//	cylinder(r = rad_shadeOuter, h = 2);
//	translate([ 0, 0, -1])cylinder(r = rad_shade, h = 4);
//}

module male(){
rotate([ 0, 0, 80])
trapezoidThread(
	length=length, 			// axial length of the threaded rod 
	pitch=pitch, 			// axial distance from crest to crest
	pitchRadius=pitchRadius, 	// radial distance from center to mid-profile
	threadHeightToPitch=0.5, 	// ratio between the height of the profile and the pitch 
						// std value for Acme or metric lead screw is 0.5
	profileRatio=0.5, 			// ratio between the lengths of the raised part of the profile and the pitch
						// std value for Acme or metric lead screw is 0.5
	threadAngle=30,			// angle between the two faces of the thread 
						// std value for Acme is 29 or for metric lead screw is 30
	RH=true, 				// true/false the thread winds clockwise looking along shaft, i.e.follows the Right Hand Rule
	clearance=0.1, 			// radial clearance, normalized to thread height
	backlash=0.1, 			// axial clearance, normalized to pitch
	stepsPerTurn=24 			// number of slices to create per turn
		);		
}
module female(){
rotate([ 0, 0, 80])
trapezoidThreadNegativeSpace(
	length=length, 			// axial length of the threaded rod 
	pitch=pitch, 			// axial distance from crest to crest
	pitchRadius=pitchRadius, 	// radial distance from center to mid-profile
	threadHeightToPitch=0.5, 	// ratio between the height of the profile and the pitch 
						// std value for Acme or metric lead screw is 0.5
	profileRatio=0.5, 			// ratio between the lengths of the raised part of the profile and the pitch
						// std value for Acme or metric lead screw is 0.5
	threadAngle=30,			// angle between the two faces of the thread 
						// std value for Acme is 29 or for metric lead screw is 30
	RH=true, 				// true/false the thread winds clockwise looking along shaft, i.e.follows the Right Hand Rule
	clearance=0.1, 			// radial clearance, normalized to thread height
	backlash=0.1, 			// axial clearance, normalized to pitch
	stepsPerTurn=24 			// number of slices to create per turn
		);		
}