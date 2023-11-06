$fn=100;

tol = 1;
mag_width = 5+tol;
mag_height = 2.68+tol;
wt = 1; // wall thickness
pill_radius = mag_width/2+wt;

bottom_width = 10;
height = 9;
ring_width=1.5;

difference() {
    cylinder(h=height, r1=bottom_width/2, r2=0);
    translate([0,0,-1]) cylinder(h=mag_height/2+1, r=mag_width/2);
}