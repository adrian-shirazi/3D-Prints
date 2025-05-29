FRAGMENTS = 360;

holder();

module holder() {
    difference() {
        cat();
        hole();
    }
}

module cat() {
    // Scale the imported geometry
    // Translate the scaled geometry
    // translate([0, -1, 0])
    rotate(a = 90, v = [1, 0, 0]) 
    scale(v = [2.05, 1.6, 1.6]) 
    translate(v = [0, 0, -2]) 
    import("cat.stl");
}

module hole() {
    cylinder(h = 200, r = 18/2, $fn=FRAGMENTS);
}
