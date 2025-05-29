include <BOSL2/std.scad>;

// actual_widths= [12.5, 17.0, 22.6];
// 14, 20, and 24
widths = [14, 14, 14, 20, 24];

width = 120;
length = 220;
height = 80;

chunk=5;

module base() {
    difference() {
        cuboid([width, length, 10], rounding=4, edges="Z");
        cuboid([width-20, length-10, 10], rounding=4, edges="Z");
        for (i = [14:7:length-14]) {
            translate([width/2 -chunk-chunk/2, i - length/2, 0])cube(5);
            translate([-width/2 +chunk/2, i - length/2, 0])cube(5);
        } 
    }
}

// base();

module rung() {
    small_chunk = chunk-0.5;
    difference() {
        cuboid([width, height, 10], rounding=4, edges="Z");
        cuboid([width-20, height-10, 10], rounding=4, edges="Z");
        cuboid([width, height, 10], anchor=FRONT);
    }
    translate([(width/2)-5, small_chunk/2, small_chunk-5])cuboid(small_chunk, anchor=TOP);
    translate([(-width/2)+5, small_chunk/2, small_chunk-5])cuboid(small_chunk, anchor=TOP);
}

rung();