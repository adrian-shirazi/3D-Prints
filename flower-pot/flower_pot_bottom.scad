POT_RADIUS = 50;
FRAGMENTS = 360;

flower_pot_bottom();

module flower_pot_bottom() {
    bottom_lip();
    center_peg();
    kidney_beans();
    legs();
}

module bottom_lip() {
    difference() {
        cylinder(h = 10, r1 = 52.5, r2 = 55, $fn=FRAGMENTS);
        translate([0, 0, 2]) {
            cylinder(h = 10, r1 = 47.5, r2 = 50, $fn=FRAGMENTS);
        }
    }
}

module center_peg() {
    cylinder(h = 14, r = 4, $fn=FRAGMENTS); // Needs to be 4 mm above to fit with the hole in the top
}

module kidney_beans() {
    for (i = [0:90:360]) {
        rotate(i, [0, 0, 1]) {
            kidney_bean();
        }
    }
}

module kidney_bean() {
    for (i = [1:45]) {
        rotate(i, [0, 0, 1]) {
            translate([(POT_RADIUS / 4) * 3, 0, 0]) {
                cylinder(h=10, r=4);
            }
        }
    }
}

module legs() {
    for (i = [0:90:360]) {
        rotate(i + 45 / 2, [0, 0, 1]) {
            leg();
        }
    }
}

module leg() {
    translate([(POT_RADIUS / 4) * 3, 0, -10]) {
        cylinder(h = 10, r1 = 2, r2 = 4, $fn=FRAGMENTS);
    }
}
