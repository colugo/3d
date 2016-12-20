//blind remote holder

// base rect width
dim_baseWidth = 40;

// base rect length
dim_baseLength = 12;
// base rect length thin
dim_baseLengthThin = 10;

// base rect height
dim_baseHeight = 80;


// rad base curve
rad_baseCurve = 162.5;

cube([ 0, 0, 0);

module remote(){
	hull(){
		intersection(){
			translate([ dim_baseWidth * -0.5, dim_baseLengthThin * -0.5, 0])cube([ dim_baseWidth, dim_baseLengthThin, 1]); 
			translate([ 0, dim_baseLengthThin * 0.5 - rad_baseCurve, -1])cylinder(r = rad_baseCurve, h = 3, $fn = 500);
			translate([ 0, dim_baseLengthThin * -0.5 + rad_baseCurve, -1])cylinder(r = rad_baseCurve, h = 3, $fn = 500);
		}
		translate([ 0, 0, dim_baseHeight])
		intersection(){
			translate([ dim_baseWidth * -0.5, dim_baseLength * -0.5, 0])cube([ dim_baseWidth, dim_baseLength, 1]); 
			translate([ 0, dim_baseLength * 0.5 - rad_baseCurve, -1])cylinder(r = rad_baseCurve, h = 3, $fn = 500);
			translate([ 0, dim_baseLength * -0.5 + rad_baseCurve, -1])cylinder(r = rad_baseCurve, h = 3, $fn = 500);
		}
	}
}