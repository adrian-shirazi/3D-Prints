THICKNESS = 1;
HEIGHT = 75;
RADIUS = 50.8;
FRAGMENTS = 90;

module flower_pot_2() {

    module cup() {
        difference() {
            cylinder(h = HEIGHT, r = RADIUS + THICKNESS, $fn=FRAGMENTS);
            translate([0, 0, THICKNESS])cylinder(h = HEIGHT, r = RADIUS, $fn=FRAGMENTS);
        }
        ridges();
        smooth_siding();
    }

    module ridges() {
        module ridge() {
            cube([THICKNESS, RADIUS + THICKNESS * 2, HEIGHT - THICKNESS]);
            translate([RADIUS + THICKNESS, 0, HEIGHT - THICKNESS]) rotate([90, 0, 0]) cylinder(h=THICKNESS, r=THICKNESS, $fn=FRAGMENTS);
        }
        difference() {
            for (i = [0:3:360]) {
                rotate([0, 0, i]) {
                    ridge();
                }
            }
            translate([0, 0, THICKNESS])cylinder(h = HEIGHT, r = RADIUS, $fn=FRAGMENTS);
        }
    }

    module smooth_siding() {
        SMOOTH_HEIGHT = HEIGHT * 4 / 10;
        difference() {
            cylinder(h = SMOOTH_HEIGHT, r = RADIUS + THICKNESS * 2, $fn=FRAGMENTS);
            translate([0, 0, THICKNESS])cylinder(h = SMOOTH_HEIGHT, r = RADIUS, $fn=FRAGMENTS);
        }
    }

    cup();
   
}

flower_pot_2();
