$fn=360;
eps=1/128;

d=110; // 106
h=32;
wh=25;

//translate([0,0,15]) cylinder(h=h,d=d);

//cylinder(h=h, d=d);


//%rotate_extrude() {
    shape(wh);
//}

module shape(wh) {
    square([45,15]);
    translate([45,6,0]) bend2(50,10,0);
    translate([25-10+45,30,0]) square([10,wh]);
}

module bend2(a,w,t) {
    translate([0,a/2,0]) difference() {
        circle(d=a);
        circle(d=a-w*2);
        translate([-(a+t*2)/2,0,0]) square(a);
        translate([-(a*2)/2,-a+1,0]) square(a);
    }
}
