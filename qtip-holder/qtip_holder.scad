module qtip_holder() {
    box();
    lid();
}

module box() {
    difference() {
        cube([100, 60, 60]);
        translate([5, 5, 5]) 
        cube([90, 50, 60]);
    }
}

module lid() {
    
}

box();
