include <thumbnut.scad>

// Parametric Pulley with multiple belt profiles
// by droftarts January 2012

// Based on pulleys by:
// http://www.thingiverse.com/thing:11256 by me!
// https://github.com/prusajr/PrusaMendel by Josef Prusa
// http://www.thingiverse.com/thing:3104 by GilesBathgate
// http://www.thingiverse.com/thing:2079 by nophead

// dxf tooth data from http://oem.cadregister.com/asp/PPOW_Entry.asp?company=915217&elementID=07807803/METRIC/URETH/WV0025/F
// pulley diameter checked and modelled from data at http://www.sdp-si.com/D265/HTML/D265T016.html

/**
* @name Pulley
* @category Printed
* @using 1 x m3 nut, normal or nyloc
* @using 1 x m3x10 set screw or 1 x m3x8 grub screw
*/


// tuneable constants

teeth = 10;			// Number of teeth, standard Mendel T5 belt = 8, gives Outside Diameter of 11.88mm
profile = 6;		// 1=MXL 2=40DP 3=XL 4=H 5=T2.5 6=T5 7=T10 8=AT5 9=HTD_3mm 10=HTD_5mm 11=HTD_8mm 12=GT2_2mm 13=GT2_3mm 14=GT2_5mm

motor_shaft = 6.35;	// NEMA17 motor shaft exact diameter = 5
m3_dia = 3.2;		// 3mm hole diameter
m3_nut_hex = 1;		// 1 for hex, 0 for square nut
m3_nut_flats = 5.9;	// normal M3 hex nut exact width = 5.5
m3_nut_depth = 2.5;	// normal M3 hex nut exact depth = 2.4, nyloc = 4
m3_head_dia = 5.5; // diameter of M3 head
m3_head_h = 2; // depth of M3 head

retainer = 1;		// Belt retainer above teeth, 0 = No, 1 = Yes
retainer_ht = 3;	// height of retainer flange over pulley, standard = 1.5
idler = 1;			// Belt retainer below teeth, 0 = No, 1 = Yes
idler_ht = 1.5;		// height of idler flange over pulley, standard = 1.5

pulley_t_ht = 10;	// length of toothed part of pulley, standard = 12
pulley_b_ht = 3;		// pulley base height, standard = 8. Set to same as idler_ht if you want an idler but no pulley.
pulley_b_dia = 25;	// pulley base diameter, standard = 20
no_of_nuts = 0;		// number of captive nuts required, standard = 1
nut_angle = 90;		// angle between nuts, standard = 90
nut_shaft_distance = 1.2;	// distance between inner face of nut and shaft, can be negative.

grabber_h = 8; // height of shaft grabber
grabber_w = 15;  // width of grabber
grabber_gap = 1; // gap inside grabber




module grabber(){
	difference(){
		cylinder(r=(pulley_b_dia-1)/2, h=grabber_h);
		translate([-0.5 * pulley_b_dia,grabber_w * 0.5,-0.5]){
			cube([pulley_b_dia ,pulley_b_dia * 0.5 ,grabber_h+0.5]);
		}
		translate([-0.5 * pulley_b_dia,pulley_b_dia * -0.5 + grabber_w * -0.5,-0.5]){
			cube([pulley_b_dia ,pulley_b_dia * 0.5 ,grabber_h+0.5]);
		}
		translate([0,0,-0.25])cylinder(r=motor_shaft/2,h=grabber_h + 0.5,$fn=motor_shaft*4);
		translate([pulley_b_dia * -0.5, grabber_gap * -0.5,-0.5])cube([pulley_b_dia, grabber_gap, grabber_h + 0.5]);
		
		grabber_bolt(0);
		grabber_bolt(180);
	}
	
}

module grabber_bolt(rot=0){
	rotate([0,0,rot]){
		translate([pulley_b_dia * 0.29, grabber_w * 0.51, grabber_h * 0.5]){
			rotate([90,90,0]){
				cylinder(r=m3_dia/2,h=grabber_w+1,$fn=m3_dia*4);
				cylinder(r=m3_head_dia/2, h=m3_head_h,$fn=m3_head_dia*4);
			}
		}
		translate([pulley_b_dia * 0.29, -0.5 * grabber_w + m3_nut_depth-0.2, grabber_h * 0.5]){
			rotate([90,90,0]){
				translate([0,0,m3_nut_depth / 2])
				hexagon(m3_nut_flats, m3_nut_depth);
			}
		}
		
	}
}

module hexagon(size, height) {
	boxWidth = size/1.75;
	rotate([0,0,90])
	for (r = [-60, 0, 60]) rotate([0,0,r]) cube([boxWidth, size, height], true);
}

rotate([0,0,45])
translate([0,0,-grabber_h]) grabber();
