tube_inner_r = 16.5/2 + 0.1;
wall = 1.6;
wall_l = 20;
m6_offset = 11;
head_width = 5.65;
head_h = 3.3;

part_h = 8 + head_h;

difference(){
	part();
	mould();
}


module part(){
	rotate([0,0,180])translate([-5,0,-1 * part_h + 1])cube([10,3 + m6_offset,part_h]);
	cylinder(r=tube_inner_r,h=head_h + 0.9);
	translate([0,0,-1 * part_h + 1])cylinder(r=5,h=part_h + 0.9);
}


module mould(){
	translate([0,m6_offset * -1,0]){
		sides();
		rotate([0,180,0])translate([0,m6_offset,-1.1])cylinder(r=3.05,h=100,$fn=20);
		translate([0,m6_offset,1])rotate([0,0,90])cylinder(r=head_width,h=head_h,$fn=6);
	}
}


module sides(l=30){
	translate([0,0,1])
	difference(){
		rotate([0,45,0]){
			translate([0,0,-1 * wall_l])side(l);
			rotate([0,90,0])side(l);
		}
		cube([10,l * 3,2],center=true);
	}
}

module side(l=30){
	cube([wall,l,wall_l]);
}