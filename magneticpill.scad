$fn=100;

rod_width = 8.2;
rod_height = 20;
magnet_height = 6.1;
wt = 1; // wall thickness
pill_radius = rod_width/2+wt;
pill_height = rod_height+wt+pill_radius*2;


pill_split();

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
    bed_width=250;
    bed_depth=210;
    bed_height=210;
    translate([-bed_width/2,-bed_depth/2,-bed_height]) cube([bed_width,bed_depth,bed_height]);
}

module pill() {
    difference() {
        rounded_cylinder(pill_height, pill_radius);
        translate([0,0,pill_height/2-magnet_height/2]) cylinder(h=magnet_height, r=rod_width/2);    
    }
}

module rounded_cylinder(h, r) {
    union() {
        translate([0,0,r]) cylinder(h=h-r*2, r=r);
        translate([0,0,h-r]) sphere(r=r);
        translate([0,0,r]) sphere(r=r);
    }
}
