pin_x=-35.3;
pin_y = -6.5;
bolt_r = 7.2/2;
pin_r = 4.1/2;
pin_h = 6;

wall_thickness = 3;
bar_r = 8.4;
width = 30;
gap=8;


bar_offset_x = 20 + bar_r;
bar_offset_z = -1 *(bar_r + wall_thickness);
main_thickness = wall_thickness + bar_r * 1.6;

pin_plate_thickness = 5;

module base(){
	union(){
		difference(){
			bar_holder();
			cylinder(r=bolt_r,100,center=true,$fn=40);
			translate([-5,-20,-12])cube([bar_offset_x + 5,40,gap]);
			translate([-5,0,-12+gap/2])rotate([90,0,0])cylinder(r=gap/2,h=40,center=true,$fn=40);
			
		}
		translate([pin_x,pin_y,0])cylinder(r=pin_r,pin_h,center=true,$fn=40);
	}
}

module bar_holder(){
	difference(){
		union(){
			translate([bar_offset_x,0,bar_offset_z])rotate([90,0,0])tube(ir=bar_r,h=width,or=bar_r + wall_thickness);
			hull(){
				translate([0,width/-2,-1*main_thickness])cube([bar_offset_x,width,main_thickness]);
				translate([-25,width/-2,-1*main_thickness])cube([bar_offset_x,width,main_thickness]);
				translate([pin_x,pin_y,-1*pin_plate_thickness])cylinder(r=pin_r+2*wall_thickness,pin_plate_thickness,$fn=40);
				translate([pin_x/3,0,-0.5*main_thickness])cylinder(r=width/2,main_thickness/2,$fn=40);
			}
		}
		translate([bar_offset_x,0,bar_offset_z])rotate([90,0,0])cylinder(r=bar_r,h=100,center=true,$fn=60);
	}
}

module tube(or,ir,h){
	difference(){
		cylinder(r=or,h=h,center=true,$fn=60);
		cylinder(r=ir,h=h+2,center=true);
	}
}

base();

