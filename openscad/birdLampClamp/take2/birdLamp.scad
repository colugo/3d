use <Thread_Library.scad>
use <MThread.scad>

rad_lower = 12 / 2;
rad_upper = 32.9 / 2;
dim_low_h = 15;

body();

module topNut(){
	
	intersection(){
		scale([0.95,0.95,0.95])hex_nut(12);
		//cylinder(r=8.5,h=50,center=true);
		difference(){
			translate([0,0,1.5])sphere(r=9);
			translate([0,0,12.5])cube([20,20,10],center=true);
		}
		translate([7,0,0])cube([30,30,30],center=true);
	}
}

module body(){
	translate([0,0,2.5])
	difference(){
		rotate([0,0,2.5])cylinder(r=rad_upper+2.8,h=5,center=true,$fn=24);	
		cylinder(r=rad_upper,h=100,center=true);
	}

	translate([ 0, 0, -1 * dim_low_h - 4])
	difference(){
		cylinder(r=rad_upper + 4,h=8,center=true);	
		cylinder(r=rad_lower,h=100,center=true);
	}


	rotate([0,180,0])
	difference(){
	
		union(){
			//cylinder(r1 = rad_upper + 2, r2 = rad_upper + 4,h=dim_low_h);
			male();
		}
		cylinder(r=rad_lower,h=100,center=true);
		cylinder(r1 = rad_upper, r2 = rad_lower,h=dim_low_h);
	}


	difference(){
		translate([0,0,-15 - 8])cylinder(r= 32,h=8);
		cylinder(r=rad_upper,h=100,center=true);
	}
	
	translate([0,0,-23])scale([0.95,0.95,0.95])hex_nut(12);
	
}

module nut(){
	difference(){
		
			hull(){
			scale([0.9,0.9,1])
			translate([0,0,-2])
			union(){
				cylinder(r = 32, h = 8);
				for(r = [0:360/10:360])rotate([0,0,r])
				translate([ 32-4, 0, 0])cylinder(r = 8, h = 8);
			}
		
			union(){
				cylinder(r = 32, h = 8);
				for(r = [0:360/10:360])rotate([0,0,r])
				translate([ 32-4, 0, 0])cylinder(r = 8, h = 8);
			}
			}
		
			female();
	}

}


module female(){
rotate([ 0, 0, 80])
trapezoidThreadNegativeSpace(
	length=10, 			// axial length of the threaded rod 
	pitch=2.5, 			// axial distance from crest to crest
	pitchRadius=rad_upper+3.5, 	// radial distance from center to mid-profile
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

module male(){
rotate([ 0, 0, 80])
trapezoidThread(
	length=20, 			// axial length of the threaded rod 
	pitch=2.5, 			// axial distance from crest to crest
	pitchRadius=rad_upper+3.5, 	// radial distance from center to mid-profile
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