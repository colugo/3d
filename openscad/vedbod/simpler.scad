gravel = [3800,1700,200];
panel=[12,0,140];
//envelope = [2800,1500, panel.z * 15];
envelope = [2800,1500, panel.z * 15 -30];
upright_notch = 20;
dim2x4 = [90,35];



module regular2x4(length=100,veritcle="v"){
	ppm = 3.5;
	//echo("2x4",length/1000);
	//color("red"){
		if(veritcle=="v"){
			cube([dim2x4.x,dim2x4.y,length]);
		}
		if(veritcle=="h"){
			cube([dim2x4.x, length, dim2x4.y]);
		}
		if(veritcle=="j"){
			cube([length, dim2x4.y, dim2x4.x]);
		}
	//}
}

module panel(length=1000){
	tongue=2;
	gap=2;

	depth = panel.z - gap;

	cube([panel.x, length, depth]);
	translate([ 0.5* (panel.x - tongue), 0, depth])cube([tongue, length, gap]);
}


module side_wall(){

	spine();

	for(slats = [0:14])
	translate([ 0, 0, slats * panel.z - 30]) panel(envelope.y);
}


module spine(){
	vert_length = envelope.z - 2*dim2x4.y;
	translate([panel.x,0,0]){
		translate([ 0, 0, dim2x4.y]){
			regular2x4(vert_length,"v");
			translate([0,envelope.y - dim2x4.y,0])regular2x4(vert_length,"v");
			translate([0,0.5 * (envelope.y - dim2x4.y),0])regular2x4(vert_length,"v");
		}
		regular2x4(envelope.y, "h");
		translate([ 0, 0, vert_length + dim2x4.y])regular2x4(envelope.y, "h");
	}
}

module joists(){
	number = 5;
	translate([0,0,dim2x4.x * -1]){
		for( i = [0:(envelope.y-dim2x4.y)/(number-1):(envelope.y-dim2x4.y)]){
			translate([0,i,0])regular2x4(envelope.x,"j");
		}
	}
}

module rafters(){
	number = 3;
	translate([0,0,envelope.z]){
		difference() {
			for( i = [0:(envelope.y-dim2x4.y)/(number-1):(envelope.y-dim2x4.y)]){
				translate([0,i,0])regular2x4(envelope.x,"j");
			}
			rotate([ 0, -30, 0])translate([0,-50,0])cube([200,envelope.y+100,100]);
			translate([envelope.x,0,20])mirror([1,0,0])rotate([0,-30,0])translate([0,-50,0])cube([200,envelope.y+100,100]);
		}
	}
}

module floor(){
	for (i = [1:11]){
		translate([ i * (dim2x4.x + 25), 0, 0])cube([100, 1500, 12]);
		translate([ (envelope.x * 0.5) - dim2x4.x*0.5 + i * (dim2x4.x + 25), 0, 0])cube([100, 1500, 12]);
	}
}

module truss(){
	hangover = 150;
	fudge = 52.5;
	truss = 1616 + hangover + fudge;
	cripple = 910;
	number = 3;
	for( i = [0:(envelope.y-dim2x4.y)/(number-1):(envelope.y-dim2x4.y)])
		translate([ 0, i, envelope.z]){
			%rotate([ 0, -30, 0])translate([-1 * hangover,0,0])regular2x4(truss,"j");
			%translate([envelope.x,0,0])mirror([1,0,0])rotate([ 0, -30, 0])translate([-1 * hangover,0,0])regular2x4(truss,"j");
			translate([(envelope.x - dim2x4.x)*0.5, -1 * dim2x4.y, 0])regular2x4(cripple,"v");
		}



		translate([ 300, 0, 2345])rotate([ 0, 60, 0])regular2x4(1500,"h");
		translate([ 1000, 0, 2745])rotate([ 0, 60, 0])regular2x4(1500,"h");


		translate([ 2320, 0, 2345])rotate([ 0, -60, 0])regular2x4(1500,"h");
		translate([ 1820, 0, 2645])rotate([ 0, -60, 0])regular2x4(1500,"h");

}

module rear(){
	translate([ 0, 35, 35])
		for(i = [0 : 13])translate([ 0, 0, i * 150])cube([envelope.x, 12, 50]);
}

module roofpanel(w,h){
	translate([(envelope.x - w) * 0.5,0,h * panel.z])rotate([ 0, 0, 270])panel(w);
	echo("RoofPanel",w/1000);
}

module slats(){
	difference() {
		translate([0, envelope.y +10 , 2070])
		{
			roofpanel(2800,0);//1
			roofpanel(2700,1);//2
			roofpanel(2200,2);//3
			roofpanel(1700,3);//1
			roofpanel(1300,4);//2
			roofpanel(800,5);// top
			roofpanel(300,6);//2
		}

		translate([ 0, 0, 2170])rotate([ 0, -30, 0])translate([-500,0,0])cube([3000,4000,500]);
		translate([ 2800, 0, 0])mirror([ 1, 0, 0])translate([ 0, 0, 2170])rotate([ 0, -30, 0])translate([-500,0,0])cube([3000,4000,500]);
	}

}


module facade(){

	translate([0, envelope.y +10 , 0]){
		translate([ 0, 0, -128])roofpanel(2800,0);
		translate([ 0, -12, 10])cube([110,12,2060]);
		translate([ envelope.x - 110, -12, 10])cube([110,12,2060]);
		translate([ envelope.x * 0.5 - 55, -12, 10])cube([110,12,2060]);
	
		translate([ -150, 0, 2030])rotate([ 0, -30, 0])cube([1850,12,110]);
		mirror([1,0,0])translate([ -150 - envelope.x, 0, 2030])rotate([ 0, -30, 0])cube([1850,12,110]);
	}

}

module shed(){
	color([0.8,0.8,1])translate([0,0,-gravel.z - dim2x4.x])cube(gravel);
	//%cube(envelope);

	translate([ 300, 0, 0]){

		color("white"){
			side_wall();
			translate([envelope.x, 0, 0])mirror([1,0,0])side_wall();
			floor();

			translate([ 0.5 * (envelope.x - dim2x4.x), 0, 0])spine();
			joists();
			rafters();
			truss();

		slats();


		}

		rear();

		color("blue")facade();


	}

}

shed();

