// Fiesta Garage Remote

use<Circuit.scad>;
include <lib/bosses.scad>


//Base

base_h = 15;

base_dim = [39,59,1];
base_rad = 8;
base_smooth_rad = 3;
base_smooth_dia = base_smooth_rad * 2;
bossX = 0;
bossY = -6.25;
bossY2 = 19.75;

wall_t = 1.2;


mirror([ 0, 0, 1])caseUpper();
//caseLower();
//translate([ 6.5, 15.75, 10.02])button();

module button(){
	color([1,0,1]){
		cylinder(r=7.9/2,h=7,$fn = 30);
		cylinder(r=10/2,h=3.3,$fn = 30);
	}
}

module caseUpper(){
	case_innerY = (base_dim.y - (wall_t * 2)) / base_dim.y;
	case_innerZ = (base_h - (wall_t * 2)) / base_h;
	difference(){	

		shell();

		translate([ 0, 0, wall_t])scale([ case_innerY, case_innerY, case_innerZ])shell();
		
		translate([ -0.5, (-40 / 2), base_h * 0.5])circuit();
		
		
		// bottom mask - 45
		translate([ 0, 0, -45])cube([100,100,100], center=true);
			
	}

	//translate([ -0.5, (-40 / 2), base_h * 0.5])circuit();
	
	translate([ bossX, bossY, wall_t]){
		bossTop();
	}
	translate([ bossX, bossY2, wall_t]){
		bossTop();
	}	
	
}

module caseLower(){
	case_innerY = (base_dim.y - (wall_t * 2)) / base_dim.y;
	case_innerZ = (base_h - (wall_t * 2)) / base_h;
	difference(){
		shell();
		translate([ 0, 0, wall_t])scale([ case_innerY, case_innerY, case_innerZ])shell();
		
		//translate([ -0.5, (-40 / 2), base_h * 0.5])circuit();
		
		// bottom mask
		translate([ 0, 0, 55])cube([100,100,100], center=true);
		
		translate([ bossX, bossY, 0]){
			bossHead();
		}
		translate([ bossX, bossY2, 0]){
			bossHead();
		}		
	}

	//translate([ -0.5, (-40 / 2), base_h * 0.5])circuit();
	
	// Battery hold	
	difference(){
		translate([0, -19, 3.5])cube([3,15,6], center = true);
		translate([ -0.5, (-40 / 2), base_h * 0.5])circuit();
	}
	
	translate([ bossX, bossY, wall_t]){
		bossLow();
	}
	
	translate([ bossX, bossY2, wall_t]){
		bossLow();
	}	
	
}

module bossHead(){
	cylinder(r=3,h=2,$fn = 30);
}
module bossLow(){
	$fn = 20;
	bossFillet(2.5,1.5,4.3,4);
}

module bossTop(){
	$fn=20;
	translate([ 0, 0, base_h - wall_t * 2])rotate([ 180, 0, 0])bossFillet(2.5,1.4,6.3,1.6);
}

module shell(){
	difference(){
		minkowski(){
			baseShape(h=base_h);
			sphere(r=base_smooth_rad);
		}
	}
}
module baseShape(h = 1){
	newH = h - base_smooth_dia;
	translate([ (base_dim.x - base_smooth_dia)* -0.5, (base_dim.y - base_smooth_dia) * -0.5 + base_rad, base_smooth_rad]){
	
		scale([1, 1, newH]) cube([base_dim.x - base_smooth_dia, base_dim.y - base_rad - base_smooth_dia, base_dim.z],center=false);
		hull(){
			translate([ base_rad, 0, 0])cylinder(r=base_rad, h = newH);
			translate([ base_dim.x - base_rad - base_smooth_dia, 0, 0])cylinder(r=base_rad, h = newH);
		}
	}
}

module baseShapeOrig(h = 1){
	translate([ base_dim.x * -0.5, (base_dim.y) * -0.5 + base_rad, 0]){
		scale([1, 1, h]) cube([base_dim.x, base_dim.y - base_rad, base_dim.z],center=false);
		hull(){
			translate([ base_rad, 0, 0])cylinder(r=base_rad, h = h);
			translate([ base_dim.x - base_rad, 0, 0])cylinder(r=base_rad, h = h);
		}
	}
}