// Must be tall enough to cut through the bottom
HOLE_HEIGHT = 6; 
SMALL_HOLE_RADIUS = 2;
POT_HEIGHT = 100;
POT_RADIUS = 50;
FRAGMENTS = 360;

flower_pot_top();

module flower_pot_top() {
    difference() {
        union() {
            outside();
            ribs();
        }
        inside();
        drip_holes();
        peg_holes();
    }
}

// The texture on the side of the pot
module ribs()
{
    for (i = [0:8:360]) {
        rotate([0, 0, i]) {
            // roundedcube([2, 55, POT_HEIGHT], radius=0.5);
            cube([2, 55, POT_HEIGHT]);
        }
    }
}

// Outside of the flower pot
module outside()
{
    cylinder(h=POT_HEIGHT, r=POT_RADIUS, $fn=FRAGMENTS);
}

// Inside of the flower pot (hollow)
module inside() {
    translate([0, 0, 4]) {
        cylinder(h=POT_HEIGHT, r=POT_RADIUS - 5, $fn=FRAGMENTS);
    }
}

// For drainage of the flower pot
module drip_holes() {
    union() {
        center_hole();
        hole_wheel();
    }
}

module center_hole() {
    translate([0, 0, -1]) {
        cylinder(h = HOLE_HEIGHT, r = 4, $fn=FRAGMENTS);
    }
}

module hole_wheel() {
    for (i = [0:90:360]) {
        rotate(i, [0, 0, 1]) {
            line();
        }
        rotate(i + 45, [0, 0, 1]) {
            diagonal();
        }
    }
}

module line() {
    for (i = [1:3]) {
        translate([(POT_RADIUS / 4) * i, 0, -1]) {
            cylinder(h = HOLE_HEIGHT, r = SMALL_HOLE_RADIUS, $fn=FRAGMENTS);
        }
    }
}

module diagonal() {
    for (i = [1:2]) {
        translate([(POT_RADIUS / 4) * i, 0, -1]) {
            cylinder(h = HOLE_HEIGHT, r = SMALL_HOLE_RADIUS, $fn=FRAGMENTS);
        }
    }
}

module peg_hole() {
    translate([POT_RADIUS - 2.5, 0, POT_HEIGHT - 4]) {
        cylinder(h = 5, r = SMALL_HOLE_RADIUS, $fn=FRAGMENTS);
    }
}

module peg_holes() {
    for (i = [0:90:360]) {
        rotate(i + 45, [0, 0, 1]) {
            peg_hole();
        }
    }
}