$fn=100;
eps=1/128;

tol = 0.2;
mag_width = 5+0.1;
mag_height = 2+0.2;
wt = 1; // wall thickness
pill_radius = mag_width/2+wt;

bottom_width = 15;
height = 20;
ring_width=1.5;
gr = 2;

//rotate([90,0,0]) egg();

difference() {
    rotate([90,0,0]) egg();
    translate([0,0,-height]) cube([height*2, height*2, height*2], center=true);
}

module egg() {
    difference() {
        scale([1,0.5,1]) 
        sphere(d=mag_width*2+wt+2);
        hull() {
            translate([0,0,mag_width/2]) rotate([90,0,0]) cylinder(h=mag_height, d=mag_width, center=true);
            translate([0,0,-mag_width/2]) rotate([90,0,0]) cylinder(h=mag_height, d=mag_width, center=true);
        }
    }
}
