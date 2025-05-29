POT_RADIUS = 50;
POT_HEIGHT = 100;
FRAGMENTS = 360;
SMALL_HOLE_RADIUS = 2;

lip();
// The lip of the flower pot
module lip() {
    union() {
        translate([0, 0, 4]) {
            difference() {
                outside_lip();
                inside_lip();
                translate([0, 0, -1]) {
                    cylinder(h=2, r=POT_RADIUS - 5, $fn=FRAGMENTS);
                }
            }
        }
        peg_legs();
    }
}

module outside_lip() {
    cylinder(h = 10, r1 = 55, r2 = 52.5, $fn=FRAGMENTS);
}

module inside_lip() {
    cylinder(h = 11, r1 = 45, r2 = 45, $fn=FRAGMENTS);
}

module peg_leg() {
    translate([POT_RADIUS - 2.5, 0, 0]) {
        cylinder(h = 4, r = SMALL_HOLE_RADIUS, $fn=FRAGMENTS);
    }
}

module peg_legs() {
    for (i = [0:90:360]) {
        rotate(i + 45, [0, 0, 1]) {
            peg_leg();
        }
    }
}