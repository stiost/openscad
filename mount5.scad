eps=1/128;
$fn=100;

use<project_box.scad>;

motor_width = 24;
motor_back_hole_width = 6.3;
motor_height = 12.36;
motor_pin_height = 20.13;

mh = 32.15; // height from bottom to magnet holder top
htt = 3; // spacing between magnet holder top to bottom of the top
h = mh + htt; // height of outer walls
d = 48; // diameter of outer ring of holder
owt = 2; // outer wall thickness

//walls(h-6, d, owt, 1);
//translate([0,0,h+3-6]) ledspacer(1+6, d, owt);
translate([0,0,h+10+3]) rotate([180,0,0]) lid(3+3, d, owt, 1);

//lid(3+3, d, owt, 1);

module walls(height, inner_diameter, wall_thickness, floor_thickness) {
    hr = motor_width/2+1+0.4+0.5;
    holder_height = 10;
    // screw hole
    pd=7; // screw pillar diameter
    ph=height;
    
    difference() {
        union() {
            // walls
            difference() {
                floor(height, inner_diameter, wall_thickness);
                translate([0,0,floor_thickness]) cylinder(height+1, d=inner_diameter);
            }
            
            // holder
            translate([0,0,floor_thickness+eps]) difference() {
                cylinder(h=holder_height, r=hr);
                translate([0,0,-eps]) cylinder(h=holder_height+10, r=motor_width/2+0.4+0.5);
            }

        }
        translate([20,0,(holder_height+0.1)/2+floor_thickness-eps]) cube([20, 5, holder_height+0.1], center=true);
        translate([0,0,-10]) cylinder(h=20, r=motor_back_hole_width/2);
    }
    translate([0,0,(holder_height+0.1)/2+floor_thickness-1]) difference() {
        cylinder(2, d=inner_diameter+wall_thickness*2);
        translate([0,0,-1])cylinder(2+2, d=inner_diameter);
    }

}

module base(height, inner_diameter, wall_thickness, floor_thickness) {
    pd=7; // screw pillar diameter
    ph=3;
    
    difference() {
        cylinder(height, d=inner_diameter+wall_thickness*2);
        translate([0,0,floor_thickness]) cylinder(h=height+1, d=inner_diameter);
    }
    
    translate([0,inner_diameter/2+pd/2+1.5,height-ph]) support_pillar(ph);
    translate([0,-(inner_diameter/2+pd/2+1.5),height-ph]) rotate([0,0,180]) support_pillar(ph);
}

module floor(height, inner_diameter, wall_thickness) {
     pd=7; // screw pillar diameter
     ph=height;
    
     cylinder(height, d=inner_diameter+wall_thickness*2);
     translate([0,inner_diameter/2+pd/2+1.5,height-ph]) support_pillar(ph);
     translate([0,-(inner_diameter/2+pd/2+1.5),height-ph]) rotate([0,0,180]) support_pillar(ph);
}

module ledspacer(height, inner_diameter, wall_thickness) {
    pd=7; // screw pillar diameter
    lhd = 7; // hole instead of heatsink
    sp = 3; // screw space
    co=inner_diameter+wall_thickness*2;
    cow=inner_diameter-10;
    
    difference() {
        union() {
            floor(height, inner_diameter, wall_thickness);
        }
        translate([0,0,-1]) cylinder(h=height+2, d=lhd);
        translate([0,0,-1]) cylinder(h=height, d=inner_diameter);
        difference() {
            translate([0,0,height-sp+eps]) cylinder(h=sp,d=inner_diameter+wall_thickness*2+pd*2);
            translate([0,0,height-sp+eps]) cylinder(h=sp,d=inner_diameter+wall_thickness*2);
        }
        translate([-co/2,-cow/2+cow,height-3-0.1]) cube([inner_diameter+wall_thickness*2,cow,3+2]);
        rotate([0,0,180]) translate([-co/2,-cow/2+cow,height-3-0.1]) cube([inner_diameter+wall_thickness*2,cow,3+2]);
    }
}

module lid(height, inner_diameter, wall_thickness, floor_thickness) {
    lhd = 7; // led hole diameter
    co=inner_diameter+wall_thickness*2;
    cow=inner_diameter-10-0.1;
    difference() {
        base(height, inner_diameter, wall_thickness, floor_thickness);
        translate([0,0,-1]) cylinder(h=wall_thickness+2, d=lhd);
        translate([inner_diameter/2,0,(height/2)+floor_thickness+eps]) cube([20, 5, height], center=true);
        translate([-co/2,-cow/2,3]) cube([co,cow,3+2]);
    }
    
}