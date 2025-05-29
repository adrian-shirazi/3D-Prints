include <BOSL2/std.scad>;
include <BOSL2/rounding.scad>

height = 3.2;
width = 18;
length = 38;

module base () {
    glued_circles(r=width/2, spread=length-width, tangent=0, $fn=30);
}

// base();

module hole() {
    diameter = 8;
    circle(d=diameter, $fn=30);
}

// hole();

module arm() {
    length = 12;
    width = 5;
    diameter = 6;

    square([length, width]);
    translate([0, width/2, 0])circle(d=diameter, $fn=30);
}

// arm();

module final_shape() {
    linear_extrude(height=height) {
        difference() {
            base();
            translate([-10, 0, 0])hole();
            translate([-2.5, 0, 0])rotate([0, 0, -90])arm();
            translate([12.5, 1.5, 0])rotate([0, 0, 110])arm();
        }
    }
}


final_shape();