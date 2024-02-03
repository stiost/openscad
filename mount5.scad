eps=1/128;
$fn=100;

motor_width = 24;
motor_back_hole_width = 6.3;
motor_height = 12.36;
motor_pin_height = 20.13;

mh = 32.15; // height from bottom to magnet holder top
htt = 3; // spacing between magnet holder top to bottom of the top
h = mh + htt; // height of outer walls
d = 50; // diameter of outer ring of holder
owt = 2; // outer wall thickness

walls();

wt=1;

module walls() {
    difference() {
        cylinder(h, d=d);
        translate([0,0,wt]) cylinder(h=h+1, d=d-owt);
    }
}