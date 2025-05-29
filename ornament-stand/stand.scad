// OpenSCAD script for a folding display stand similar to the image
// Uses the BOSL2 library for convenience

include <BOSL2/std.scad>;
include <BOSL2/hinges.scad>;

module display_stand(base_thickness=5, arm_thickness=5, height=150, width=75) {
    // Base part of the stand
    module base_part() {
        difference() {
            linear_extrude(height=base_thickness)
                offset(r=10) // Rounded edges
                polygon(points=[[0, 0], [width, 0], [width/2, height]]);

            translate([width/2, height/2, 0])
                cylinder(r=5, h=base_thickness, center=true);
        }
    }

    // Arms of the stand
    module arm_part() {
        difference() {
            linear_extrude(height=arm_thickness)
                offset(r=8)
                polygon(points=[[0, 0], [width/2, 0], [width/4, height]]);

            translate([width/4, height/3, 0])
                cylinder(r=3, h=arm_thickness, center=true);
        }
    }

    // Hinges connecting the parts
    module hinge_connector() {
        translate([width/2, height/2, 0])
            hinge(diameter=8, thickness=2, hole=true);
    }

    // Combine the parts
    union() {
        translate([-width/2, 0, 0])
            base_part();

        translate([0, 0, base_thickness])
            arm_part();

        hinge_connector();
    }
}

// Render the stand
display_stand();

