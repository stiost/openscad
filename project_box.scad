$fn=100;

module support_pillar(height) {
    hd = 3.0; // m3 screw hole
    wt = 2;
    d=hd+wt+wt;
    r=(hd+wt+wt)/2;
    
    difference() {
        union() {
            cylinder(r=r, h=height);
            translate([-r,-r,0]) cube([d,r,height]);
        }
        translate([0,0,-10]) cylinder(d=hd, h=height+20);
    }
}

module support_pillar_corner(height) {
    hd = 3.0; // m3 screw hole
    wt = 2;
    d=hd+wt+wt;
    r=(hd+wt+wt)/2;
    
    difference() {
        union() {
            cylinder(r=r, h=height);
            translate([-r,-r,0]) cube([d,r,height]);
            translate([-r,0,0]) cube([r,r,height]);
        }
        translate([0,0,-10]) cylinder(d=hd, h=height+20);
    }
}

support_pillar(20);
