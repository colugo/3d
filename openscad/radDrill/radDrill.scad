$fn = 100;
rad_main = 25;
dim_wallMain = 5;
dim_wallH = 3;

asm();


module grid(){
	difference(){
		pie(r=rad_main, h= dim_wallH);
		rotate([0,0,-3])hexArray(10,10,4);
	}
}

module asm(){
difference(){
	rotate([ 0, 0, 45])
	union(){
		difference(){
			pie(r=rad_main, h= dim_wallH);
			translate([dim_wallMain * 0.4, dim_wallMain * 0.4,-1])pie(r=rad_main - dim_wallMain, h= dim_wallH + 2);
		}
		grid();
		translate([sqrt(2)*-1,sqrt(2)*-1,0])cylinder(r=8,h=dim_wallH);
	}
	translate([0,-2,0])cylinder(r=1.5,h=100,center=true);
	}
}

module hexArray(x,y,r){
	gap = r;
	scale([1.1,1,1])
	translate([x * r * -1, y * r * -1,0]){
		for(yOff = [0:2:y])
			for(xOff = [0:x])
				translate([xOff * (r + gap), yOff * (r*0.9 + gap),0])rotate([0,0,30])cylinder(r=r,h = 20,center=true,$fn = 6);
		for(yOff = [1:2:y])
			for(xOff = [0:x])
				translate([xOff * (r + gap) + r , yOff * (r*0.9 + gap),0])rotate([0,0,30])cylinder(r=r,h = 20,center=true,$fn = 6);
	}

}


module pie(r,h){
	intersection(){
		cylinder(r = r, h = h);
		translate([0,0,-1])cube([r,r,h+2]);
	}
}