module hook() {
    THICKNESS = 2;
    HEIGHT = 5;
    LENGTH = 50;
    BOTTOM_RADIUS = 10;
    TOP_RADIUS = 2;
    FRAGMENTS = 45;
    BOTTOM_ANGLE = 30;

    arm_length = LENGTH - TOP_RADIUS - BOTTOM_RADIUS - 2*THICKNESS;
    top_shift = [BOTTOM_RADIUS+THICKNESS/2, arm_length, 0];
    bottom_shift = [BOTTOM_RADIUS+THICKNESS/2, 0, 0];
    top();
    bottom();
    arm();

    module curve(radius) {
        difference() {
            cylinder(h=HEIGHT, r=radius+THICKNESS, $fn=FRAGMENTS);
            cylinder(h=HEIGHT, r=radius, $fn=FRAGMENTS);
            translate([-radius-THICKNESS, -radius-THICKNESS, 0]) cube([2 * (radius+THICKNESS), radius+THICKNESS, HEIGHT]);
        }
        translate([-radius-THICKNESS/2, 0, 0]) cylinder(h=HEIGHT, r=THICKNESS/2, $fn=FRAGMENTS);
        translate([radius+THICKNESS/2, 0, 0]) cylinder(h=HEIGHT, r=THICKNESS/2, $fn=FRAGMENTS);
    }

    module top() {
        translate(top_shift) curve(TOP_RADIUS);
        translate(top_shift) rotate([0, 0, BOTTOM_ANGLE]) curve(TOP_RADIUS);
        translate(top_shift) rotate([0, 0, -BOTTOM_ANGLE-10]) curve(TOP_RADIUS);
    }
        

    module bottom() {
        translate(bottom_shift + [0, 0, HEIGHT]) rotate([180, 0, BOTTOM_ANGLE]) curve(BOTTOM_RADIUS);
    }

    module arm() {
        // Positions for the endpoints of the arm
        arm_start = top_shift + [
            (-TOP_RADIUS - THICKNESS / 2) * cos(BOTTOM_ANGLE),
            (-TOP_RADIUS - THICKNESS / 2) * sin(BOTTOM_ANGLE),
            0
        ];
        arm_end = bottom_shift + [
            (BOTTOM_RADIUS + THICKNESS / 2) * cos(BOTTOM_ANGLE),
            (BOTTOM_RADIUS + THICKNESS / 2) * sin(BOTTOM_ANGLE),
            0
        ];


        // Create a connecting arm using a hull between cylinders
        hull() {
            translate(arm_start)
                cylinder(h=HEIGHT, r=THICKNESS / 2, $fn=FRAGMENTS);
            translate(arm_end)
                cylinder(h=HEIGHT, r=THICKNESS / 2, $fn=FRAGMENTS);
        }
    }
}

hook();
