include <BOSL2/std.scad>;
// I know it's really shitty but I doubt i'll have to touch it again

// 42 mm x 102 mm x 5.7 mm
// cube([42, 102, 5.7]);
// cuboid([42, 102, 5.7], rounding=2);
width = 42;
length = 102;
height = 5.7;

x = 3.5;
y = 4;
z = 20;

module x() {
    cuboid([width, length, height], rounding=2.5, edges="Z", except=[BACK+LEFT, FWD+LEFT], $fn=30);
}

difference() {
  x();
  scale([0.8, 0.9215555555, 1.1])x();
}

cuboid([width, 4, height]);
// translate([0, length/4 - 1, 0])cuboid([width, 4, height]);
translate([0, -length/4 + 2, 0])cuboid([width, 4, height]);

translate([0, -length/2 +2, 0])cuboid([20, 4, height/2+5], anchor=TOP, rounding=2, edges="Y", $fn=30);
translate([0, length/2 -2, 0])cuboid([20, 4, height/2+5], anchor=TOP, rounding=2, edges="Y", $fn=30);

translate([0, -length/2 +2, 0])cuboid([5, 5, height/2+7], anchor=TOP, rounding=2, edges="ALL", $fn=30);
translate([0, length/2 -2, 0])cuboid([5, 5, height/2+7], anchor=TOP, rounding=2, edges="ALL", $fn=30);
