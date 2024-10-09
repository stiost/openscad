eps=1/128;
$fn=100;

t=0.01;

difference() {
    cube([104, 74, 34], center=true);
    translate([0,0,2]) cube([100, 70, 34+eps], center=true);
    translate([0,0,-10]) cylinder(30,10,10, center=true);
    translate([110/2-(t/2),0,0]) cube([110, 80, 40], center=true);
}

module tray() {
    union() {
        difference() {
            cube([108+t*2, 78+t*2, 10], center=true);
            translate([0,0,34/2-3]) cube([104+t*2, 74+t*2, 34], center=true);
        }
        translate([0,0,-2]) cylinder(2,10-t*2,10-t*2, center=true);
    }
}
