dim_depth = 1190;
dim_width = 750;
dim_height_top = 1340;
dim_height_base = 615;
dim_depth_base = 200;

dim_tile_height = 150;
dim_tile_width = 30;



module hebel(){
	color("white"){
		translate([0,0,dim_height_base])cube([dim_width, dim_depth, dim_height_top]);
		cube([dim_width,dim_depth_base,dim_height_base]);
	}
}

hebel();

corner();

module corner(){
	translate([-dim_tile_width,0,0])cube([dim_tile_width, 150, dim_tile_height]);
	translate([ -30, -30, 0])cube([450 + dim_tile_width, 30, dim_tile_height]);
}