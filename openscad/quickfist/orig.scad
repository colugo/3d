$fn=80;
module husk(){
hull(){
    translate([5,5,0])cylinder(r=5,h=22);
    translate([65,5,0])cylinder(r=5,h=22);

    translate([5,48,0])cylinder(r=5,h=22);
    translate([65,48,0])cylinder(r=5,h=22);

    translate([15,54,0])cylinder(r=5,h=22);
    translate([55,54,0])cylinder(r=5,h=22);
}
}

module body(){
    difference(){
        husk();
        translate([35,33,-5])cylinder(r=45/2,h=100);
    }
    nodes();
}

module nodes(){
for(i=[0:360/12:360]){
    translate([ 35, 33, 0])rotate([0,0,i])translate([45/2,0,0])cylinder(r=2,h=22);
}}

module clamp(){
    difference(){
        body();
        for(i=[0:3])
        translate([0,41-i*10,0])rotate([0,0,30])translate([0,0,-10])cube([6,4,100]);
        translate([35,68,-10])cylinder(r=18,h=100);
        translate([35-9.5,9,-10])cube([19,10,100]);
        translate([35,50,11])rotate([90,0,0])cylinder(r=3.1,h=100);
    }
}

clamp();
flat_handle();


module flat_handle(){
    translate([-15,82,0])rotate([0,0,-25])translate([0,0,-5]){
        difference(){
            cube([80,3.5,32]);
            translate([25,-1,4])cube([30,10,24]);
        }
    }
}

