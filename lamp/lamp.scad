include <BOSL2/std.scad>;

// Base measurements
hole_diameter = 40+1; // 40mm + 1mm wiggle room
thickness = 6;
diameter = 85;
height = 60;
fn=60;

// tube(1, radius+2, radius, $fn=100);

module base() {
    module stand() {
        tube(h=height, od=hole_diameter*2, wall=thickness, $fn=fn, anchor=TOP, ochamfer1=2, ochamfer2=2);
        tube(h=thickness/2, id=hole_diameter, od=hole_diameter*2-thickness, $fn=fn, anchor=TOP);
    }
    module hole() {
        translate([diameter/2 - thickness/2, 0, -height+5])cuboid([thickness*2, 5, 16], rounding=1);
    }
    difference() {
        stand();
        hole();
    }
}
// color([0.541, 0.267, 0])base();

module shade() {
    height = 2;
    spoke_width = 5;
    spoke_length = 18;

    module base() {
        tube(h=height, id=hole_diameter, od=hole_diameter+10, $fn=fn, anchor=BOTTOM);
        for (i = [0:72:360]) {
            rotate([0, 0, i])translate([-spoke_width/2, hole_diameter/2, 0])cube([spoke_width, spoke_length, height]);
        }
        tube(h=height, id=hole_diameter+30, od=hole_diameter+40, $fn=fn, anchor=BOTTOM);
        }

    module shade() {
        tex = texture("cubes");
        // difference() {
        //     linear_sweep(circle(d=diameter+37), h=140, texture=tex, tex_size=[20,20], tex_depth=1, twist=90);
        //     linear_sweep(circle(d=diameter+35), h=140, texture=tex, tex_size=[20,20], tex_depth=1, twist=90);
        // }
        difference() {
            cyl(h=200, d=240, texture=tex, tex_size=[30,30], tex_depth=1, anchor=BOTTOM, rounding=240/2.5);
            cyl(h=200, d=238, texture=tex, tex_size=[30,30], tex_depth=1, anchor=BOTTOM, rounding=238/2.5);
            cube([200, 200, 30], center=true);
            translate([0, 0, 200])cube([200, 200, 30], center=true);
            // spheroid(d=105, style="icosa", circum=true, $fn=10, anchor=BOTTOM);
            // spheroid(d=104, style="icosa", circum=true, $fn=10, anchor=BOTTOM);
            // cube([200, 200, 30], center=true);
            // translate([0, 0, 105])cube([200, 200, 30], center=true);
        }
    }
    
    base();
    // scale([1, 1, 1.8])translate([0, 0, -15])shade();
    // scale([1, 1, 0.825])translate([0, 0, -15])shade();
    scale([.54, .54, 0.825])translate([0, 0, -15])shade();
}

color([1,1,1])shade();