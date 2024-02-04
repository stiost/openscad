eps=1/128;
$fn=100;

use<project_box.scad>;

wt = 2;

bw1 = 92; // across by panel
bw2 = 85; // across after panel 
bw3 = 138+20; // left to right (to magnet holder)
bw4 = 74; // across panel
bwh = 40-3; // box wall height

sd=6+1; // switch hole diameter
pd=6.8+1; // potentionmeter hole diameter

//cylinder(d=40, h=mh);

boxb();
//color("red") translate([wt+10,wt+2,wt]) cube([76,20,20]); // battery

module boxbfloor() {
    bt = 2;
    cube([bw4, bw1, bt]);
    translate([bw4,0,0]) cube([bw3-bw4,bw2,bt]);
}

module boxb() {
    wt = 2;
    shelfw=20;
    shelfl=30;
    shi=5; // screw hole inline
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
                translate([bw4-shi,bw1-shi,0]) rotate([0,0,180]) support_pillar_corner(support_pillar_height);
            }
//            difference() {
//                hull() {
//                    translate([wt/2,wt/2,0]) cylinder(h=bwh,d=wt);
//                    translate([wt/2,bw1-wt/2,0]) cylinder(h=bwh,d=wt);
//                    translate([bw3-wt/2,wt/2,0]) cylinder(h=bwh,d=wt);
//                    translate([bw4-wt/2,bw1-wt/2,0]) cylinder(h=bwh,d=wt);
//                    translate([bw4-wt/2,bw1-wt/2,0]) cylinder(h=bwh,d=wt);
//                    translate([bw4-wt/2,bw2-wt/2,0]) cylinder(h=bwh,d=wt);
//                    translate([bw3-wt/2,bw2-wt/2,0]) cylinder(h=bwh,d=wt);
//                }
//                hull() {
//                    translate([wt/2+wt,wt/2+wt,0]) cylinder(h=bwh+2,d=wt);
//                    translate([wt/2+wt,bw1-wt/2-wt,0]) cylinder(h=bwh+2,d=wt);
//                    translate([bw3-wt/2-wt,wt/2+wt,0]) cylinder(h=bwh+2,d=wt);
//                }
//            }

        }
        panel_cutouts();
        translate([138,0,5]) usbchole();
    }
    translate([10,35,0]) potmodule();
    translate([45,35,0]) potmodule();
    translate([138-10/2,26+wt,wt]) cube([10,1,3]); // usb holder durt
}

module panel_cutouts() {
    translate([40,bw1,bwh/2+10]) rotate([90,0,0]) cylinder(wt*5, d=pd, center=true);
    translate([40,bw1,bwh/2-10]) rotate([90,0,0]) cylinder(wt*5, d=pd, center=true);
    translate([20,bw1,bwh/2]) rotate([90,0,0]) cylinder(wt*5, d=sd, center=true);
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
//    translate([-2,-2,0])cube([30,30,1]);
}
