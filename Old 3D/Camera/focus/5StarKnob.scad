knob_h = 5;
knob_bevel = 5;
knob_bevel_h = 2;
knob_r = 14;
h_bevel = 1- (knob_bevel/knob_r);
washer_r = 8;
washer_h = 2;
bore_r = 7.2/2;
nut_r = 6.5;
nut_offset = 5 - washer_h;
flats = 11.2;

module nut(){
	translate([0,0,nut_offset])rotate([0,0,30])cylinder(r=nut_r,h=knob_h+knob_bevel_h+1,$fn=6);
}

module tightner(){
	color([0.8,0,0])
	difference(){
		union(){
			translate([0,0,-1*washer_h])washer();
			handle();
		}
		nut();
		bore();
	}
}

module bore(){
	cylinder(r=bore_r,h=100,$fn=40,center=true);
}

module washer(){
	difference(){
		cylinder(r=washer_r,h=washer_h,$fn=40);
	}
}

module handle_top(){
	for(r=[0:360/5:360]){
		rotate([0,0,r])translate([knob_r-4,0,0])cylinder(r=knob_r*0.25,h=knob_h,$fn=40);
	}
}

module handle(){
	difference(){
		hull(){
			handle_top();
			translate([0,0,knob_bevel_h])scale([h_bevel,h_bevel,1])handle_top();
		}
		rotate([0,0,35])
		for(r=[0:360/5:360]){
			rotate([0,0,r])translate([knob_r,0,-1])scale([1,2,1])cylinder(r=knob_r/4,h=knob_h+2,$fn=40);
		}
	}
}

//tightner();

//nut();
//cube([flats,flats,flats],center=true);

