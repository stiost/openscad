eps=1/128;
$fn=100;

a=15; //width
b=10; // height
c=4; // hdim
d=10; // mount hole

difference() {
    cube([b,a,b]);
    translate([b/2,-1,b/2]) rotate([-90,0,0])cylinder(h=a+2,r=c/2);
    translate([1+b,d,b/2]) rotate([0,-90,0]) cylinder(h=b+2,r=c/2);
    translate([b/2-c/2,a+1,b/2]) rotate([90,0,0]) cube([c,b/2+1,a+2]);
}
