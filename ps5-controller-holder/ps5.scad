module clip() {
    WIDTH = 21;
    THICKNESS = 2;
    difference() { 
        cube([WIDTH + THICKNESS, WIDTH + THICKNESS *2, WIDTH + 12]);
        translate([0, THICKNESS, 0]) cube([WIDTH, WIDTH, WIDTH + 12]);
    }
}

module mount() {
    difference() {
        translate([41, -28, -8])import("dualsense_mount.stl");
        cube([80, 10, 38]);
    }
}

module holder() {
    translate([25, -2, 0])clip();
    mount();
}

holder();