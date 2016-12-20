// ybrace
include <dims.scad>;

ybrace();

module ybrace(){
	translate([ dim_critical * -0.5, dim_yBrace * -1 - dim_baseExtension, 0])cube([dim_critical, dim_yBrace, dim_ply]);
	rotate([ 0, 0, ang_horizontal * 0.5])translate([ dim_critical * -0.5, -dim_baseExtension, 0])cube([dim_critical, dim_yBrace, dim_ply]);
	rotate([ 0, 0, ang_horizontal * -0.5])translate([ dim_critical * -0.5, -dim_baseExtension, 0])cube([dim_critical, dim_yBrace, dim_ply]);
	
	echo("dim_critical",dim_critical);
	echo("dim_baseExtension",dim_baseExtension);
	echo("dim_baseExtension + dim_critical",dim_baseExtension + dim_critical);


}

module plate(){
	scale([ 2, 1, 2])cube([dim_critical, dim_yBrace, dim_ply]);
}