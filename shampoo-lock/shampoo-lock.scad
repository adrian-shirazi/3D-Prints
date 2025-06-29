include <BOSL2/std.scad>;

height = 31;
radius = 11.36 / 2;
seg = 90;

difference() {
    cyl(h=height, r=radius+2, $fn=seg);
    cyl(h=height, r=radius, $fn=seg);
    translate([3, -10, -height]) cube([20, 20, height*2], center=false);
}
