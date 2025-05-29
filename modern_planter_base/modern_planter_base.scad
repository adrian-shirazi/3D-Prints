include <BOSL2/std.scad>


module planter() {
    color("red") { import(file="modern_planter_centered.stl", center=true); }
}


module bowl() {
    down(2.25) scale([1.33, 1.33, 1]) import("plant_tray.stl", center=true);
}

module both() {
    planter();
    bowl();
}

bowl();

// difference() {
//     both();
//     left(100) down(40) cube([200, 100, 150]);
// }