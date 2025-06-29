include <BOSL2/std.scad>;

// Three parts
// 1. tube(r)
// 2. drain base
// 3. pattern
// Optional lip design

// Variables
height = 75;
radius = 50.8;
thickness = 2;
segments = 90;
lip_height = 2;
inner_radius = radius - thickness;
tex = texture("checkers", border=0.25);
texture_height = 1;

module tuber(anchor) {
    
    tube_height = height * 2/3;

    difference() {
        cyl(h=tube_height, r=radius, anchor=anchor, $fn=segments, texture=tex);
        cyl(h=tube_height, r=inner_radius, anchor=anchor, $fn=segments);
    }
}

// tuber();

module drain_base(anchor) {
    base_height = height * 1/3;
    

    difference() {
        cyl(h=base_height, r=radius, rounding1=2, anchor=anchor, $fn=segments, texture=tex);
        cyl(h=base_height - thickness, r=inner_radius, rounding1=2, anchor=anchor, $fn=segments);
    }
}

// drain_base();

module top_lip() {
    tube(h=lip_height, or=radius+texture_height, ir=inner_radius, rounding2=1, anchor=BOT, $fn=segments);
}

tuber(TOP) {
    position(TOP) top_lip();
}

drain_base(TOP) {
    position(TOP) tuber(BOT);
}

top_lip();