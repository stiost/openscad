$fn=100;

tol = 0.5;
rod_width = 5+tol;
rod_height = 2.68+tol;
wt = 0.7; // wall thickness
pill_radius = rod_width/2+wt;
pill_height = rod_height+pill_radius*2;
ring_width=1.5;

echo(pill_height);
echo((pill_radius+ring_width)*2);

pill_split();
//pill();

module pill_split() {
    difference() {
        rotate([0,90,0]) translate([0,pill_radius*2,-pill_height/2]) pill();
        bed_cube();
    }

    difference() {
        rotate([0,90,0]) translate([0,-pill_radius*2,-pill_height/2]) pill();
        bed_cube();
    }
}

module bed_cube() {
    bed_width=20;
    bed_depth=30;
    bed_height=20;
    translate([-bed_width/2,-bed_depth/2,-bed_height]) cube([bed_width,bed_depth,bed_height]);
}

module pill() {
    difference() {
        union() {
            rounded_cylinder(pill_height, pill_radius);
            translate([0,0,pill_height/2-ring_width/2]) cylinder(h=ring_width, r=pill_radius+ring_width);
        }
        translate([0,0,pill_radius]) cylinder(h=rod_height, r=rod_width/2);    
    }
}

module rounded_cylinder(h, r) {
    union() {
        translate([0,0,r]) cylinder(h=h-r*2, r=r);
        translate([0,0,h-r]) sphere(r=r);
        translate([0,0,r]) sphere(r=r);
    }
}
