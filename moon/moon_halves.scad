module moon_half_1() {
    difference() {
        scale(0.5) import("Dexters_Moon_v2.stl");
        translate([-50, -50, -100]) cube([100, 100, 100]);
    }
}

moon_half_1();

module moon_half_2() {
    difference() {
        scale(0.5) import("Dexters_Moon_v2.stl");
        translate([50, 50, 100]) cube([100, 100, 100]);
    }
}

// moon_half_2();