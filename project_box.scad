$fn=100;

*support_pillar(20);
usbchole();

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

module usbchole() {
    t=0.8;
    usbc=10; // usb c board depth
    usbc_w=9+t; // usb c plug width
    usbc_h=3.3+t; // usb c plug height
    union() {
        cube([usbc_w-usbc_h,usbc,usbc_h], center=true);
        translate([-(usbc_w-usbc_h)/2,0,0]) rotate([90,0,0]) cylinder(h=usbc, d=usbc_h, center=true);
        translate([(usbc_w-usbc_h)/2,0,0]) rotate([90,0,0]) cylinder(h=usbc, d=usbc_h, center=true);
    }
}
