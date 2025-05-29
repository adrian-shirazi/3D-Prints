module outside() {
    height = 25.4;
    FRAGMENTS = 16;
    cylinder(h = height*1.5/6, r1 = 7, r2=10, $fn=FRAGMENTS);
    translate([0, 0, height*1.5/6]) {
        cylinder(h = height*3.5/6, r1 = 10, r2=5, $fn=FRAGMENTS);
    }
    translate([0, 0, height*5/6]) {
        cylinder(h = height/6, r1 = 5, r2=7, $fn=FRAGMENTS);
    }
}

module inside() {

}

module vase() {
    height = 25.4;
    FRAGMENTS = 16;
    difference() {
        outside();
        difference() {
            scale(v = [.8, .8, 1]) {
                outside();
            }
            translate([-10, -10, -1]) {
                cube(size = [20, 20, 3]);
            }
        }
    }
}

vase();