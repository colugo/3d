dim_width = 355;
dim_height = 585;
dim_thickness = 5;


module equilateral(w,h,t){
	linear_extrude(height = t, center = true, convexity = 10, twist = 0)
	polygon(points=[[w * -0.5,0],[w * 0.5,0],[0,h]], paths=[[0,1,2]]);	
}

module top(){
	translate([ 0, 0, dim_thickness * 0.5])cube([dim_width, dim_width, dim_thickness], center = true);
}


hull(){
top();
rotate([ 0, 0, 45])translate([0, 0, dim_height * 0.5])scale([0.7,0.7,1])top();
}

translate([0,0,dim_height])mirror([ 0, 0, -1])
hull(){
top();
rotate([ 0, 0, 45])translate([0, 0, dim_height * 0.5])scale([0.7,0.7,1])top();
}

//for(i = [0:90:360])rotate([0,0,i])
//translate([ 0, dim_width * 0.5 - dim_thickness * 0.5, 0])rotate([ 90, 0, 0])equilateral( dim_width, dim_height * 0.5, dim_thickness);
//equilateral(50,50,5);


