$fn=100;
eps=1/128;

t = 0.1; // tolerance
a = 5; // led diameter
b = 4.12; // led height
at = a + t;
n = 10; // number of leds
w = 1; // space from led holes to edge
bw = 1; // bottom wall
h = b*(3/4)+bw; // plate height
d = 25; // outer diameter of ring
md = 5; // magnet diameter
mh = 8.2; // magnet height (two)
mdt = md+t;
mht = mh+t;
gw = 2; // glue wall
gww = 1; // glue wall width

echo("d", d)

difference() {
    cylinder(h=h, d=d);
    //translate([0,0,h+eps]) cylinder(h=gw, d=d-gww);
    for(deg = [0 : 360/n : 360]) {
        rotate([0,0,deg]) translate([d/2-at/2-w,0,bw]) cylinder(h=h+2, d=at);
    }    
    hull() {
        translate([0,0,mdt/2+bw]) rotate([90,0,0]) cylinder(h=mht, d=mdt, center=true);
        translate([0,0,mdt/2+mdt]) cube([mdt, mht, 1], center=true);
    }
}
//translate([0,0,-1]) cylinder(h=1, d1=0, d2=1);
