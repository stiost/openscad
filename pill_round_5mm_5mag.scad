$fn=300;
eps=1/128;

tol = 0.5;
mag_width = 5+tol;
mag_height = 9.38+tol;
wt = 1; // wall thickness
pill_radius = mag_width/2+wt;

bottom_width = 15;
height = 20;
ring_width=1.5;
gr = 2;

difference() {
    egg();
    translate([0,0,-height]) cube([height*2, height*2, height*2], center=true);
}

module egg() {
    d = max(mag_width, mag_height)+wt*2+3;
    echo(d);
    difference() {
        scale([0.6,1,1]) sphere(d=d);
        cylinder(h=mag_height, d=mag_width, center=true);
    }
}
