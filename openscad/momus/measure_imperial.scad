function i2m(x)=x*25.4;

//Taps
rad_1032 = i2m(0.175 / 2);
rad_1420 = i2m(0.25 / 2);

// Gantry Tube
part_GantryTube = [i2m(3), i2m(24), i2m(1.5)];
dim_GantryTubeWall = i2m(0.125);
dim_GantryTubeHoleOffsetZ = i2m(0.75);
rad_GantryTubeHoleZ = i2m(0.5 / 2);
dim_GantryTubeHoleZEndY = i2m(2.25);
dim_GantryTubeHoleZOffsetY = i2m(3.25);
dim_GantryTubeTopHoleOffsetY = i2m(12.75);
dim_GantryTubeTopHoleOffsetX = i2m(0.375);
rad_GantryTubeTopHole = i2m(0.3125 / 2);
rad_GantryTubeMountHole = i2m(0.3125 / 2);
dim_GantryTubeMountHoleOffsetY = i2m(0.375);
dim_GantryTubeMountHoleOffsetX = i2m(0.4375);
dim_GantryTubeMountHoleGapX = i2m(2.125);
rad_GantryTubeAdjacentHole = i2m(0.375 / 2);
dim_GantryTubeAdjacentHoleOffsetY = i2m(0.375);
dim_GantryTubeAdjacentHoleOffsetX = i2m(0.4375 + 0.875);

// Common Gantry Parts
part_GantryPart1 = [i2m(7.375), i2m(0.75), i2m(0.75)];
dim_GantryPart1AdjTapHoleX = i2m(0.375);
rad_GantryPart1AdjHoles = i2m(0.375 / 2);
dim_GantryPart1AdjHolesX = i2m(0.375);
dim_GantryPart1VertHole1X = i2m(3.125);
dim_GantryPart1VertHolesY = i2m(0.375);
dim_GantryPart1VertHole2X = i2m(3.125 + 2.125);

// Gantry Bottom
rad_GantryBottomVertHoles = i2m(0.3125 / 2);

// Gantry Left Top
rad_GantryLTopMountHole = i2m( 0.250 / 2);
dim_GantryLTopCentralHoleX = i2m(4.0);

// Gantry Right Top
rad_GantryRTopBore = i2m(0.375 / 2);
dim_GantryRTopBoreX = i2m(1.25);
dim_GantryRTopTapX1 = i2m(1.875);
dim_GantryRTopTapX2 = i2m(1.875 + 3.75);
rad_GantryRTopSmall = i2m(0.25 / 2);
dim_GantryRTopSmallX1 = i2m(1.875 + 1);
dim_GantryRTopSmallX2 = i2m(1.875 + 1 + 2);

// Gantry Spacer
part_GantrySpacer = [i2m(5.625), i2m(0.75), i2m(0.125)];
rad_GantrySpacerBig = i2m(0.3125 / 2);
rad_GantrySpacerSmall = i2m(0.25 / 2);
dim_GantrySpacerBigX1 = i2m( 1 );
dim_GantrySpacerBigX2 = i2m( 1 + 3.75);
dim_GantrySpacerSmallX1 = i2m( 1 + 1);
dim_GantrySpacerSmallX2 = i2m( 1 + 1 + 2);

// Gantry Outer Right
part_GantryOuterRight = [i2m(5.625), i2m(1), i2m(0.75)];
rad_GantryOuterRightHole = i2m(0.375 / 2);
dim_GantryOuterRightHole = i2m(0.375);
rad_GantryOuterRCapsule = i2m(0.3125 / 2);
dim_GantryOuterRCapsuleX1 = i2m(2);
dim_GantryOuterRCapsuleX2 = i2m(2 + 2);
dim_GantryOuterRCapsuleLen = i2m(0.25);
dim_GantryOuterRCapsuleY = i2m(0.375);
dim_GantryOuterRCenterX1 = i2m(2.625);
dim_GantryOuterRCenterX2 = i2m(2.625 + 0.75);
rad_GantryOuterROuter = i2m(0.3125 / 2);
dim_GantryOuterROuterX1 = i2m(1);
dim_GantryOuterROuterX2 = i2m(1 + 3.75);

// Y Motor Mount Comn
part_YMotorMount = [ i2m(2.25), i2m(0.75), i2m(1.25)];
rad_YMotorMountFillet = i2m( 0.125 );
dim_YMotorMountFilletX = i2m( 0.375);
dim_YMotorMountFilletZ = i2m( 0.75);
dim_YMotorMountBoltX = i2m(0.625);
dim_YMotorMountTapY = i2m(0.303);
dim_YMotorMountTapX1 = i2m(0.1875);
dim_YMotorMountTapX2 = i2m(0.1875 + 1.856);


// X Belt Plate
part_XBeltPlate = [ i2m(1.25), i2m(1.875), i2m(0.375)];
rad_XBeltPlateBore = i2m(0.3125 / 2);
dim_XBeltPlateBoreX1 = i2m(0.25);
dim_XBeltPlateBoreX2 = i2m(0.25 + 0.75);
dim_XBeltPlateBoreY = i2m(0.625 + 0.875);
dim_XBeltPlateTapY = i2m(0.625);

// X Belt Clamp
part_XBeltClamp = [ i2m(1.25), i2m(1), i2m(0.375)];
rad_XBeltClampBore = i2m(0.3125 / 2);
dim_XBeltClampBoreY = i2m(0.625);
dim_XBeltClampChamferY = i2m(0.062);

// Timing Belt
dim_TimingBeltPeriod = i2m(0.094);
dim_TimingBeltFreq = i2m(0.20);
dim_TimingBeltAmp = i2m(0.063);

// Y Rail
part_YRail = [ i2m(22.5), i2m(2.5), i2m(0.25) ];
dim_YRailYStart = i2m(1.5);
dim_YRailYOffset = i2m(3.25);

// Carriage Block Rear Upper
part_CarriageBlockRU = [i2m(6.75), i2m(0.75), i2m(0.75)];
part_CarriageBlockRUTapX = i2m(0.375);
rad_CarriageBlockRULower = i2m(0.375 / 2);
part_CarriageBlockRULowerX = i2m(0.875);
part_CarriageBlockRULowerY = i2m(0.393);
part_CarriageBlockRUUpperY = i2m(0.25);
part_CarriageBlockRUUpperX1 = i2m(2.9375);
part_CarriageBlockRUUpperX2 = i2m(2.9375 + 0.875);
rad_CarriageBlockRU = i2m(0.375 / 2);
part_CarriageBlockRUMiddleX = i2m(1.6875);

// Carriage Block Rear Lower
part_CarriageBlockRL = [i2m(6.75), i2m(1.25), i2m(0.75)];
rad_CarriageBlockRLFillet = i2m(0.125);
part_CarriageBlockRLFilletX = i2m(1.313);
part_CarriageBlockRLFilletY = i2m(0.50);
rad_CarriageBlockRLBigHoles = i2m(0.375 / 2);
rad_CarriageBlockRLSmallHoles = i2m(0.1875 / 2);
part_CarriageBlockRLEdgeOffset = i2m(0.375);
part_CarriageBlockRLTopHoleX = i2m(1.688 - 0.188);
part_CarriageBlockRLTopHoleY = i2m(0.438);
part_CarriageBlockRLTopHoleInX = i2m(1.688 + 0.188);
part_CarriageBlockRLTopTapX = i2m(0.875);
part_CarriageBlockRLTopTapY = i2m( 0.5 + 0.375);
part_CarriageBlockRLMiddleHoleX = i2m(1.688);
part_CarriageBlockRLMiddleTapX = i2m(2.9375);
part_CarriageBlockRLMiddleTapY = i2m(0.25);


// Bearing Block
part_BearingBlock = [i2m(0.75), i2m(1), i2m(1.75)];
rad_BearingBlockBigHoles = i2m(0.375 / 2);
rad_BearingBlockSmallHoles = i2m(0.3125 / 2);
dim_BearingBlockTop = i2m(0.25);
dim_BearingBlockSideY = i2m(0.25);
dim_BearingBlockSideZ1 = i2m(0.4375);
dim_BearingBlockSideZ2 = i2m(0.4375 + 0.875);
dim_BearingBlockBackX = i2m(0.25);
dim_BearingBlockBackZ = i2m(0.1875);

// Bearing Block Tapped
dim_BearingBlockTappedBackZ = i2m(0.1875 + 0.6875);

// Carriage Block Front Right
part_CarriageBlockFrontRight = [i2m(8.5), i2m(0.75), i2m(0.75)];
rad_CarriageBlockFR = i2m(0.375 / 2);
rad_CarriageBlockFRSmall = i2m(0.3125 / 2);
dim_CarriageBlockFREdge = i2m(0.375);
dim_CarriageBlockFREdgeX = i2m(0.8125);
dim_CarriageBlockFREdgeX2 = i2m(0.8125 + 5.625);
dim_CarriageBlockFRSmallEdgeX1 = i2m(0.25);
dim_CarriageBlockFRSmallEdgeX2 = i2m(0.25 + 0.50);
dim_CarriageBlockFRTapEdgeX1 = i2m(3.438);
dim_CarriageBlockFRTapEdgeX2 = i2m(3.438 + 0.875);
dim_CarriageBlockFRTapEdgeY = i2m(0.25);
dim_CarriageBlockFRSideEdge = i2m(0.375 + 6.5);
dim_CarriageBlockFRSideMiddleX1 = i2m(1.938);
dim_CarriageBlockFRSideMiddleX2 = i2m(1.938 + 3.625);

// Carriage Block Front Left
part_CarriageBlockFrontLeft = [i2m(7.25), i2m(0.75), i2m(0.75)];
rad_CarriageBlockFL = i2m(0.375 / 2);
dim_CarriageBlockFLTEdge = i2m(0.8125);
dim_CarriageBlockFLTY = i2m(0.25);
dim_CarriageBlockFLTX1 = i2m(3.438);
dim_CarriageBlockFLTX2 = i2m(3.438 + 0.875);
dim_CarriageBlockFLSY = i2m(0.375);
dim_CarriageBlockFLSX1 = i2m(1.938);
dim_CarriageBlockFLSX2 = i2m(1.938 + 3.625);

// Spacer Upper
part_SpacerUpper = [i2m(0.75), i2m(0.75), i2m(0.75)];
rad_SpacerUpper = i2m(0.375 / 2);

// Spacer Lower
part_SpacerLower = [i2m(0.75), i2m(1.25), i2m(0.75)];
rad_SpacerLower = i2m(0.375 / 2);

// Z Motor Mount Right
part_ZMotorMountR = [i2m(2.75), i2m(0.75), i2m(1)];
rad_ZMotorMountRTop = i2m(0.25 / 2);
dim_ZMotorMountRTopY = i2m(0.197);
dim_ZMotorMountRTopX1 = i2m(0.197);
dim_ZMotorMountRTopX2 = i2m(0.197 + 1.856);
rad_ZMotorMountBore = i2m(0.625);
dim_ZMotorMountBoreY = i2m(0.375);
dim_ZMotorMountBoreX = i2m(0.197 + (1.856 / 2));
rad_ZMotorMountRSmall = i2m(0.3125 / 2);
dim_ZMotorMountSmallX = i2m(0.375);
dim_ZMotorMountSmallZ = i2m(0.25);

// Z Motor Mount Left
dim_ZMotorMountLZ = i2m(0.25);
dim_ZMotorMountLX = i2m(0.25);
dim_ZMotorMountLD = i2m(0.75);

// Z Cable Plate
part_ZCablePlate = [i2m(4.25), i2m(2.25), i2m(0.1875)];
rad_ZCablePlateBore = i2m(1.5 / 2);
dim_ZCablePlateX = i2m(1.125);
rad_ZCablePlateFillet = i2m(0.125);
dim_ZCablePlateFilletX = i2m(2.25);
dim_ZCablePlateFilletY = i2m(1.5);