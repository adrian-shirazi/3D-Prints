module cup() {
    height = 125;
    radius = 25;
    
    module rounded_cube() {
        points = [ [0,0,0], [50,0,0], [0,50,0], [50,50,0] ];
        
        hull() {
            for (p = points){
                translate(p) cylinder(r=radius, h=height);
            }
        }
    }
    module base() {
        scale([1, 1, .06])rounded_cube();
    }
    module rounded_base() {
        points = [ [0,0,0], [50,0,0], [0,50,0], [50,50,0] ];

        hull() {
            for (p = points){
                translate(p) sphere(r=25);
            }
        }
    }
   

    difference() {
        rounded_cube();
        translate([2, 2, 0])scale([.92, .92, 1.1]) rounded_cube();
    }
    difference() {
        scale([1, 1,.8])rounded_base();
        translate([2, 2, 0])scale([1, 1, 1.1]) rounded_cube();
        translate([2, 2, 0])scale([.92, .92,.6])rounded_base();
    }
     
}

translate([0, 0, 10])scale([.45, .45, .55]) cup();
