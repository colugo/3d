include <measure_imperial.scad>

module part(part_dim){
	translate([part_dim.x * -0.5, part_dim.y * -0.5, 0])cube(part_dim);
}


ZCablePlate();

module ZCablePlate(){
	difference(){
		part(part_ZCablePlate);
		
		//bore
		translate([ part_ZCablePlate.x * 0.5 - dim_ZCablePlateX, 0, 0])cylinder(r = rad_ZCablePlateBore, h = 10, center = true);
		
		//fillet
		translate([ part_ZCablePlate.x * 0.5 - dim_ZCablePlateFilletX - rad_ZCablePlateFillet, part_ZCablePlate.y * 0.5 - dim_ZCablePlateFilletY + rad_ZCablePlateFillet ,0])cylinder(r = rad_ZCablePlateFillet, h = 10, center = true);
	}
}

module ZMotorMountL(){
	difference(){
		mirror([0,1,0])ZMotorMountR();
		
		translate([ part_ZMotorMountR.x * 0.5 + 1, part_ZMotorMountR.y * 0.5 - dim_ZMotorMountLX, dim_ZMotorMountLZ])rotate([ 0, -90, 0])cylinder(r=rad_1032,h=dim_ZMotorMountLD+1);
		translate([ part_ZMotorMountR.x * 0.5 + 1, part_ZMotorMountR.y * 0.5 - dim_ZMotorMountLX, part_ZMotorMountR.z - dim_ZMotorMountLZ])rotate([ 0, -90, 0])cylinder(r=rad_1032,h=dim_ZMotorMountLD+1);
	}
}

module ZMotorMountR(){
	difference(){
		part(part_ZMotorMountR);
		
		// Top
		translate([ part_ZMotorMountR.x * 0.5 - dim_ZMotorMountRTopX1, part_ZMotorMountR.y * 0.5 - dim_ZMotorMountRTopX1, 0])cylinder(r = rad_ZMotorMountRTop, h = 100, center = true);
		translate([ part_ZMotorMountR.x * 0.5 - dim_ZMotorMountRTopX2, part_ZMotorMountR.y * 0.5 - dim_ZMotorMountRTopX1, 0])cylinder(r = rad_ZMotorMountRTop, h = 100, center = true);
		
		//Bore
		translate([ part_ZMotorMountR.x * 0.5 - dim_ZMotorMountBoreX , part_ZMotorMountR.y * -0.5 - dim_ZMotorMountBoreY, 0])cylinder(r = rad_ZMotorMountBore, h = 100, center = true);
		
		//Side
		translate([ part_ZMotorMountR.x * -0.5 + dim_ZMotorMountSmallX, 0, dim_ZMotorMountSmallZ ])rotate([ 90, 0, 0])cylinder(r = rad_ZMotorMountRSmall, h = 100, center = true);
		translate([ part_ZMotorMountR.x * -0.5 + dim_ZMotorMountSmallX, 0, part_ZMotorMountR.z - dim_ZMotorMountSmallZ ])rotate([ 90, 0, 0])cylinder(r = rad_ZMotorMountRSmall, h = 100, center = true);
		
	}
}

module SpacerLower(){
	difference(){
		part(part_SpacerLower);
		cylinder(r= rad_SpacerLower, h=100,center=true);
	}
}

module SpacerUpper(){
	difference(){
		part(part_SpacerUpper);
		cylinder(r= rad_SpacerUpper, h=100,center=true);
	}
}

module CarriageBlockFrontLeft(){
	difference(){
		part(part_CarriageBlockFrontLeft);
		
		// Top
		translate([ part_CarriageBlockFrontLeft.x * -0.5 + dim_CarriageBlockFLTEdge, 0, part_CarriageBlockFrontLeft.z * 0.5])tappedHole(rad_CarriageBlockFL, rad_1032);
		translate([ part_CarriageBlockFrontLeft.x * 0.5 - dim_CarriageBlockFLTEdge, 0, part_CarriageBlockFrontLeft.z * 0.5])tappedHole(rad_CarriageBlockFL, rad_1032);
		translate([ part_CarriageBlockFrontLeft.x * -0.5 + dim_CarriageBlockFLTX1, part_CarriageBlockFrontLeft.y * -0.5 + dim_CarriageBlockFLTY, 0])cylinder(r = rad_1420, h=100, center=true);
		translate([ part_CarriageBlockFrontLeft.x * 0.5 - dim_CarriageBlockFLTX1, part_CarriageBlockFrontLeft.y * -0.5 + dim_CarriageBlockFLTY, 0])cylinder(r = rad_1420, h=100, center=true);

		// Front
		translate([ part_CarriageBlockFrontLeft.x * -0.5 + dim_CarriageBlockFLSY, 0, part_CarriageBlockFrontLeft.z * 0.5])rotate([ -90, 0, 0])tappedHole(rad_CarriageBlockFL, rad_1032);
		translate([ part_CarriageBlockFrontLeft.x * 0.5 - dim_CarriageBlockFLSY, 0, part_CarriageBlockFrontLeft.z * 0.5])rotate([ -90, 0, 0])tappedHole(rad_CarriageBlockFL, rad_1032);
		translate([ part_CarriageBlockFrontLeft.x * -0.5 + dim_CarriageBlockFLSX1, 0, part_CarriageBlockFrontLeft.z * 0.5])rotate([ -90, 0, 0])cylinder(r=rad_CarriageBlockFL, h=100, center=true);
		translate([ part_CarriageBlockFrontLeft.x * -0.5 + dim_CarriageBlockFLSX2, 0, part_CarriageBlockFrontLeft.z * 0.5])rotate([ -90, 0, 0])cylinder(r=rad_CarriageBlockFL, h=100, center=true);

	}
}

module tappedHole(oR, tR){
	cylinder(r = oR, h = 100, center=true);
	rotate([90, 0, 0])cylinder(r = tR, h = 50);
}

module CarriageBlockFrontRight(){
	difference(){
		part(part_CarriageBlockFrontRight);
		
		//Top Tapped Bore
		translate([ part_CarriageBlockFrontRight.x * -0.5 + dim_CarriageBlockFREdgeX, 0, part_CarriageBlockFrontRight.z * 0.5])tappedHole(rad_CarriageBlockFR, rad_1032);
		translate([ part_CarriageBlockFrontRight.x * -0.5 + dim_CarriageBlockFREdgeX2, 0, part_CarriageBlockFrontRight.z * 0.5])tappedHole(rad_CarriageBlockFR, rad_1032);

		translate([ part_CarriageBlockFrontRight.x * 0.5 - dim_CarriageBlockFRSmallEdgeX1, 0, 0])cylinder(r=rad_CarriageBlockFRSmall, h = 100, center=true);
		translate([ part_CarriageBlockFrontRight.x * 0.5 - dim_CarriageBlockFRSmallEdgeX2, 0, 0])cylinder(r=rad_CarriageBlockFRSmall, h = 100, center=true);
		
		translate([ part_CarriageBlockFrontRight.x * -0.5 + dim_CarriageBlockFRTapEdgeX1, part_CarriageBlockFrontRight.y * -0.5 + dim_CarriageBlockFRTapEdgeY, 0])cylinder(r=rad_1420, h = 100, center=true);
		translate([ part_CarriageBlockFrontRight.x * -0.5 + dim_CarriageBlockFRTapEdgeX2, part_CarriageBlockFrontRight.y * -0.5 + dim_CarriageBlockFRTapEdgeY, 0])cylinder(r=rad_1420, h = 100, center=true);


		// Side tapped hole
		translate([ part_CarriageBlockFrontRight.x * -0.5 + dim_CarriageBlockFREdge, 0, part_CarriageBlockFrontRight.z * 0.5])rotate([90, 0, 0])tappedHole(rad_CarriageBlockFR, rad_1032);
		translate([ part_CarriageBlockFrontRight.x * -0.5 + dim_CarriageBlockFRSideEdge, 0, part_CarriageBlockFrontRight.z * 0.5])rotate([90, 0, 0])tappedHole(rad_CarriageBlockFR, rad_1032);
		
		translate([ part_CarriageBlockFrontRight.x * -0.5 + dim_CarriageBlockFRSideMiddleX1, 0, part_CarriageBlockFrontRight.z * 0.5])rotate([ 90, 0, 0])cylinder(r=rad_CarriageBlockFR, h=100, center=true);
		translate([ part_CarriageBlockFrontRight.x * -0.5 + dim_CarriageBlockFRSideMiddleX2, 0, part_CarriageBlockFrontRight.z * 0.5])rotate([ 90, 0, 0])cylinder(r=rad_CarriageBlockFR, h=100, center=true);
		
		
	}
}

module BearingBlockTapped(){
	difference(){
		BearingBlock();
		
		//Tap
		translate([ part_BearingBlock.x * 0.5 - dim_BearingBlockBackX, part_BearingBlock.y * 0.5 + 1, part_BearingBlock.z - dim_BearingBlockTappedBackZ])rotate([ 90, 0, 0])cylinder(r = rad_1420, h = part_BearingBlock.y + 2);

	}
}

module BearingBlock(){
	difference(){
		part(part_BearingBlock);
		
		// TOP
		translate([ part_BearingBlock.x * 0.5 - dim_BearingBlockTop, part_BearingBlock.y * 0.5 - dim_BearingBlockTop, -1])cylinder(r = rad_BearingBlockBigHoles, h = part_BearingBlock.z + 2);
		
		//Side
		translate([ part_BearingBlock.x * -0.5 - 1, part_BearingBlock.y * -0.5 + dim_BearingBlockSideY, part_BearingBlock.z - dim_BearingBlockSideZ1])rotate([ 0, 90, 0])cylinder(r = rad_BearingBlockSmallHoles, h = part_BearingBlock.x + 2);
		translate([ part_BearingBlock.x * -0.5 - 1, part_BearingBlock.y * -0.5 + dim_BearingBlockSideY, part_BearingBlock.z - dim_BearingBlockSideZ2])rotate([ 0, 90, 0])cylinder(r = rad_BearingBlockSmallHoles, h = part_BearingBlock.x + 2);

		//Back
		translate([ part_BearingBlock.x * 0.5 - dim_BearingBlockBackX, part_BearingBlock.y * 0.5 + 1, part_BearingBlock.z - dim_BearingBlockBackZ])rotate([ 90, 0, 0])cylinder(r = rad_1032, h = part_BearingBlock.y + 2);
		translate([ part_BearingBlock.x * 0.5 - dim_BearingBlockBackX, part_BearingBlock.y * 0.5 + 1, dim_BearingBlockBackZ])rotate([ 90, 0, 0])cylinder(r = rad_1032, h = part_BearingBlock.y + 2);


	}
}

module CarriageBlockRL(){
	difference(){
		part(part_CarriageBlockRL);
		
		//Left Fillet
		translate([ part_CarriageBlockRL.x * -0.5 + part_CarriageBlockRLFilletX - rad_CarriageBlockRLFillet, part_CarriageBlockRL.y * -0.5 + part_CarriageBlockRLFilletY - rad_CarriageBlockRLFillet, -1])cylinder(r = rad_CarriageBlockRLFillet, h = part_CarriageBlockRL.z + 2);
		translate([ part_CarriageBlockRL.x * -0.5 - 1, part_CarriageBlockRL.y * -0.5 - 1, -1])cube([ part_CarriageBlockRLFilletX + 1 - rad_CarriageBlockRLFillet, part_CarriageBlockRLFilletY + 1, part_CarriageBlockRL.z + 2]);
		translate([ part_CarriageBlockRL.x * -0.5 - 1, part_CarriageBlockRL.y * -0.5 - 1, -1])cube([ part_CarriageBlockRLFilletX + 1, part_CarriageBlockRLFilletY + 1 - rad_CarriageBlockRLFillet, part_CarriageBlockRL.z + 2]);
		
		//Right Fillet
		mirror([ 1, 0, 0]){
			translate([ part_CarriageBlockRL.x * -0.5 + part_CarriageBlockRLFilletX - rad_CarriageBlockRLFillet, part_CarriageBlockRL.y * -0.5 + part_CarriageBlockRLFilletY - rad_CarriageBlockRLFillet, -1])cylinder(r = rad_CarriageBlockRLFillet, h = part_CarriageBlockRL.z + 2);
			translate([ part_CarriageBlockRL.x * -0.5 - 1, part_CarriageBlockRL.y * -0.5 - 1, -1])cube([ part_CarriageBlockRLFilletX + 1 - rad_CarriageBlockRLFillet, part_CarriageBlockRLFilletY + 1, part_CarriageBlockRL.z + 2]);
			translate([ part_CarriageBlockRL.x * -0.5 - 1, part_CarriageBlockRL.y * -0.5 - 1, -1])cube([ part_CarriageBlockRLFilletX + 1, part_CarriageBlockRLFilletY + 1 - rad_CarriageBlockRLFillet, part_CarriageBlockRL.z + 2]);
		}
		
		// Edge holes
		translate([ part_CarriageBlockRL.x * -0.5 + part_CarriageBlockRLEdgeOffset, part_CarriageBlockRL.y * 0.5 - part_CarriageBlockRLEdgeOffset, -1])cylinder(r = rad_CarriageBlockRLBigHoles, h = part_CarriageBlockRL.z + 2);
		translate([ part_CarriageBlockRL.x * 0.5 - part_CarriageBlockRLEdgeOffset, part_CarriageBlockRL.y * 0.5 - part_CarriageBlockRLEdgeOffset, -1])cylinder(r = rad_CarriageBlockRLBigHoles, h = part_CarriageBlockRL.z + 2);

		// Middle holes
		translate([ part_CarriageBlockRL.x * -0.5 + part_CarriageBlockRLMiddleHoleX, 0, -1])cylinder(r = rad_CarriageBlockRLBigHoles, h = part_CarriageBlockRL.z + 2);
		translate([ part_CarriageBlockRL.x * 0.5 - part_CarriageBlockRLMiddleHoleX, 0, -1])cylinder(r = rad_CarriageBlockRLBigHoles, h = part_CarriageBlockRL.z + 2);

		// Top Small holes
		translate([ part_CarriageBlockRL.x * -0.5 + part_CarriageBlockRLTopHoleX, part_CarriageBlockRLTopHoleY, -1])cylinder(r = rad_CarriageBlockRLSmallHoles, h = part_CarriageBlockRL.z + 2);
		translate([ part_CarriageBlockRL.x * 0.5 - part_CarriageBlockRLTopHoleX, part_CarriageBlockRLTopHoleY, -1])cylinder(r = rad_CarriageBlockRLSmallHoles, h = part_CarriageBlockRL.z + 2);

		// Top Small holes
		translate([ part_CarriageBlockRL.x * -0.5 + part_CarriageBlockRLTopHoleInX, part_CarriageBlockRLTopHoleY * -1, -1])cylinder(r = rad_CarriageBlockRLSmallHoles, h = part_CarriageBlockRL.z + 2);
		translate([ part_CarriageBlockRL.x * 0.5 - part_CarriageBlockRLTopHoleInX, part_CarriageBlockRLTopHoleY * -1, -1])cylinder(r = rad_CarriageBlockRLSmallHoles, h = part_CarriageBlockRL.z + 2);


		// Top tap holes
		translate([ part_CarriageBlockRL.x * -0.5 + part_CarriageBlockRLTopTapX, part_CarriageBlockRL.y * -0.5 + part_CarriageBlockRLTopTapY, -1])cylinder(r = rad_1032, h = part_CarriageBlockRL.z * 0.5);
		translate([ part_CarriageBlockRL.x * 0.5 - part_CarriageBlockRLTopTapX, part_CarriageBlockRL.y * -0.5 + part_CarriageBlockRLTopTapY, -1])cylinder(r = rad_1032, h = part_CarriageBlockRL.z * 0.5);

		//Side holes
		translate([ 0, part_CarriageBlockRL.y * -0.5 - 1 ,0])rotate([ -90, 0, 0]){
			// tap holes
			translate([ part_CarriageBlockRL.x * -0.5 + part_CarriageBlockRLEdgeOffset, part_CarriageBlockRLEdgeOffset * -1, part_CarriageBlockRLEdgeOffset * -1])cylinder(r = rad_1032, h = part_CarriageBlockRL.y + 2);
			translate([ part_CarriageBlockRL.x * 0.5 - part_CarriageBlockRLEdgeOffset, part_CarriageBlockRLEdgeOffset * -1, part_CarriageBlockRLEdgeOffset * -1])cylinder(r = rad_1032, h = part_CarriageBlockRL.y + 2);
		
			//Outer holes
			translate([ part_CarriageBlockRL.x * -0.5 + part_CarriageBlockRLTopTapX, part_CarriageBlockRL.z * -0.5, 0])cylinder (r = rad_CarriageBlockRLBigHoles, h = part_CarriageBlockRL.y + 2);
			translate([ part_CarriageBlockRL.x * 0.5 - part_CarriageBlockRLTopTapX, part_CarriageBlockRL.z * -0.5, 0])cylinder (r = rad_CarriageBlockRLBigHoles, h = part_CarriageBlockRL.y + 2);
			
			//Middle Tap holes
			translate([ part_CarriageBlockRL.x * -0.5 + part_CarriageBlockRLMiddleTapX, part_CarriageBlockRLMiddleTapY * -1, 0])cylinder (r = rad_1420, h = part_CarriageBlockRL.y + 2);
			translate([ part_CarriageBlockRL.x * 0.5 - part_CarriageBlockRLMiddleTapX, part_CarriageBlockRLMiddleTapY * -1, 0])cylinder (r = rad_1420, h = part_CarriageBlockRL.y + 2);

		}

	}
}

module CarriageBlockRU(){
	difference(){
		part(part_CarriageBlockRU);
		
		// Edge taps
		translate([ part_CarriageBlockRU.x * -0.5 + part_CarriageBlockRUTapX, 0, -1])cylinder( r = rad_1032, h = part_CarriageBlockRU.z + 2);
		translate([ part_CarriageBlockRU.x * 0.5 - part_CarriageBlockRUTapX, 0, -1])cylinder( r = rad_1032, h = part_CarriageBlockRU.z + 2);

		// Lower holes		
		translate([ part_CarriageBlockRU.x * -0.5 + part_CarriageBlockRULowerX, part_CarriageBlockRU.y * 0.5 - part_CarriageBlockRULowerY, -1])cylinder( r = rad_CarriageBlockRULower, h = part_CarriageBlockRU.z + 2);
		translate([ part_CarriageBlockRU.x * 0.5 - part_CarriageBlockRULowerX, part_CarriageBlockRU.y * 0.5 - part_CarriageBlockRULowerY, -1])cylinder( r = rad_CarriageBlockRULower, h = part_CarriageBlockRU.z + 2);

		// Upper holes		
		translate([ part_CarriageBlockRU.x * 0.5 - part_CarriageBlockRUUpperX1, part_CarriageBlockRU.y * 0.5 - part_CarriageBlockRUUpperY, -1])cylinder( r = rad_1420, h = part_CarriageBlockRU.z + 2);
		translate([ part_CarriageBlockRU.x * 0.5 - part_CarriageBlockRUUpperX2, part_CarriageBlockRU.y * 0.5 - part_CarriageBlockRUUpperY, -1])cylinder( r = rad_1420, h = part_CarriageBlockRU.z + 2);

		// Edge holes
		translate([ 0, part_CarriageBlockRU.y * 0.5 + 1, part_CarriageBlockRU.z * 0.5])rotate([90,0,0]){
			translate([ part_CarriageBlockRU.x * -0.5 + part_CarriageBlockRUTapX, -1, 0])cylinder( r = rad_CarriageBlockRU, h = part_CarriageBlockRU.y + 2);
			translate([ part_CarriageBlockRU.x * 0.5 - part_CarriageBlockRUTapX, 1, 0])cylinder( r = rad_CarriageBlockRU, h = part_CarriageBlockRU.y + 2);
		}

		// Lower taps
		translate([ 0, 0, part_CarriageBlockRU.z * 0.5])rotate([-90,0,0]){
			translate([ part_CarriageBlockRU.x * -0.5 + part_CarriageBlockRULowerX, part_CarriageBlockRU.y * 0.5 - part_CarriageBlockRULowerY, -1])cylinder( r = rad_1032, h = part_CarriageBlockRU.z + 2);
			translate([ part_CarriageBlockRU.x * 0.5 - part_CarriageBlockRULowerX, part_CarriageBlockRU.y * 0.5 - part_CarriageBlockRULowerY, -1])cylinder( r = rad_1032, h = part_CarriageBlockRU.z + 2);
		}
		
		// Middle holes
		translate([ 0, part_CarriageBlockRU.y * 0.5 + 1, part_CarriageBlockRU.z * 0.5])rotate([90,0,0]){
			translate([ part_CarriageBlockRU.x * -0.5 + part_CarriageBlockRUMiddleX, -1, 0])cylinder( r = rad_CarriageBlockRU, h = part_CarriageBlockRU.y + 2);
			translate([ part_CarriageBlockRU.x * 0.5 - part_CarriageBlockRUMiddleX, 1, 0])cylinder( r = rad_CarriageBlockRU, h = part_CarriageBlockRU.y + 2);
		}
	}
}

module YRail(){
	difference(){
		part(part_YRail);
		for(hole = [0:6]){
			translate([ part_YRail.x * 0.5 - dim_YRailYStart -( hole * dim_YRailYOffset), 0, -1])cylinder(r = rad_1420, h = part_YRail.z + 2);
		}
	}
}


module TimingBelt(){
	translate([ -4.75 * dim_TimingBeltFreq, 0, 0])
	for(tooth = [0:10]){
		translate([ tooth * dim_TimingBeltFreq, 0, i2m(-1.5)])cube([ dim_TimingBeltPeriod, dim_TimingBeltAmp, i2m(3)]);
	}
}

module XBeltClamp(){
	difference(){
		part(part_XBeltClamp);
		
		// Bore
		translate([ 0, part_XBeltClamp.y * -0.5 + dim_XBeltClampBoreY, -1])cylinder(r = rad_XBeltClampBore, h = part_XBeltClamp.z + 2);
		
		// Left Chamfer
		translate([ part_XBeltClamp.x * -0.5, part_XBeltClamp.y * -0.5 - 1, part_XBeltClamp.z - dim_XBeltClampChamferY])mirror([0 ,0 ,1])rotate([ 0, -45, 0])cube([ part_XBeltClamp.x, part_XBeltClamp.y + 2, part_XBeltClamp.z]);

		// Right Chamfer
		translate([ part_XBeltClamp.x * 0.5, part_XBeltClamp.y * -0.5 - 1, part_XBeltClamp.z - dim_XBeltClampChamferY])rotate([ 0, -45, 0])translate([ part_XBeltClamp.x * -1, 0, part_XBeltClamp.z * -1])cube([ part_XBeltClamp.x, part_XBeltClamp.y + 2, part_XBeltClamp.z]);

		translate([ 0, 0, part_XBeltClamp.z + 0.05])rotate([ -90, 0, 0])TimingBelt();
	
	}
}

module XBeltPlate(){
	difference(){
		part(part_XBeltPlate);
		
		//Right Bore
		translate([ part_XBeltPlate.x * -0.5 + dim_XBeltPlateBoreX1, part_XBeltPlate.y * -0.5 + dim_XBeltPlateBoreY, -1])cylinder( r = rad_XBeltPlateBore, h = part_XBeltPlate.z + 2);

		//Left Bore
		translate([ part_XBeltPlate.x * -0.5 + dim_XBeltPlateBoreX2, part_XBeltPlate.y * -0.5 + dim_XBeltPlateBoreY, -1])cylinder( r = rad_XBeltPlateBore, h = part_XBeltPlate.z + 2);

		//Tap Bore
		translate([ 0, part_XBeltPlate.y * -0.5 + dim_XBeltPlateTapY, -1])cylinder( r = rad_1420, h = part_XBeltPlate.z + 2);


	}
}

module YMotorMountRear(){
	mirror([ 0, 1, 0])YMotorMountFront();
}

module YMotorMountFront(){
	difference(){

		part(part_YMotorMount);
		
		// basic shape
		translate([ part_YMotorMount.x * -0.5 + dim_YMotorMountFilletX - rad_YMotorMountFillet, part_YMotorMount.y * 0.5 + 1, dim_YMotorMountFilletZ - rad_YMotorMountFillet])rotate([ 90, 0, 0])cylinder(r = rad_YMotorMountFillet, h = part_YMotorMount.y + 2);
		translate([ part_YMotorMount.x * -0.5 -1, part_YMotorMount.y * -0.5 -1, -1])cube([ dim_YMotorMountFilletX + 1 - rad_YMotorMountFillet, part_YMotorMount.y + 2, dim_YMotorMountFilletZ + 1]);
		translate([ part_YMotorMount.x * -0.5 -1, part_YMotorMount.y * -0.5 -1, -1])cube([ dim_YMotorMountFilletX + 1, part_YMotorMount.y + 2, dim_YMotorMountFilletZ + 1 - rad_YMotorMountFillet]);

		// bolt hole
		translate([ part_YMotorMount.x * 0.5 - dim_YMotorMountBoltX, 0, -1])cylinder( r = rad_1420, h = part_YMotorMount.z + 2);


		// nema taps
		translate([ part_YMotorMount.x * 0.5 - dim_YMotorMountTapX1, part_YMotorMount.y * 0.5 - dim_YMotorMountTapY, -1])cylinder(r = rad_1032, h = part_YMotorMount.z + 2);
		translate([ part_YMotorMount.x * 0.5 - dim_YMotorMountTapX2, part_YMotorMount.y * 0.5 - dim_YMotorMountTapY, -1])cylinder(r = rad_1032, h = part_YMotorMount.z + 2);
	}
}


module GantryOuterRight(){
	difference(){
		part(part_GantryOuterRight);
		
		// Right hole
		translate([ part_GantryOuterRight.x * 0.5 - dim_GantryOuterRightHole, part_GantryOuterRight.y * -0.5 + dim_GantryOuterRightHole, -1])cylinder(r = rad_GantryOuterRightHole, h = part_GantryOuterRight.z + 2);
		// Right tap hole
		translate([ part_GantryOuterRight.x * 0.5 - dim_GantryOuterRightHole, 0, part_GantryOuterRight.z * 0.5])rotate([ 90, 0, 0])cylinder( r = rad_1032, h = part_GantryOuterRight.y * 0.5 + 1);

		// Left hole
		translate([ part_GantryOuterRight.x * -0.5 + dim_GantryOuterRightHole, part_GantryOuterRight.y * -0.5 + dim_GantryOuterRightHole, -1])cylinder(r = rad_GantryOuterRightHole, h = part_GantryOuterRight.z + 2);
		// Leftt tap hole
		translate([ part_GantryOuterRight.x * -0.5 + dim_GantryOuterRightHole, 0, part_GantryOuterRight.z * 0.5])rotate([ 90, 0, 0])cylinder( r = rad_1032, h = part_GantryOuterRight.y * 0.5 + 1);


		// Right adjust hole
		translate([ part_GantryOuterRight.x * 0.5 - dim_GantryOuterRCapsuleX1, part_GantryOuterRight.y * -0.5 + dim_GantryOuterRCapsuleY, -1]){
			hull(){
				cylinder(r = rad_GantryOuterRCapsule, h = part_GantryOuterRight.z + 2);
				translate([ 0, dim_GantryOuterRCapsuleLen, 0])cylinder(r = rad_GantryOuterRCapsule, h = part_GantryOuterRight.z + 2);
			}
		}
		// Right adjust tap hole
		translate([ part_GantryOuterRight.x * 0.5 - dim_GantryOuterRCapsuleX1, 0, part_GantryOuterRight.z * 0.5])rotate([ -90, 0, 0])cylinder( r = rad_1032, h = part_GantryOuterRight.y * 0.5 + 1);
		
		
		// Left adjust hole
		translate([ part_GantryOuterRight.x * 0.5 - dim_GantryOuterRCapsuleX2, part_GantryOuterRight.y * -0.5 + dim_GantryOuterRCapsuleY, -1]){
			hull(){
				cylinder(r = rad_GantryOuterRCapsule, h = part_GantryOuterRight.z + 2);
				translate([ 0, dim_GantryOuterRCapsuleLen, 0])cylinder(r = rad_GantryOuterRCapsule, h = part_GantryOuterRight.z + 2);
			}
		}
		// Left adjust tap hole
		translate([ part_GantryOuterRight.x * 0.5 - dim_GantryOuterRCapsuleX2, 0, part_GantryOuterRight.z * 0.5])rotate([ -90, 0, 0])cylinder( r = rad_1032, h = part_GantryOuterRight.y * 0.5 + 1);
		
		// Right center hole
		translate([ part_GantryOuterRight.x * 0.5 - dim_GantryOuterRCenterX1, 0, part_GantryOuterRight.z * 0.5])rotate([ -90, 0, 0])cylinder( r = rad_1420, h = part_GantryOuterRight.y * 0.5 + 1);
		
		// Left center hole
		translate([ part_GantryOuterRight.x * 0.5 - dim_GantryOuterRCenterX2, 0, part_GantryOuterRight.z * 0.5])rotate([ -90, 0, 0])cylinder( r = rad_1420, h = part_GantryOuterRight.y * 0.5 + 1);
		
		// Right outer hole
		translate([ part_GantryOuterRight.x * 0.5 - dim_GantryOuterROuterX1, 0, part_GantryOuterRight.z * 0.5])rotate([ -90, 0, 0])cylinder( r = rad_GantryOuterROuter, h = part_GantryOuterRight.y * 0.5 + 1);
		
		// Left outer hole
		translate([ part_GantryOuterRight.x * 0.5 - dim_GantryOuterROuterX2, 0, part_GantryOuterRight.z * 0.5])rotate([ -90, 0, 0])cylinder( r = rad_GantryOuterROuter, h = part_GantryOuterRight.y * 0.5 + 1);
		
		
	}
}

module GantrySpacer(){
	difference(){
		part(part_GantrySpacer);
		
		// Right Big Hole
		translate([ part_GantrySpacer.x * 0.5 - dim_GantrySpacerBigX1, 0, -1])cylinder(r = rad_GantrySpacerBig, h = part_GantrySpacer.z + 2);

		// Left Big Hole
		translate([ part_GantrySpacer.x * 0.5 - dim_GantrySpacerBigX2, 0, -1])cylinder(r = rad_GantrySpacerBig, h = part_GantrySpacer.z + 2);

		// Right Small Hole
		translate([ part_GantrySpacer.x * 0.5 - dim_GantrySpacerSmallX1, 0, -1])cylinder(r = rad_GantrySpacerSmall, h = part_GantrySpacer.z + 2);

		// Left Small Hole
		translate([ part_GantrySpacer.x * 0.5 - dim_GantrySpacerSmallX2, 0, -1])cylinder(r = rad_GantrySpacerSmall, h = part_GantrySpacer.z + 2);

	}
}

module GantryRTop(){
	difference(){
		part(part_GantryPart1);
		
		// Right adj tap hole
		translate([ part_GantryPart1.x * 0.5 - dim_GantryPart1AdjTapHoleX, 0, -1])cylinder(r = rad_1032, h = part_GantryPart1.z * 0.5 + 1);

		// Left adj tap hole
		translate([ part_GantryPart1.x * -0.5 + dim_GantryPart1AdjTapHoleX, 0, -1])cylinder(r = rad_1032, h = part_GantryPart1.z * 0.5 + 1);

		// Right adj hole
		translate([ part_GantryPart1.x * -0.5 + dim_GantryPart1AdjHolesX, part_GantryPart1.y * 0.5 + 1 , part_GantryPart1.z * 0.5])rotate([90, 0, 0])cylinder(r = rad_GantryPart1AdjHoles, h = part_GantryPart1.y + 2);

		// Left adj hole
		translate([ part_GantryPart1.x * 0.5 - dim_GantryPart1AdjHolesX, part_GantryPart1.y * 0.5 + 1 , part_GantryPart1.z * 0.5])rotate([90, 0, 0])cylinder(r = rad_GantryPart1AdjHoles, h = part_GantryPart1.y + 2);

		// Right Hole
		translate([ part_GantryPart1.x * 0.5 - dim_GantryPart1VertHole1X, 0, -1])cylinder(r = rad_GantryLTopMountHole, h = part_GantryPart1.z + 2);

		// Left Hole
		translate([ part_GantryPart1.x * 0.5 - dim_GantryPart1VertHole2X, 0, -1])cylinder(r = rad_GantryLTopMountHole, h = part_GantryPart1.z + 2);

		// Left Bore Hole
		translate([ part_GantryPart1.x * 0.5 - dim_GantryRTopBoreX, 0, -1])cylinder(r = rad_GantryRTopBore, h = part_GantryPart1.z + 2);
		// Left Bore Tap
		translate([ part_GantryPart1.x * 0.5 - dim_GantryRTopBoreX, 1, part_GantryPart1.z * 0.5])rotate([ -90, 0, 0])cylinder(r = rad_1032, h = part_GantryPart1.y * 0.5);
		
		// Right Bore Hole
		translate([ part_GantryPart1.x * -0.5 + dim_GantryRTopBoreX, 0, -1])cylinder(r = rad_GantryRTopBore, h = part_GantryPart1.z + 2);
		// Right Bore Tap
		translate([ part_GantryPart1.x * -0.5 + dim_GantryRTopBoreX, 1, part_GantryPart1.z * 0.5])rotate([ -90, 0, 0])cylinder(r = rad_1032, h = part_GantryPart1.y * 0.5);


		// Right 1/4 Tap
		translate([ part_GantryPart1.x * 0.5 - dim_GantryRTopTapX1, part_GantryPart1.y * -0.5 - 1, part_GantryPart1.z * 0.5])rotate([ -90, 0, 0])cylinder(r = rad_1420, h = part_GantryPart1.y + 2);

		// Left 1/4 Tap
		translate([ part_GantryPart1.x * 0.5 - dim_GantryRTopTapX2, part_GantryPart1.y * -0.5 - 1, part_GantryPart1.z * 0.5])rotate([ -90, 0, 0])cylinder(r = rad_1420, h = part_GantryPart1.y + 2);


		// Right Small Hole
		translate([ part_GantryPart1.x * 0.5 - dim_GantryRTopSmallX1, part_GantryPart1.y * -0.5 - 1, part_GantryPart1.z * 0.5])rotate([ -90, 0, 0])cylinder(r = rad_GantryRTopSmall, h = part_GantryPart1.y + 2);

		// Left Small Hole
		translate([ part_GantryPart1.x * 0.5 - dim_GantryRTopSmallX2, part_GantryPart1.y * -0.5 - 1, part_GantryPart1.z * 0.5])rotate([ -90, 0, 0])cylinder(r = rad_GantryRTopSmall, h = part_GantryPart1.y + 2);


	}
}

module GantryLTop(){

	difference(){
		part(part_GantryPart1);
		
		// Right adj tap hole
		translate([ part_GantryPart1.x * 0.5 - dim_GantryPart1AdjTapHoleX, 0, -1])cylinder(r = rad_1032, h = part_GantryPart1.z * 0.5 + 1);

		// Left adj tap hole
		translate([ part_GantryPart1.x * -0.5 + dim_GantryPart1AdjTapHoleX, 0, -1])cylinder(r = rad_1032, h = part_GantryPart1.z * 0.5 + 1);

		// Right adj hole
		translate([ part_GantryPart1.x * -0.5 + dim_GantryPart1AdjHolesX, part_GantryPart1.y * 0.5 + 1 , part_GantryPart1.z * 0.5])rotate([90, 0, 0])cylinder(r = rad_GantryPart1AdjHoles, h = part_GantryPart1.y + 2);

		// Left adj hole
		translate([ part_GantryPart1.x * 0.5 - dim_GantryPart1AdjHolesX, part_GantryPart1.y * 0.5 + 1 , part_GantryPart1.z * 0.5])rotate([90, 0, 0])cylinder(r = rad_GantryPart1AdjHoles, h = part_GantryPart1.y + 2);

		// Right Hole
		translate([ part_GantryPart1.x * 0.5 - dim_GantryPart1VertHole1X, 0, -1])cylinder(r = rad_GantryLTopMountHole, h = part_GantryPart1.z + 2);

		// Left Hole
		translate([ part_GantryPart1.x * 0.5 - dim_GantryPart1VertHole2X, 0, -1])cylinder(r = rad_GantryLTopMountHole, h = part_GantryPart1.z + 2);

		// Central Hole
		translate([ part_GantryPart1.x * 0.5 - dim_GantryLTopCentralHoleX, 0, -1])cylinder(r = rad_GantryPart1AdjHoles, h = part_GantryPart1.z + 2);

	}

}

module GantryBottom(){
	difference(){
		part(part_GantryPart1);
		
		// Right Hole
		translate([ part_GantryPart1.x * 0.5 - dim_GantryPart1VertHole1X, 0, -1])cylinder(r = rad_GantryBottomVertHoles, h = part_GantryPart1.z + 2);

		// Left Hole
		translate([ part_GantryPart1.x * 0.5 - dim_GantryPart1VertHole2X, 0, -1])cylinder(r = rad_GantryBottomVertHoles, h = part_GantryPart1.z + 2);

		// Right adj tap hole
		translate([ part_GantryPart1.x * 0.5 - dim_GantryPart1AdjTapHoleX, 0, -1])cylinder(r = rad_1032, h = part_GantryPart1.z * 0.5 + 1);

		// Left adj tap hole
		translate([ part_GantryPart1.x * -0.5 + dim_GantryPart1AdjTapHoleX, 0, -1])cylinder(r = rad_1032, h = part_GantryPart1.z * 0.5 + 1);

		// Right adj hole
		translate([ part_GantryPart1.x * -0.5 + dim_GantryPart1AdjHolesX, part_GantryPart1.y * 0.5 + 1 , part_GantryPart1.z * 0.5])rotate([90, 0, 0])cylinder(r = rad_GantryPart1AdjHoles, h = part_GantryPart1.y + 2);

		// Left adj hole
		translate([ part_GantryPart1.x * 0.5 - dim_GantryPart1AdjHolesX, part_GantryPart1.y * 0.5 + 1 , part_GantryPart1.z * 0.5])rotate([90, 0, 0])cylinder(r = rad_GantryPart1AdjHoles, h = part_GantryPart1.y + 2);


	}
}

module GantryTube(){
	difference(){
		
		// tube outer
		part(part_GantryTube);
		
		// tube inner
		translate([0, 0, dim_GantryTubeWall])part([part_GantryTube.x - 2*dim_GantryTubeWall, part_GantryTube.y + 1, part_GantryTube.z - 2*dim_GantryTubeWall]);
		
		// length holes
		for(offset = [0:6]){
			translate([part_GantryTube.x * -0.5 - 0.5, (part_GantryTube.y * - 0.5) + dim_GantryTubeHoleZEndY + (offset * dim_GantryTubeHoleZOffsetY) , dim_GantryTubeHoleOffsetZ])rotate([0,90,0])cylinder(r = rad_GantryTubeHoleZ, h = part_GantryTube.x + 1);
		}
		
		// off center hole
		translate([ part_GantryTube.x * -0.5 + dim_GantryTubeTopHoleOffsetX, part_GantryTube.y * -0.5 + dim_GantryTubeTopHoleOffsetY, -0.5])cylinder(r = rad_GantryTubeTopHole, h = part_GantryTube.z + 1);
		
		
		// top left mounting hole
		translate([ part_GantryTube.x * -0.5 + dim_GantryTubeMountHoleOffsetX, part_GantryTube.y * -0.5 + dim_GantryTubeMountHoleOffsetY, -0.5]){
			cylinder(r = rad_GantryTubeMountHole, h = part_GantryTube.z + 1);
			translate([rad_GantryTubeMountHole * -1, rad_GantryTubeMountHole  * -4, 0])cube([ rad_GantryTubeMountHole * 2, rad_GantryTubeMountHole * 4, part_GantryTube.z + 1]); 
		}

		// bottom left mounting hole
		translate([ part_GantryTube.x * 0.5 - dim_GantryTubeMountHoleOffsetX, part_GantryTube.y * -0.5 + dim_GantryTubeMountHoleOffsetY, -0.5]){
			cylinder(r = rad_GantryTubeMountHole, h = part_GantryTube.z + 1);
			translate([rad_GantryTubeMountHole * -1, rad_GantryTubeMountHole  * -4, 0])cube([ rad_GantryTubeMountHole * 2, rad_GantryTubeMountHole * 4, part_GantryTube.z + 1]); 
		}
		
		// top right mounting hole
		translate([ part_GantryTube.x * -0.5 + dim_GantryTubeMountHoleOffsetX, part_GantryTube.y * 0.5 - dim_GantryTubeMountHoleOffsetY, -0.5]){
			cylinder(r = rad_GantryTubeMountHole, h = part_GantryTube.z + 1);
			translate([rad_GantryTubeMountHole * -1, 0, 0])cube([ rad_GantryTubeMountHole * 2, rad_GantryTubeMountHole * 4, part_GantryTube.z + 1]); 
		}
		
		// bottom right mounting hole
		translate([ part_GantryTube.x * 0.5 - dim_GantryTubeMountHoleOffsetX, part_GantryTube.y * 0.5 - dim_GantryTubeMountHoleOffsetY, -0.5]){
			cylinder(r = rad_GantryTubeMountHole, h = part_GantryTube.z + 1);
			translate([rad_GantryTubeMountHole * -1, 0, 0])cube([ rad_GantryTubeMountHole * 2, rad_GantryTubeMountHole * 4, part_GantryTube.z + 1]); 
		}
		
		// adjacent left hole
		translate([ part_GantryTube.x * 0.5 - dim_GantryTubeAdjacentHoleOffsetX, part_GantryTube.y * -0.5 + dim_GantryTubeAdjacentHoleOffsetY, part_GantryTube.z * 0.5 ]){
			cylinder(r = rad_GantryTubeAdjacentHole, h = part_GantryTube.z);
			translate([ rad_GantryTubeAdjacentHole * -1, rad_GantryTubeAdjacentHole * -4, 0])cube([ rad_GantryTubeAdjacentHole * 2, rad_GantryTubeAdjacentHole * 4, part_GantryTube.z]);
		}
	}
}