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

bw1 = 94; // across by panel
bw2 = 87; // across after panel 
bw3 = 138; // left to right (to magnet holder)
bw4 = 76; // across panel
bwh = 40; // box wall height

sd=6+1; // switch hole diameter
pd=6.8+1; // potentionmeter hole diameter


//walls();
//

//cylinder(d=40, h=mh);

echo(h);
//boxb();
//top();
cage();
//translate([0,0,45]) top();

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
            translate([0,0,wt]) cylinder(wt, d=d-wt);
        }
        translate([0,0,wt-eps]) cylinder(wt+wt, d=d-wt-wt);
        translate([0,0,-1])cylinder(h=5, d=7);
    }
}

module boxb() {
    difference() {
        union() {
            cube([bw4, bw1, wt]);
            translate([bw4,0,0]) cube([bw3-bw4,bw2,wt]);
            cube([bw3,wt,bwh]); // bottom wall
            cube([wt,bw1,bwh]); // left wall 
            translate([bw3-wt,0,0]) cube([wt,bw2,bwh]); // left wall 
            translate([0,bw1-wt,0]) cube([bw4,wt,bwh]); // panel
            translate([bw4,bw2-wt,0]) cube([bw3-bw4,wt,bwh]); // top wall
            translate([bw4-wt,bw2-wt,0]) cube([wt,bw1-bw2,bwh]);
        }
        panel_cutouts();
    }
}

module panel_cutouts() {
    translate([40,bw1,bwh/2+10]) rotate([90,0,0]) cylinder(wt+2, d=pd+1, center=true);
    translate([40,bw1,bwh/2-10]) rotate([90,0,0]) cylinder(wt+2, d=pd+1, center=true);
    translate([20,bw1,bwh/2]) rotate([90,0,0]) cylinder(wt+2, d=sd+1, center=true);
}
