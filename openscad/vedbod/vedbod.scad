post = [45,70,2000];
cladding = [1200,12,140];
pallet = [1210,1010,140];
corner = 20;
cladding_depth = 1200;
cladding_width = 3000;

inner_depth = cladding_depth + 2 * corner - cladding.y;
inner_width = cladding_width - 2* post.x - corner;


module front_post(){
	difference() {
		cube(post);
		translate([ -0.1, corner+0.1, -1])cube([cladding.y,post.y - corner,post.z+2]);
	}
}

module rear_post(){
	difference() {
		translate([ 0, post.y, 0])mirror([0,1,0])front_post();
		translate([ corner + 0.1, post.y - cladding.y + 0.1, -1]) cube([post.x - corner,cladding.y,post.z+2]);
	}
}

module clad(){
	color("white")
	cube([cladding.y, cladding_depth, cladding.z] );
}

module clad_back(){
	color("white")
	cube([cladding_width, cladding.y, cladding.z] );
}

module wall_post(){
	difference() {
		cube(post);
		translate([post.x - cladding.y,-1,-1])cube([cladding.y + 1, post.y + 2, post.y + 1]);
		translate([post.x - cladding.y,-1,post.z - post.y + 1])cube([cladding.y + 1, post.y + 2, post.y + 1]);
	}
}


module left_wall() {
	translate([-post.x,0,0]){
		front_post();

		for(i=[0:12])
			translate([0,corner,i * (cladding.z+10)])clad();
		
		translate([ 0, cladding_depth - (post.y - corner) + corner, 0])rear_post();

		translate([cladding.y,cladding_depth * 1/3,0])wall_post();

		translate([cladding.y,cladding_depth * 2/3,0])wall_post();

	}
}

module pallet(){
	color("blue")
	cube(pallet);
}

module right_wall(){
	mirror([1,0,0])left_wall();
}

module rear_wall(){
	for(i=[0:12])
			translate([0,0,i * (cladding.z+10)])clad_back();
}

module floor(){
	cube([ post.x, inner_depth, post.y]);
	translate([ cladding_width - corner - post.x, 0, 0])cube([ post.x, inner_depth, post.y]);

	translate([ post.x, 0, 0])cube([inner_width, post.x, post.y]);
	translate([ post.x, 0, post.y])cube([inner_width, post.x, post.y]);
	
	translate([ post.x, inner_depth - post.x, 0])cube([inner_width, post.x, post.y]);

	translate([ post.x, inner_depth * 1/3, 0])cube([inner_width, post.x, post.y]);
	translate([ post.x, inner_depth * 2/3, 0])cube([inner_width, post.x, post.y]);


}

module ceiling(){
	translate([0, 0, post.z - post.y]){
		cube([ post.x, inner_depth, post.y]);
		translate([ cladding_width - corner - post.x, 0, 0])cube([ post.x, inner_depth, post.y]);
		translate([ post.x, 0, 0])cube([inner_width, post.x, post.y]);
		translate([ post.x, inner_depth - post.x, 0])cube([inner_width, post.x, post.y]);
	}
}

module pallets(){
	translate([ 50, 70, 0])pallet();
	translate([ 50 + pallet.x + post.x, 70, 0])pallet(); 	
}

module asm(){
	left_wall();
	translate([cladding_width - corner, 0, 0])right_wall();
	translate([-(post.x - corner),cladding_depth + corner*2 - cladding.y,0])rear_wall();
	pallets();
	floor();
	ceiling();
}

asm();