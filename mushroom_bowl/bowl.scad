$fn=100;

//square([30,10]);

//#translate([0,10,0]) square([110/2,30]);

translate([0,0,15]) cylinder(h=30,d=110);

%rotate_extrude() {
    translate([0,-5,0]) square([45,15]);
    translate([45,0,0]) bend2(50,10,0);
    translate([25-10+45,25,0]) square([10,20]);
}

module bend(a,w) {
    difference() {
        circle(d=a);
        circle(d=a-w);
        translate([-(a+2)/2,0,0]) square(a+2);
        translate([-(a*2)/2,-a+1,0]) square(a);
    }
}

module bend2(a,w,t) {
    translate([0,a/2,0]) difference() {
        circle(d=a);
        circle(d=a-w*2);
        translate([-(a+t*2)/2,0,0]) square(a);
        translate([-(a*2)/2,-a+1,0]) square(a);
    }
}
