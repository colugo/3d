//bar
include <dims.scad>;
use <ybrace.scad>;

bar();

module bar(){
	difference(){	
		echo("Bar len = ", dim_legGap + 2 * dim_baseExtension);
		translate([ 0, 0, dim_thickness * 0.5])cube([ dim_critical, dim_legGap + 2 * dim_baseExtension, dim_thickness], center=true);
		
		translate([ dim_critical * -1, dim_legGap * 0.5 + dim_baseExtension - dim_yBrace, -1 * dim_ply])plate();
		translate([ dim_critical * -1, dim_legGap * 0.5 + dim_baseExtension - dim_yBrace, dim_thickness - dim_ply])plate();
		
		translate([ dim_critical * -1, dim_legGap * -0.5 - dim_baseExtension, -1 * dim_ply])plate();
		translate([ dim_critical * -1, dim_legGap * -0.5 - dim_baseExtension, dim_thickness - dim_ply])plate();
	}
}