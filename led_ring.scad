$fn=100;
eps=1/128;

a = 4.99; // top diameter
b = 5.44; // led bottom diameter
c = 0.91; // led bottom lip
l = 5.44; // led height
t = 0.1; // tolerance
at = a + t;
bt = b + t;
n = 12; // number of leds
w = 3; // space from led holes to edge
h = 3; // plate height
i = 50; // inner diameter of ring
r = w+w+bt; // ring width
d = i+r+r; // outer diameter of ring
p = 3.50;
pt = p + t;

echo("d", d)
echo("r", r);

difference() {
    cylinder(h=h, d=d);
    translate([0,0,-1]) cylinder(h=h+2, d=d-r*2);
    for(deg = [0 : 360/12 : 360]) {
        rotate([0,0,deg]) translate([d/2-bt/2-w,0,-1]) cylinder(h=c+1, d=bt);
    }
    for(deg = [0 : 360/12 : 360]) {
        rotate([0,0,deg]) translate([d/2-bt/2-w,0,c-eps]) cylinder(h=h+1, d=at);
    }
    for(deg = [0 : 360/4 : 360]) {
        rotate([0,0,deg+45]) translate([d/2-w,0,-1]) cylinder(h=h+2, d=pt);
    }
}
