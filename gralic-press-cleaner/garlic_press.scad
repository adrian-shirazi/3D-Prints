// Adrian Shirazi
// September 13, 2023

// Note: all units are in mm
FRAGMENTS = 360;

brush();

module brush() {
    union() {
        base();
        spikes();
    }
    clip();

}

module base() {
    // Plate:
    // 25 mm wide (on the y axis)
    // 30 mm long (on the x axis)
    // 2 mm tall (on the z axis)
    translate(v = [0, 0, 0]) {
        scale(v = [1.2, 1, 1]) {
            cylinder(h = 2, d = 25);
        }
    }
    // Handle:
    // 8 mm wide
    // 35 mm long (give or take)
    // 2 mm tall
    // curve from side !
    module handle() {
        translate(v = [-31.5, 0, 1]) {
            cube(size = [36, 8, 2], center=true);
            
        }
    }
    // difference() {
        handle();
        translate(v = [-25, -2, -0]) {
            rotate(a = 180, v = [0, 1, 0]) {
                linear_extrude(height=0.6) {
                    text(text = "2.0", size=4);
                }
            }
        }
    // }
    
}

module clip() {
    // 3 mm valley
    translate(v = [0, 0, 4]) {

        
        difference() {
            union() {
            cube(size = [12, 6, 6], center=true);
            half_cylinders();
        }
            cube(size = [22, 3, 7], center=true);
        }
        
    }
    module half_cylinders() {
        difference() {
            union() {
                translate([6, 3, -2]) {
                    rotate(a = 90, v = [1, 0, 0]) {
                        cylinder(h = 6, r = 5, $fn=FRAGMENTS);
                    }
                }
                translate([-6, 3, -2]) {
                    rotate(a = 90, v = [1, 0, 0]) {
                        cylinder(h = 6, r = 5, $fn=FRAGMENTS);
                    }
                }
            }
            translate(v = [0, 0, -5]) { 
                cube(size = [22, 10, 5], center=true);
            }
        }
    }
}

module spikes() {
    // 4 mm tall
    // 1 mm diameter
    // 6 mm separation longways
    // 3 mm separation shortways 
    spike_diameter = 1.5;
    module spike() { cylinder(h = 4, d = spike_diameter, $fn=FRAGMENTS); }
    base_height = 4;
    longways_sep = 6;
    shortways_sep = 3;

    module big_line() {
        for (i = [-3:3]) {
            translate(v = [0, i * shortways_sep, 0]) {
                spike();
            }
        }
    }

    module small_line() {
        for (i = [-1:1]) {
            translate(v = [0, i * shortways_sep, 0]) {
                spike();
            }
        }
    }

    for (i = [-2:2]) {
        if (i > -2 && i < 2)
        translate(v = [i * longways_sep, 0, -base_height]) {
            big_line();
        }
        else {
            translate(v = [i * longways_sep, 0, -base_height]) {
                small_line();
            }
        }
    }

    module middle_line() {
        for (i = [1:6]) {
            translate(v = [longways_sep / 2, (i * shortways_sep) + (shortways_sep / 2) -12, -base_height]) {
                spike();
            }
        }
    }

    for (i = [-2:1]) {
        translate(v = [i * longways_sep, 0, 0]) {
            middle_line();
        } 
    }

    // for (y = [0:num_cols]) {
    //     for (x = [0:num_rows]) {
    //         translate([x + longways_sep, y - shortways_sep, -base_height]) {
    //             spike();
    //         }
    //     }
    // }



    // spike_diameter = 1;
    // module spike() { cylinder(h = 4, d = spike_diameter); }

    // num_rows = 10;
    // num_columns = 10;
    // horizontal_spacing = 6 / 2;
    // vertical_spacing = 3 * sqrt(3) / 2;

    // base_height = 4;

    // // Create the honeycomb pattern
    // for (row = [0:num_rows-1]) {
    //     for (col = [0:num_columns-1]) {
    //         x_offset = col * horizontal_spacing;
    //         y_offset = row * vertical_spacing;

    //         // Alternate the horizontal position of spikes in even rows
    //         if (row % 2 == 0) {
    //             x_offset = x_offset + horizontal_spacing / 2;

    //             translate([x_offset - 2, y_offset - 12, -base_height]) {
    //                 spike();
    //             }
    //         }
    //         else {
    //             translate([x_offset - 2, y_offset - 12, -base_height]) {
    //                 spike();
    //             }
    //         }
    //     }
    // }
}
