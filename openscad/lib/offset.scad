/*
 * Offset - returns the expanded outline shape
 *
 */
module offset(thickness = 0.5) {
  render() {
    minkowski() {
      children();
      cube([2 * thickness, 2 * thickness, 2 * thickness], center=true);
    }
  }
}

/*
 * Offset shell - gives a vertical shell between the original extrusion
 *   and the offsetted shape
 *
 */
module offset_shell(thickness = 0.5) {
  render() {
    difference() {
      offset(thickness)
        children();
      translate([0, 0, -5 * thickness]) scale([1, 1, 100])
        children();
    }
  }
}

/*
 * Inset - returns the shrunken outline shape
 *
 */
module inset(thickness = 0.5, bbox = [5000, 5000, 5000]) {
  module invert() {
    difference() {
      cube(bbox, true);
      children();
    }        
  }

  render() {
    invert(0.9 * bbox)
      minkowski() {
        invert() children();
        cube([2 * thickness, 2 * thickness, 2 * thickness], center=true);
      }
  }
}

/*
 * Inset shell - gives the vertical shell between the original extrusion
 *   and the inset shape
 *
 */
module inset_shell(thickness = 0.5, bbox = [5000, 5000, 5000]) {
  render() {
    difference() {
      children();
      translate([0, 0, -5 * thickness]) scale([1, 1, 100])
        translate([0, 0, -2 * thickness])
          inset(thickness, bbox)
            children();
    }
  }
}


