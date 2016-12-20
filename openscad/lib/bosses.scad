//bossBasic(oR = 3, iR = 1.4, h = 10);
//bossFillet(oR = 3, iR = 1.4, h = 10, fR = 3);
//bossGusset(oR = 3, iR = 1.4, h = 10, gN = 2, gA = 180, gL = 5);
//bossGusset(oR = 3, iR = 1.4, h = 10, gN = 3, gA = 60, gL = 5);



module bossDemo1(){
	bossGussetFillet(oR = 5, iR = 3, fR = 2, h = 10, gN = 1, gA = 90, gL = 8);
	rotate([0,0,135])bossGussetFillet(oR = 5, iR = 3, fR = 2, h = 10, gN = 2, gA = 90, gL = 13.5);

	translate([0,0,4])difference(){
		cube([10 + 10 + 3 + 3 + 4, 30,12], center=true);
		translate([0,0,2])cube([10 + 10 + 3 + 3, 26,12], center=true);
	}
}


module bossDemo2(){
	oR = 3;
	iR = 1.4;
	fR = 2;
	h = 10;
	hGL = 9;
	
	
	rotate([0,0,90])bossGussetFillet(oR = oR, iR = iR, fR = fR, h = h, gN = 2, gA = 180, gL = hGL, mode = 1);
	bossGussetFillet(oR = oR, iR = iR, fR = fR, h = h, gN = 2, gA = 180, gL = hGL);
	translate([-2 * (oR + hGL),0,0])rotate([0,0,-180])bossGussetFillet(oR = oR, iR = iR, fR = fR, h = h, gN = 1, gA = 90, gL = hGL, mode = 1);
	translate([2 * (oR + hGL),0,0])bossGussetFillet(oR = oR, iR = iR, fR = fR, h = h, gN = 1, gA = 90, gL = hGL, mode = 1);
	translate([2 * (oR + hGL),0,0])rotate([0,0,135])bossGussetFillet(oR = oR, iR = iR, fR = fR, h = h, gN = 2, gA = 90, gL = 9);
	translate([-2 * (oR + hGL),0,0])rotate([0,0,315])bossGussetFillet(oR = oR, iR = iR, fR = fR, h = h, gN = 2, gA = 90, gL = 9);

	difference(){
		hull(){
			translate([-2 * (oR + hGL), 0, -2])cylinder(r = oR * 4 + 2, h = h + 2 );
			translate([2 * (oR + hGL), 0, -2])cylinder(r = oR * 4 + 2, h = h + 2);
		}
		hull(){
			translate([-2 * (oR + hGL), 0, 0])cylinder(r = oR * 4, h = h + 0.1);
			translate([2 * (oR + hGL), 0, 0])cylinder(r = oR * 4, h = h + 0.1);
		}
	}

}

module bossBasic( oR, iR, h ){
	difference(){
		cylinder( r = oR, h = h);
		translate([ 0, 0, -0.5])cylinder( r = iR, h = h + 1);
		translate([ 0, 0, h - 1])cylinder( r1 = iR, r2 = iR + 0.2, h = 1.1);
	}
}

module bossFillet( oR, iR, h, fR){
	filletR = oR + fR;
	bossBasic(oR = oR, iR = iR, h = h);
	difference(){
		cylinder( r = filletR, h = fR);
		translate([0, 0, fR])
		rotate_extrude(convexity = 5){
			translate([ filletR, 0, 0])circle( r = fR );
		}
		translate([ 0, 0, -0.5])cylinder( r = iR, h = h + 1);
	}
}


module bossGusset( oR, iR, h, gN, gA, gL, mode=0){
/*
 * Mode settings
 * 0 : Boss, base & opposing fillets
 * 1 : Boss & base fillets 
 * 2 : Boss fillets
 * 3 : No fillets
 */
	gussetW = (oR - iR) * 0.6;
	gussetH = h - 1.5;
	bossBasic(oR = oR, iR = iR, h = h);
	for(a = [gA : gA : gA * gN ]){	
		rotate([0, 0, a])translate([-0.5 * gussetW, oR - 0.5, 0]){
			cube([gussetW, gL + 0.5, gussetH]);
			if(mode <= 1)cubeSideFillet(gussetW, gL + 0.5);
			if(mode <= 2)translate([0,-0.2,gussetH])rotate([270,0,0])cubeSideFillet(gussetW, gussetH);
			if(mode == 0)translate([0,gL + 0.5,0])rotate([90,0,0])cubeSideFillet(gussetW, gussetH);
		}
	}
}

module cubeSideFillet(w, l){
	filletR = w * 1.6;
	difference(){
		translate([w, 0, 0])cube([ filletR, l, filletR]);
		translate([filletR + w, -0.1, filletR])rotate([0, 90, 90])cylinder(r = filletR, h = l + 0.2);
	}
	difference(){
		translate([-1 * filletR, 0, 0])cube([ filletR, l, filletR]);
		translate([-1 * filletR, -0.1, filletR])rotate([0, 90, 90])cylinder(r = filletR, h = l + 0.2);
	}
}

module bossGussetFillet( oR, iR, fR, h, gN, gA, gL, mode = 0){
	//bossFillet(oR = oR, iR = iR, h = h, fR = fR);
	//bossGusset(oR = oR, iR = iR, h = h, gN = gN, gA = gA, gL = gL, mode = mode);
}