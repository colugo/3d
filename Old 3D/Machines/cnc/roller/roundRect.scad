include <metric.scad>;

module roundRect( size, center, cornerRadius = 5, holeRadius = 1.5, holeOffset = 10, fn=20, holeTaper = false, taperType = "screw"){
	if( center )
	{
		translate( size / -2 )roundRectInner( size, cornerRadius, holeRadius, holeOffset, fn, holeTaper, taperType );
	}
	else{
		roundRectInner( size, cornerRadius, holeRadius, holeOffset, fn, holeTaper, taperType );
	}
}

module roundRectInner( size, cornerRadius, holeRadius, holeOffset, fn, holeTaper, taperType ){
	difference(){
		hull(){
			translate([ cornerRadius, cornerRadius, 0 ])cylinder( r = cornerRadius, h = size.z, $fn = fn );
			translate([ cornerRadius,size.y-cornerRadius,0 ])cylinder( r = cornerRadius, h = size.z, $fn = fn );
			translate([ size.x - cornerRadius,cornerRadius,0 ])cylinder( r = cornerRadius, h = size.z, $fn = fn );
			translate([ size.x - cornerRadius,size.y - cornerRadius,0 ])cylinder( r = cornerRadius, h = size.z, $fn = fn );
		}
		translate([ holeOffset, holeOffset, -1 ]){
			cylinder( r = holeRadius, h = size.z + 2, $fn = fn );
			if( holeTaper ){
				if(taperType == "screw" )translate([ 0, 0, size.z + holeRadius ]) scale([ 2, 2, 1.1 ])sphere( r = holeRadius, $fn = fn );
				if(taperType == "m6" )translate([ 0, 0, size.z + 1.01 - m6_h ]) m6nut();
			}
		}
		translate([ size.x - holeOffset, holeOffset, -1 ]){
			cylinder( r = holeRadius, h = size.z + 2, $fn = fn );
			if( holeTaper ){
				if(taperType == "screw" )translate([ 0, 0, size.z + holeRadius ]) scale([ 2, 2, 1.1 ])sphere( r = holeRadius, $fn = fn );
				if(taperType == "m6" )translate([ 0, 0, size.z + 1.01 - m6_h ]) m6nut();
			}
		}
		translate([ holeOffset, size.y - holeOffset, -1 ]){
			cylinder( r = holeRadius, h = size.z + 2, $fn = fn );
			if( holeTaper ){
				if(taperType == "screw" )translate([ 0, 0, size.z + holeRadius ]) scale([ 2, 2, 1.1 ])sphere( r = holeRadius, $fn = fn );
				if(taperType == "m6" )translate([ 0, 0, size.z + 1.01 - m6_h ]) m6nut();
			}
		}
		translate([ size.x - holeOffset, size.y - holeOffset, -1 ]){
			cylinder( r = holeRadius, h = size.z + 2, $fn = fn );
			if( holeTaper ){
				if(taperType == "screw" )translate([ 0, 0, size.z + holeRadius ]) scale([ 2, 2, 1.1 ])sphere( r = holeRadius, $fn = fn );
				if(taperType == "m6" )translate([ 0, 0, size.z + 1.01 - m6_h ]) m6nut();
			}
		}
	}
}