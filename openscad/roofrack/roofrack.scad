$fn = 100;
total_depth = 20;
clamping_distance = 35;



top();
translate([ 0, -5, 0])bottom();

translate([ -1 * clamping_distance, -42, 0])rotate([-90,0,0])twist();
translate([ clamping_distance, -42, 0])rotate([-90,0,0])twist();



module twist(){
  difference(){
    union(){
      cylinder(r=7.5,h=15);
      hull(){
        translate([10,0,0])cylinder(r=7.5,h=6);
        translate([-10,0,0])cylinder(r=7.5,h=6);
      }
    }
    translate([0,0,26])rotate([-90,0,0])bolt_hole();
  }

}

module bolt_hole(){
  nut_r = 6.5;
  nut_d = 6;
  washer_r = 8;
  washer_h = 5;
  bore_r = 7.2/2;
  bore_h = 40;


  rotate([0,90,0])translate([ 0, 27.05 + 2*nut_d, 0]) rotate([ 90, 0, 0])cylinder(r=nut_r,h=nut_d*3,$fn=6);
  translate([ 0, 22, 0])rotate([90,0,0])cylinder(r=bore_r, h = bore_h);
  translate([ 0, -16, 0])rotate([ 90, 0, 0])cylinder(r=washer_r, h=washer_h);
}


module outer_clamp(){
	hull(){
		scale([1.05,0.65,1])cylinder(r=35, h=total_depth, center=true);
    translate([36,-10,0])cylinder(r=8,h=total_depth,center = true);
    translate([-36,-10,0])cylinder(r=8,h=total_depth,center = true);

    translate([36,20,0])cylinder(r=8,h=total_depth,center = true);
    translate([-36,20,0])cylinder(r=8,h=total_depth,center = true);
	}
}

module top(){
  difference(){
    body();
    translate([0,-100,0])cube(200,center=true);
  }
}

module bottom(){
  difference(){
    body();
    translate([0,100,0])cube(200,center=true);
  }
}

module body(){
  translate([0,3,0])
      difference(){
          translate([0,-1,0])outer_clamp();
          aerobar();
          translate([-35.5,0,0])bolt_hole();
          translate([35.5,0,0])bolt_hole();

          translate([20,36,0])rotate([180,0,0])bolt_hole();
          translate([-20,36,0])rotate([180,0,0])bolt_hole();

      }
}

module aerobar(){
    linear_extrude(height = total_depth * 4, center = true, convexity = 10){
        half();
        mirror([1,0,0])half();
    }
}


module half(){
    hull(){
        // leftmost
        translate([ -19, -2.5, 0])circle(9);

        // upper
        intersection(){
            translate([ -24, 0, 0])square(24);
            translate([ 0, -21, 0])circle(36);
        }
    }

    //top
    translate([ 0, 8, 0])scale([ 1, 0.5, 1])circle(14);

    //bottom
    translate([ -11, -12, 0])circle(3);
    translate([ -12, -15, 0])square(24);

    //bottom corner
    difference(){
        translate([-19, -15, 0])square(7);
        translate([-18.2, -15.5, 0])circle(4);
    }
}
