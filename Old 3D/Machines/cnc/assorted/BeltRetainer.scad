// Y-belt retainer/tensioner
// May 2012 John Newman

// This parameter deterimes how far the belt is held above the deck
dRise = 0;			// Added to the depth to make the belt run horizontal

// Belt dimensions - These are for T2.5, see below for T5
//tBase = 1.25;		// Thickness of belt base
//tFull = 2.0;			// Thickness of Belt at teeth
//wTooth = 1.4;		// Width of tooth (not actual, req)
//wSpace = 1.1;		// Width of space
//wBelt = 6.2;		// Width of belt

// Belt dimensions - These are for T5
tBase = 1.5;		// Thickness of belt base
tFull = 2.7;			// Thickness of Belt at teeth
wTooth = 2.6;		// Width of tooth (not actual, req)
wSpace = 2.4;		// Width of space
wBelt = 6.2;		// Width of belt

belt_offset_z = 7;
m6_r = 4;
m6_washer_r = 9;
m6_head_h = 6.1;

// Misc params
wHex = 6.9;		// Width of trap for hex nut
dHex	= 2.5;			// Depth of trap for hex nut
rM3 = 1.7;			// Radius of M3 bolt hole
sDrop = wHex/2-0.5; //2.8;		// Driver screw drop from base of slider
Adjust = 0.5;		// Spacing for things to fit inside other things!
pWidth = 9;			// Screw platform width
pHeight = 5;		// Screw platform height

// Base parameters
bwExt = 20;		// Widest part of base
bwInt = 15;			// inside width, where slider goes
blExt = 30;			// Overall length of base
blHed = 6;			// Head of base whch takes the strain !
bdExt = 12.5;		// This included a minimum floor thickness of 2mm (?)
bRoof = 2.2;		// The thickness of the roof which holds the slider in
bFloor = 1;			// The thickness of the floor under the slider (minimum)
bdSoc = bdExt-(bRoof+bFloor);		// 'Socket' depth for slider to go in

// Slider parameters
swMax = bwInt - Adjust;	// Wide part of slider
sdMax = bdSoc-Adjust;		// Height of slider

lBelt = blExt*2;		// Length of a bit of belt!
rMsk = blExt/3 ;		// Radius of part of mount masking...


// Print the parts as req.
translate([0,15,blExt/2]) rotate([0,90,90]) basepart();

module sliderpart() {
	difference() {
		cube([blExt-blHed,swMax,sdMax],center=true);
		// Make a hole for the bolt end
		translate([(blExt-blHed)/2-2,0,(sdMax/2)-sDrop]) rotate([30,0,0]) rotate([0,90,0]) cylinder(10,rM3+0.5,rM3+0.5,$fn=6);
		// Make a fracture to cause fill
		translate([(blExt-blHed)/2-4.2,0,(sdMax-tFull)/2+1]) cube([0.05,swMax-4.4,sdMax],center=true) ;
		// Finally indent for belt
		translate([-lBelt/2,-wBelt/2,-sdMax/2-0.1]) belt();
	}
}

// Note this is positioned so that the slider is centered on the XY plane
module basepart() {
	union() {
		difference() {
			translate([0,0,-dRise/2 - 1]) cube([blExt,bwExt,bdExt+dRise],center=true);
			// Remove the space for the slider
			translate([-blHed,0,(bFloor-bRoof)/2]) cube([blExt,bwInt,bdSoc],center=true);
			// Remove a hole for the bolt
			translate([(blExt/2-9),0,bFloor+sDrop-bdExt/2]) rotate([30,0,0]) rotate([0,90,0]) cylinder(15,rM3,rM3);
			// An indentation for the bolt head
			translate([(blExt/2)-(blHed+5-dHex),0,bFloor+sDrop-bdExt/2]) rotate([30,0,0]) rotate([0,90,0]) cylinder(5,wHex/2,wHex/2,$fn=6);
			// A slot for the belt to come through
			translate([blExt/2-blHed,0,(bdExt-tFull-0.61)/2-bRoof]) cube([15,wBelt+2,tFull+0.6],center=true);
		}
		mount();
	}
}

module mount(){
	z_off = -1 + bdExt + dRise;
	mount_y = bwExt + 4 * m6_washer_r;
	translate([-0.5 * blExt,-0.5 * mount_y, 5]){
		intersection(){
			translate([0.5 * blExt,0.5 * mount_y, 0])cylinder(r=mount_y / 2, h = belt_offset_z);
			difference(){
				cube([blExt,mount_y,belt_offset_z]);		
				translate([blExt * 0.5,0,-0.5 * belt_offset_z]){
					translate([0,m6_washer_r,0])cylinder(r=4, h = 2 * belt_offset_z);
					translate([0,mount_y - m6_washer_r,0])cylinder(r=4, h = 2 * belt_offset_z);
				}
			}
		}
	}
	
}

module belt() {
	cube([lBelt,wBelt,tBase]) ;
	for (inc = [0:(wTooth+wSpace):lBelt-wTooth]) translate([inc,0,tBase-0.01]) cube([wTooth,wBelt,(tFull-tBase)]) ;
}

