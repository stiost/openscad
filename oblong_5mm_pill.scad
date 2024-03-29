$fn=100;
eps=1/128;

tol = 1;
mag_width = 5+tol;
mag_height = 15+tol;
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
    difference() {
        scale([1,1,gr]) sphere(d=mag_width+wt+4);
        cylinder(h=mag_height, d=mag_width, center=true);
    }
}
