dim_24w = 45;
dim_24h = 90;
ang_roof = 15;
dim_ang_offset = 77;
dim_height = 600;
dim_lower_brace = 120;
dim_upper_brace = dim_height - 120;

dim_base_w = 1500;
dim_base_d = 330;

//color([ 0.5, 0.5, 0.5]){
	face(w=dim_base_w,h=dim_height + dim_ang_offset);
	translate([0,dim_base_d - dim_24w,0])face(w=dim_base_w,h=dim_height);
	translate([dim_24w, dim_24w, dim_lower_brace]) rotate([0,0,90])half(dim_base_d - dim_24h, "Spreader");
	translate([dim_24w, dim_24w, dim_upper_brace]) rotate([0,0,90])half(dim_base_d - dim_24h, "Spreader");
	translate([dim_base_w, dim_24w, dim_lower_brace]) rotate([0,0,90])half(dim_base_d - dim_24h, "Spreader");
	translate([dim_base_w, dim_24w, dim_upper_brace]) rotate([0,0,90])half(dim_base_d - dim_24h, "Spreader");
//}

color([ 0, 0.5, 0]){
	translate([0,0,-100])cube([dim_base_w, dim_base_d, 100]);
}
color([ 0, 0, 0.9]){
	translate([0,0,dim_height + dim_ang_offset])rotate([-ang_roof,0,0])translate([-50,-50,0])cube([dim_base_w + 100, dim_base_d + 60, 12]);
	translate([-50, dim_base_d, 0])cube([dim_base_w + 100, 12, dim_height]);
}

module full(w, reason){
	cube([w, dim_24w, dim_24h]);
	echo(reason, "2x4 x ", w);
}
module half(w, reason){
	cube([w, dim_24w, dim_24w]);
	echo(reason, "2x2 x ", w);
}

module face(w ,h){

	translate([dim_24w, 0, 0])full(w - dim_24h, "Front joist");
	translate([dim_24w,0,0])rotate([0,-90,0])half(h - dim_24w, "Front post");
	translate([w, 0, 0])rotate([0,-90,0])half(h - dim_24w, "Front post");
	
	translate([0, 0, h - dim_24w]){
		difference(){
			half(w, "Roof");
			translate([-0.5 * w,0,dim_24w])rotate([-ang_roof, 0, 0])cube([2 * w, dim_24h, dim_24h]);
		}
	}
}

module smallface(w ,h){

	translate([dim_24w, 0, 0])half(w - dim_24h, "Rear joist");
	translate([dim_24w,0,0])rotate([0,-90,0])half(h, "Back post");
	translate([w, 0, 0])rotate([0,-90,0])half(h, "Back post");
	
	translate([0, 0, h - dim_24w]){
		difference(){
			half(w, "Roof");
			translate([-0.5 * w,0,dim_24w])rotate([-ang_roof, 0, 0])cube([2 * w, dim_24h, dim_24h]);
		}
	}
}