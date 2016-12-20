function ASA(alpha,a,beta) = ((a/sin(alpha))*sin(beta));
$fn = 100;
side = 60;
rad = side / 10;
angle = 120;
height = ASA(90, side, angle/2);
echo(height);

module pyramid(){
	hull(){
		translate([ side * 0.5, height / -3, rad])sphere(r=rad);
		translate([ side * -0.5, height / -3, rad])sphere(r=rad);
		translate([ 0, (height / 3 ) * 2, rad])sphere(r=rad);
		translate([ 0, 0, height])sphere(r=rad);
	}
}

module 3Sides(){
	difference(){
		4Sides();
		translate([ 0, 0, -50 + rad])cube([100,100,100],center=true);
	}
}

module 4Sides(){
	scl = 0.95;
	difference(){
		pyramid();
		translate([0, 0,( 1-scl)/2 * height])scale([scl,scl,scl])pyramid();
		translate([0, 0, height / 3 ])sphere(r=height/2.2);
	}
}

4Sides();