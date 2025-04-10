// Load BOSL2
include <BOSL2/std.scad>
include <BOSL2/rounding.scad>
include <BOSL2/threading.scad>

// =========================
// Adjustable Parameters
// =========================
peg_diameter = 10;         // mm
peg_length = 10;           // How far out from wall before the bend
arm_length = 40;           // How far left/right the arm reaches
curve_radius = 15;         // Radius of the bend between peg and arm
backing_plate_width = 30;
backing_plate_height = 50;
backing_plate_thickness = 3;
wall_clearance = 25;       // Distance from wall to outer edge of curve
nail_hole_diameter = 3;    // Optional nail hole
segments = 90;

// =========================
// Main Module
// =========================
module scarf_holder_half() {
    difference() {
        // Backing plate
        cuboid([backing_plate_width, backing_plate_height, backing_plate_thickness], anchor=TOP, rounding=5, edges=[FWD+RIGHT,FWD+LEFT,BACK+RIGHT,BACK+LEFT]);

        // Optional nail hole in center
        translate([0, backing_plate_height/3, 0])cylinder(d=nail_hole_diameter, h=backing_plate_thickness + 1, anchor=TOP, $fn=segments);
    }
    // Peg: straight cylinder coming out from plate
    cylinder(d=peg_diameter, h=peg_length, anchor=BOT, $fn=segments);

    // Curve: small arc from peg to arm
    module curve_arm() {
        rotate_extrude(angle=90, $fn=segments)
            translate([curve_radius, peg_length, 0])
                circle(d=peg_diameter);
    }
    translate([curve_radius, peg_length, peg_length])
        rotate([90, -90, 0])
            curve_arm();

    // Arm: straight cylinder going sideways
    translate([curve_radius, 0, peg_length + curve_radius])
        rotate([0, 90, 0])
            cylinder(d=peg_diameter, h=arm_length, anchor=BOT, $fn=segments);
}

// =========================
// Preview
// =========================
scarf_holder_half();

// To create the other half:
// mirror([1,0,0]) scarf_holder_half();
