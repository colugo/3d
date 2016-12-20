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

motor_shaft = 8.3;	// NEMA17 motor shaft exact diameter = 5
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


//	********************************
//	** Scaling tooth for good fit **
//	********************************
/*	To improve fit of belt to pulley, set the following constant. Decrease or increase by 0.1mm at a time. We are modelling the *BELT* tooth here, not the tooth on the pulley. Increasing the number will *decrease* the pulley tooth size. Increasing the tooth width will also scale proportionately the tooth depth, to maintain the shape of the tooth, and increase how far into the pulley the tooth is indented. Can be negative */

additional_tooth_width = 0.2; //mm

//	If you need more tooth depth than this provides, adjust the following constant. However, this will cause the shape of the tooth to change.

additional_tooth_depth = 0; //mm

// calculated constants

nut_elevation = pulley_b_ht/2;
m3_nut_points = 2*((m3_nut_flats/2)/cos(30)); // This is needed for the nut trap

// The following set the pulley diameter for a given number of teeth
T5_pulley_dia = tooth_spaceing_curvefit (0.6523,1.591,1.064);


// The following calls the pulley creation part, and passes the pulley diameter and tooth width to that module

if ( profile == 6 ) { pulley ( "T5" , T5_pulley_dia , 1.19 , 3.264 ); }

// Functions

function tooth_spaceing_curvefit (b,c,d)
= ((c * pow(teeth,d)) / (b + pow(teeth,d))) * teeth ;

function tooth_spacing(tooth_pitch,pitch_line_offset)
= (2*((teeth*tooth_pitch)/(3.14159265*2)-pitch_line_offset)) ;

// Main Module

module pulley( belt_type , pulley_OD , tooth_depth , tooth_width )
{
	echo (str("Belt type = ",belt_type,"; Number of teeth = ",teeth,"; Pulley Outside Diameter = ",pulley_OD,"mm "));
	tooth_distance_from_centre = sqrt( pow(pulley_OD/2,2) - pow((tooth_width+additional_tooth_width)/2,2));
	tooth_width_scale = (tooth_width + additional_tooth_width ) / tooth_width;
	tooth_depth_scale = ((tooth_depth + additional_tooth_depth ) / tooth_depth) ;


	//	************************************************************************
	//	*** uncomment the following line if pulley is wider than puller base ***
	//	************************************************************************

	//	translate ([0,0, pulley_b_ht + pulley_t_ht + retainer_ht ]) rotate ([0,180,0])

	difference()
	{	 
		union()
		{
			//base
			
			if ( pulley_b_ht < 2 ) { echo ("CAN'T DRAW PULLEY BASE, HEIGHT LESS THAN 2!!!"); } else {
				rotate_extrude($fn=pulley_b_dia*2)
				{
					square([pulley_b_dia/2-1,pulley_b_ht]);
					square([pulley_b_dia/2,pulley_b_ht-1]);
					translate([pulley_b_dia/2-1,pulley_b_ht-1]) circle(1);
				}
			}
			
			difference()
			{
				//shaft - diameter is outside diameter of pulley
				
				translate([0,0,pulley_b_ht]) 
				rotate ([0,0,360/(teeth*4)]) 
				cylinder(r=pulley_OD/2,h=pulley_t_ht, $fn=teeth*4);
				
				//teeth - cut out of shaft
				
				for(i=[1:teeth]) 
				rotate([0,0,i*(360/teeth)])
				translate([0,-tooth_distance_from_centre,pulley_b_ht -1]) 
				scale ([ tooth_width_scale , tooth_depth_scale , 1 ]) 
				{
					T5();
				}

			}
			
			//belt retainer / idler
			if ( retainer > 0 ) {translate ([0,0, pulley_b_ht + pulley_t_ht ]) 
				rotate_extrude($fn=teeth*4)  
				polygon([[0,0],[pulley_OD/2,0],[pulley_OD/2 + retainer_ht , retainer_ht],[0 , retainer_ht],[0,0]]);}
			
			if ( idler > 0 ) {translate ([0,0, pulley_b_ht - idler_ht ]) 
				rotate_extrude($fn=teeth*4)  
				polygon([[0,0],[pulley_OD/2 + idler_ht,0],[pulley_OD/2 , idler_ht],[0 , idler_ht],[0,0]]);}
			
		}
		
		//hole for motor shaft
		translate([0,0,-1])cylinder(r=motor_shaft/2,h=pulley_b_ht + pulley_t_ht + retainer_ht + 2,$fn=motor_shaft*4);
		
		
	}
	
}


module T5()
{
	linear_extrude(height=pulley_t_ht+2) polygon([[-1.632126,-0.5],[-1.632126,0],[-1.568549,0.004939],[-1.507539,0.019367],[-1.450023,0.042686],[-1.396912,0.074224],[-1.349125,0.113379],[-1.307581,0.159508],[-1.273186,0.211991],[-1.246868,0.270192],[-1.009802,0.920362],[-0.983414,0.978433],[-0.949018,1.030788],[-0.907524,1.076798],[-0.859829,1.115847],[-0.80682,1.147314],[-0.749402,1.170562],[-0.688471,1.184956],[-0.624921,1.189895],[0.624971,1.189895],[0.688622,1.184956],[0.749607,1.170562],[0.807043,1.147314],[0.860055,1.115847],[0.907754,1.076798],[0.949269,1.030788],[0.9837,0.978433],[1.010193,0.920362],[1.246907,0.270192],[1.273295,0.211991],[1.307726,0.159508],[1.349276,0.113379],[1.397039,0.074224],[1.450111,0.042686],[1.507589,0.019367],[1.568563,0.004939],[1.632126,0],[1.632126,-0.5]]);
}

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

translate([0,0,-grabber_h]) grabber();
