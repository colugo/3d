dim_major_width = 1800;
dim_major_depth = 600;
dim_carcas_height = 510;

dim_sheet_thickness = 19;

dim_torsion_height = 65;

dim_mitre_height = 100 - dim_sheet_thickness;

//////////////////////////////////////////////////////////////////////////////////////

module sheet(w, h, part){
	cube([w, h, dim_sheet_thickness]);
	echo("BOM:",part,w,h,dim_sheet_thickness);
}

module sheetv(w, h, part){
	translate([0,0,dim_sheet_thickness])cube([w, dim_sheet_thickness, h]);
	echo("BOM:",part,w,h,dim_sheet_thickness);
}

//////////////////////////////////////////////////////////////////////////////////////

carcas();
translate([ 0, 0, -1 * ( 2 * dim_sheet_thickness + dim_sheet_thickness)])torsion();

translate([ 0, 0, dim_carcas_height + dim_sheet_thickness * 2])box();
translate([ dim_major_width - dim_major_depth, 0, dim_carcas_height + dim_sheet_thickness * 2])box();

module box(){
	offset = 80;
	sheet(dim_major_depth, dim_major_depth, "Box base");

	translate([ dim_sheet_thickness, 0, 0])rotate([ 0, 0, 90])sheetv(dim_major_depth, dim_mitre_height, "Box end");
	translate([ dim_sheet_thickness + offset, 0, 0])rotate([ 0, 0, 90])sheetv(dim_major_depth, dim_mitre_height, "Box end");

	translate([ dim_major_depth , 0, 0])rotate([ 0, 0, 90])sheetv(dim_major_depth, dim_mitre_height, "Box end");
	translate([ dim_major_depth - offset, 0, 0])rotate([ 0, 0, 90])sheetv(dim_major_depth, dim_mitre_height, "Box end");

	translate([ (dim_major_depth - offset) / 2 + dim_sheet_thickness/2 , 0, 0])rotate([ 0, 0, 90])sheetv(dim_major_depth, dim_mitre_height, "Box end");
	translate([ (dim_major_depth - offset) / 2 + offset + dim_sheet_thickness/2, 0, 0])rotate([ 0, 0, 90])sheetv(dim_major_depth, dim_mitre_height, "Box end");

	difference(){
		translate([ 0, 0, dim_mitre_height + dim_sheet_thickness])sheet(dim_major_depth, dim_major_depth, "Box base");

		translate([ dim_major_depth / 2, 0, 0])cube([16, 2000, 400], center=true);
		translate([ offset / 2 + dim_sheet_thickness/2, 0, 0])cube([16, 2000, 400], center=true);
		translate([ dim_major_depth - offset / 2 - dim_sheet_thickness/2, 0, 0])cube([16, 2000, 400], center=true);
	}

}

module carcas(){
	dim_mitre_saw = 620;
	dim_drill = 620;

	sheet(dim_major_width, dim_major_depth, "Carcas base");
	translate([ dim_sheet_thickness, 0, 0])rotate([ 0, 0, 90])sheetv(dim_major_depth, dim_carcas_height, "Carcas end");
	translate([ dim_major_width, 0, 0])rotate([ 0, 0, 90])sheetv(dim_major_depth, dim_carcas_height, "Carcas end");
	translate([ dim_major_width - dim_mitre_saw - dim_sheet_thickness, 0, 0])rotate([ 0, 0, 90])sheetv(dim_major_depth, dim_carcas_height, "Carcas end");
	translate([ dim_drill + dim_sheet_thickness * 2, 0, 0])rotate([ 0, 0, 90])sheetv(dim_major_depth, dim_carcas_height, "Carcas end");
	translate([ 0, 0, dim_carcas_height + dim_sheet_thickness]) sheet(dim_major_width, dim_major_depth, "Carcas top");

}


module torsion(){
	

	sheet(dim_major_width, dim_major_depth, "Torsion base");
	sheetv(dim_major_width, dim_torsion_height, "Torsion long wall");
	translate([0, dim_major_depth - dim_sheet_thickness, 0])sheetv(dim_major_width, dim_torsion_height, "Torsion long wall");

	for( joist = [0 : 200 + dim_sheet_thickness : (dim_major_width - dim_sheet_thickness)]){
		translate([ dim_sheet_thickness + joist, dim_sheet_thickness, 0])rotate([ 0, 0, 90])sheetv( dim_major_depth - 2 * dim_sheet_thickness, dim_torsion_height, ,"Torsion joist");
	}
	translate([ dim_major_width, dim_sheet_thickness, 0])rotate([ 0, 0, 90])sheetv( dim_major_depth - 2 * dim_sheet_thickness, dim_torsion_height, ,"Torsion joist");

	translate([ 0, 0, dim_torsion_height + dim_sheet_thickness])sheet(dim_major_width, dim_major_depth, "Torsion base");

	for( joist = [0 : 200 + dim_sheet_thickness : (dim_major_width - dim_sheet_thickness) - 100]){
		for (rib = [dim_major_depth / 4 : dim_major_depth / 4 : dim_major_depth - 1]){
			translate([ joist + dim_sheet_thickness, rib, 0])sheetv(200, dim_torsion_height, "Torsion rib");
		}
	}

}