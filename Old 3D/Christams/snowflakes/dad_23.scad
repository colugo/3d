union(){
import(filename="release/dad2.stl");
translate([0,10,0])cube([0.1,0.1,20]);
translate([0,0,6])import(filename="release/dad3.stl");
}