eps=1/128;
$fn=100;

use<project_box.scad>;

wt = 2;

bw1 = 73+20; // across by panel
bw2 = 73+20; // across after panel 
bw3 = 142+8+5; // left to right (to magnet holder)
bw4 = 74; // across panel
bwh = 40-3; // box wall height

sd=6+1; // switch hole diameter
pd=6.8+1; // potentionmeter hole diameter

shi=3.5+wt; // screw hole inline

//cylinder(d=40, h=mh);

boxb();
//translate([0,0,bwh+20]) lid();
//translate([-10,0,6]) rotate([0,180,0]) lid();

//color("red") translate([wt+10,wt+2,wt]) cube([76,20,20]); // battery

module boxbfloor(height=2) {
    bt = height;
    cube([bw4, bw1, bt]);
    translate([bw4,0,0]) cube([bw3-bw4,bw2,bt]);
}

module boxb() {
    wt = 2;
    shelfw=20;
    shelfl=30;
    difference() {
        union() {
            boxbfloor();
            cube([bw3,wt,bwh]); // back wall
            cube([wt,bw1,bwh]); // left wall 
            translate([bw3-wt,0,0]) cube([wt,bw2,bwh]); // right wall 
            translate([0,bw1-wt,0]) cube([bw4,wt,bwh]); // panel
            translate([bw4,bw2-wt,0]) cube([bw3-bw4,wt,bwh]); // top wall
            translate([bw4-wt,bw2-wt,0]) cube([wt,bw1-bw2,bwh]); // gap panel
            
            support_pillar_height = bwh-wt-3;
            translate([0,0,wt]) {
                translate([shi,shi,0]) support_pillar_corner(support_pillar_height);
                translate([shi,bw1-shi,0]) rotate([0,0,270]) support_pillar_corner(support_pillar_height);
                translate([bw3-shi,bw2-shi,0]) rotate([0,0,180]) support_pillar_corner(support_pillar_height);
                translate([bw3-shi,shi,0]) rotate([0,0,90]) support_pillar_corner(support_pillar_height);
                translate([bw4+20,shi,0]) support_pillar(support_pillar_height);
                translate([bw4+10,bw1-shi,0]) rotate([0,0,180]) support_pillar(support_pillar_height);
            }
        }
        panel_cutouts();
        translate([138,0,6]) usbchole();
    }
    translate([10,35,0]) potmodule();
    translate([45,35,0]) potmodule();
    translate([138-10/2,26.5+wt,wt]) cube([10,1,4]); // usb holder durt
}

module lid() {
    difference() {
        union() {
            translate([shi,shi,0]) lid_mount_corner();
            translate([shi,bw1-shi,0]) rotate([0,0,270]) lid_mount_corner();
            translate([bw3-shi,bw2-shi,0]) rotate([0,0,180]) lid_mount_corner();
            translate([bw3-shi,shi,0]) rotate([0,0,90]) lid_mount_corner();
            translate([bw4+20,shi,0]) lid_mount();
            translate([bw4+10,bw1-shi,0]) rotate([0,0,180]) lid_mount();
            translate([0,0,3]) boxbfloor(3);
        }
        translate([shi,shi,-1]) screwhole();
        translate([shi,bw1-shi,0]) rotate([0,0,270]) screwhole();
        translate([bw3-shi,bw2-shi,0]) rotate([0,0,180]) screwhole();
        translate([bw3-shi,shi,0]) rotate([0,0,90]) screwhole();
        translate([bw4+20,shi,0]) screwhole();
        translate([bw4+10,bw1-shi,0]) rotate([0,0,180]) screwhole();
        i=12;
        translate([bw4,i,3-1]) cube([bw3-bw4-i*2,bw2-i*2,3+2]);
    }
}

module panel_cutouts() {
    translate([40+5,bw1,bwh/2+10]) rotate([90,0,0]) cylinder(wt*5, d=pd, center=true);
    translate([40+5,bw1,bwh/2-10+2]) rotate([90,0,0]) cylinder(wt*5, d=pd, center=true);
    translate([20+5,bw1,bwh/2+1]) rotate([90,0,0]) cylinder(wt*5, d=sd, center=true);
}

module potmodule() {
    hd=3;
    hdt=hd-0.3;
    a=28.8-hd;
    b=29-hd;
    h=5;
    cylinder(h, d=hd);
    translate([a,0,0]) cylinder(h, d=hdt);
    translate([a,b,0]) cylinder(h, d=hdt);
    translate([0,b,0]) cylinder(h, d=hdt);
}
