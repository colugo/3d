dim_width = 95;
dim_length = 95;
dim_height = 10;
dim_wall = 1;


difference(){
	cube([ dim_width, dim_length, dim_height], center=true);
	cube([ dim_width - 2 * dim_wall, dim_length - 2 * dim_wall, dim_height + 100], center=true);
}