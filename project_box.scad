$fn=100;
eps=1/128;

//support_pillar(20);
//usbchole();

//lid_mount_corner();
//translate([15,0,0]) support_pillar_corner(3);

screwhole();

module screwhole() {
    hd = 3.0; // m3 screw hole
    head = 5.45;
    head_h=3;
    cylinder(d=hd, h=head_h+1);
    translate([0,0,head_h+1]) cylinder(d=head, h=head_h+1);
}

module lid_mount_corner() {
    height = 3;
    hd = 3.0; // m3 screw hole
    wt = 2;
    p = 5;
    d=hd+wt+wt;
    r=(hd+wt+wt)/2;
    
    difference() {
        union() {
            cylinder(r=r+p, h=height);
            translate([-r,-r,0]) cube([d+p,r,height]);
            translate([-r,0,0]) cube([r,r+p,height]);
        }
        translate([0,0,-10]) cylinder(d=hd, h=height+20);
        translate([-r-p,-r-r-p-eps+0.1,-1]) cube([d+p*2,r+p,height+2]);
        translate([-r-r-p-eps+0.1,-p,-1]) cube([r+p,r+p+p,height+2]);
    }
}

module lid_mount() {
    height = 3;
    hd = 3.0; // m3 screw hole
    wt = 2;
    p = 5;
    d=hd+wt+wt;
    r=(hd+wt+wt)/2;
    
    difference() {
        union() {
            cylinder(r=r+p/2, h=height);
            translate([-r-p/2,-r,0]) cube([d+p,r,height]);
        }
        translate([0,0,-r]) cylinder(d=hd, h=height+20);
        translate([-r-p/2,-r-r-eps+0.1,-1]) cube([d+p,r,height+2]);
    }
}

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
