eps=1/128;
$fn=100;

motor_width = 24;
motor_back_hole_width = 6.3;
motor_height = 12.36;
motor_pin_height = 20.13;

holder_height = 10;

skirt_plate_dist = 2; // distance from top skirt to magnet plate
skirt_width = 10;

plate_width = 40;

cage_width = motor_width + skirt_plate_dist + skirt_width;
cage_plate_dist = 1; // distance from top of skirt to top of plate
cage_height = motor_pin_height + cage_plate_dist;

wt = 1;

lh = 5.25; // total led height
lbh = 2.41; // led bracket height
ld = 5.79; // led bulb diameter

mh = 32.15; // height from bottom to magnet holder top
htt = 3; // spacing between magnet holder top to bottom of the top
h = mh + htt; // height of outer walls
d = 50; // diameter of outer ring of holder
owt = 2; // outer wall thickness

th = 5; // top height

bw1 = 92-19; // across by panel
bw2 = 85-19; // across after panel 
bw3 = 138+5; // left to right (to magnet holder)
bw4 = 74; // across panel
bwh = 40; // box wall height

sd=6+1; // switch hole diameter
pd=6.8+1; // potentionmeter hole diameter


//walls();
//

//cylinder(d=40, h=mh);

//echo(h);
boxb();
//boxbfloor();
//top();
//cage();
//translate([0,0,45]) top();
//potmodule();
//shelf();

module cage() {
    difference() {
        union() {
            walls();
            translate([0,0,wt+eps]) difference() {
                cylinder(h=holder_height, r=motor_width/2+wt+0.4+0.5);
                translate([0,0,-eps]) cylinder(h=holder_height+10, r=motor_width/2+0.4+0.5);
            }
        }
        translate([20,0,(holder_height+2)/2+wt-eps]) cube([20, 5, holder_height+2], center=true);
        translate([0,0,-10]) cylinder(h=20, r=motor_back_hole_width/2);
    }
}

module walls() {
    difference() {
        cylinder(h, d=d);
        translate([0,0,wt]) cylinder(h=h+1, d=d-owt);
    }
}

module top() {
    difference() {
        union() {
            cylinder(wt, d=d);
            translate([0,0,wt]) cylinder(4, d=d-wt-wt-0.2);
        }
        translate([0,0,wt-eps]) cylinder(7, d=d-wt-wt-wt-wt);
        translate([0,0,-1])cylinder(h=5, d=7);
    }
}

module boxbfloor() {
    bt = 2;
    cube([bw4, bw1, bt]);
    translate([bw4,0,0]) cube([bw3-bw4,bw2,bt]);
}

module shelf() {
    wt = 2+0.45;
    shelfw=20+0.45;
    shelfl=30;
    cube([shelfl,shelfw,wt]);
    hull() {
        translate([wt,0,-15]) cube([1,wt,15]);
        translate([wt+10,0,-5]) cube([1,wt,5]);
    }
    hull() {
        translate([wt,shelfw-wt,-15]) cube([1,wt,15]);
        translate([wt+10,shelfw-wt,-5]) cube([1,wt,5]);
    }
}

module boxb() {
    wt = 2;
    shelfw=20;
    shelfl=30;
    difference() {
        union() {
            boxbfloor();
//            cube([bw3,wt,bwh]); // back wall
            cube([wt,bw1,bwh]); // left wall 
//            translate([bw3-wt,0,0]) cube([wt,bw2,bwh]); // right wall 
            translate([0,bw1-wt,0]) cube([bw4,wt,bwh]); // panel
//            translate([bw4,bw2-wt,0]) cube([bw3-bw4,wt,bwh]); // top wall
            translate([bw4-wt,bw2-wt,0]) cube([wt,bw1-bw2,bwh]); // gap panel
//            translate([wt,10,30]) cube([shelfl,shelfw,wt]);
        }
        translate([-wt,10,30]) cube([shelfl,shelfw+0.5,wt+0.5]);
        panel_cutouts();
    }
    translate([10,35-19,0]) potmodule();
    translate([45,35-19,0]) potmodule();
}

module panel_cutouts() {
    translate([40+10,bw1,bwh/2+10]) rotate([90,0,0]) cylinder(wt*5, d=pd, center=true);
    translate([40+10,bw1,bwh/2-10]) rotate([90,0,0]) cylinder(wt*5, d=pd, center=true);
    translate([20+10,bw1,bwh/2]) rotate([90,0,0]) cylinder(wt*5, d=sd, center=true);
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


