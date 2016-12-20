

OpeningLength = 75;
OpeningHeight = 30;
HandleWidth = 12;
HandleThickness = 6;
FrontLarger = 0;
BottomThicker = 1;

// Calibrated for an M8 bolt:
BoltWrenchSize = 13.4;
BoltHeadDepth = 6;
BoltRadius = 4.3;

UseSHCS = false;
SocketCapScrewHeadRadius = 6.7;


$fn=60;



difference() {
//Handle Outside:
translate([0,-BottomThicker,0])
hull() {
translate([OpeningLength,0,0])
   cylinder(r=OpeningHeight/2+HandleThickness, h=HandleWidth);
 	cylinder(r=OpeningHeight/2+HandleThickness, h=HandleWidth);
	//Box on bottom of handle
	translate([OpeningLength/2-(BoltWrenchSize*3)/2,-OpeningHeight/2-4*HandleThickness,0])
  	cube([BoltWrenchSize*3,BoltHeadDepth,HandleWidth]);
}


// Handle cutout
	hull() {
		translate([OpeningLength,0,-0.5])
   			cylinder(r=OpeningHeight/2 + FrontLarger/2, h=HandleWidth+1);
		translate([0,0,-0.5])
   		cylinder(r=OpeningHeight/2, h=HandleWidth+1);
	}


translate([-70,-125,-0.1])cube([200,100,6.1]);
translate([19,-32,0])cylinder(r=1.2, h=100, center=true);
translate([55,-32,0])cylinder(r=1.2, h=100, center=true);
translate([(55 - 19) * 0.5 + 19,-32,0])cylinder(r=1.2, h=100, center=true);
} // end difference

difference(){
	union(){
		translate([0,0,3])rotate_extrude($fn=20)translate([OpeningHeight/2, 0, ])circle(r = 3, $fn=30);
		translate([OpeningLength,0,3])rotate_extrude($fn=20)translate([OpeningHeight/2, 0, ])circle(r = 3, $fn=30);

		translate([0,0,HandleWidth - 3])rotate_extrude($fn=20)translate([OpeningHeight/2, 0, ])circle(r = 3, $fn=30);
		translate([OpeningLength,0,HandleWidth - 3])rotate_extrude($fn=20)translate([OpeningHeight/2, 0, ])circle(r = 3, $fn=30);
		
		difference(){
			translate([OpeningLength,0,3])cylinder(r=OpeningHeight/2 + 3, h=HandleWidth - 6 );
			translate([OpeningLength,0,-0.5])cylinder(r=OpeningHeight/2 -3, h=HandleWidth+1 );
		}
		
		difference(){
			translate([0,0,3])cylinder(r=OpeningHeight/2 + 3, h=HandleWidth - 6 );
			translate([0,0,-0.5])cylinder(r=OpeningHeight/2 -3, h=HandleWidth+1 );
		}
		
	}
	translate([0,-OpeningHeight * 0.5,-10])cube([OpeningLength, OpeningHeight, 100]);
}

hull(){
	translate([0,OpeningHeight/2,3])rotate([0,90,0])cylinder(r=3, h = OpeningLength);
	translate([0,OpeningHeight/2,HandleWidth - 3])rotate([0,90,0])cylinder(r=3, h = OpeningLength);
}

hull(){
	translate([0,OpeningHeight/-2,3])rotate([0,90,0])cylinder(r=3, h = OpeningLength);
	translate([0,OpeningHeight/-2,HandleWidth - 3])rotate([0,90,0])cylinder(r=3, h = OpeningLength);
}

