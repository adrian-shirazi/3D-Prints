module hook() {
    top(10, 20);
    middle();
    bottom(10, 25);
}

module top(h, r) {
    segments = 100;
    union() {
        difference() {
            cylinder(h = h, r = r, $fn=segments);
            translate(v = [0, 0, -1]) {
                cylinder(h = h+2, r = r-5, $fn=segments);
            }
            translate([0, -r, -1]) {
                cube([r*3, r, 12]);
            }
            translate([(r-5)*-1, (r-5)*-1, -1]) {
                rotate(a = -45, v = [0, 0, 1]) {
                    cube([30, r, 12]);
                }
            }
            
        }
        translate(v = [-r+2.5, 0, 0]) {
            cylinder(h = h, r = 2.5, $fn=segments);
        }
        translate(v = [r-2.5, 0, 0]) {
            cylinder(h = h, r = 2.5, $fn=segments);
        }
    }
}

module middle() {
    rotate(a = 45, v = [0, 0, 1]) {
        translate(v = [-20, -40, 0]) {
            cube([5, 40, 10]);
        }
    }
}

module bottom(h, r) {
    rotate(a = 180, v = [0, 0, 1]) 
    translate(v = [0, 56.5, 0]) 
    top(h, r);
}

hook();