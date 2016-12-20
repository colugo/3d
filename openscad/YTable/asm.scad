include <dims.scad>;
use <leg.scad>;
use <bar.scad>;
use <ybrace.scad>;
use <chairs.scad>;

dim_supportWidth = 850;
dim_supportLength = 2440;

translate([dim_tableWidth * -0.5, dim_tableLength * -0.5, dim_tableHeight + 12])color([0.9,0.9,0.9])cube([dim_tableWidth,dim_tableLength,dim_tableTop]);
translate([dim_supportWidth * -0.5, dim_supportLength * -0.5, dim_tableHeight])color([1,0,0])cube([dim_supportWidth,dim_supportLength,12]);

// legs
translate([ 0, dim_legGap * 0.5, 0]){
	rotate([ 0, 0, ang_horizontal * 0.5])leg();
	rotate([ 0, 0, ang_horizontal * -0.5])mirror([ 1, 0, 0])leg();
}

mirror([ 0, 1, 0])
translate([ 0, dim_legGap * 0.5, 0]){
	rotate([ 0, 0, ang_horizontal * 0.5])leg();
	rotate([ 0, 0, ang_horizontal * -0.5])mirror([ 1, 0, 0])leg();
}

//bars
bar();
translate([ 0, 0, dim_thickness * -1 + dim_tableHeight ])bar();


//braces
translate([ 0, dim_legGap * 0.5 + dim_baseExtension * 2, 0])ybrace();
translate([ 0, dim_legGap * 0.5 + dim_baseExtension * 2, dim_thickness - dim_ply])ybrace();
mirror([0,1,0]){
	translate([ 0, dim_legGap * 0.5 + dim_baseExtension * 2, 0])ybrace();
	translate([ 0, dim_legGap * 0.5 + dim_baseExtension * 2, dim_thickness - dim_ply])ybrace();
}

translate([ 0, dim_legGap * 0.5 + dim_baseExtension * 2, dim_tableHeight - dim_ply])ybrace();
translate([ 0, dim_legGap * 0.5 + dim_baseExtension * 2, dim_tableHeight - dim_thickness])ybrace();
mirror([0,1,0]){
	translate([ 0, dim_legGap * 0.5 + dim_baseExtension * 2, dim_tableHeight - dim_ply])ybrace();
	translate([ 0, dim_legGap * 0.5 + dim_baseExtension * 2, dim_tableHeight - dim_thickness])ybrace();
}

/*
//chairs

translate([ 450, 215 + 25, 0])whiteChair();
translate([ 450, (dim_legGap * 0.5) - 215 + 50, 0])whiteChair();
translate([ 450, -215 - 25, 0])whiteChair();
translate([ 450, (dim_legGap * -0.5) + 215 - 50, 0])whiteChair();
translate([ -450, 215 + 25, 0])whiteChair();
translate([ -450, (dim_legGap * 0.5) - 215 + 50, 0])whiteChair();
translate([ -450, -215 - 25, 0])whiteChair();
translate([ -450, (dim_legGap * -0.5) + 215 - 50, 0])whiteChair();

translate([0,dim_tableLength * 0.5,0])clearChair();
translate([0,dim_tableLength * -0.5,0])clearChair();

*/
