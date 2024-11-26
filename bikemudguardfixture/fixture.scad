eps=1/128;
$fn=100;

a=21.35; //width
b=13.11; // height
c=4; // hdim
d=a-5; // mount hole
e=8; // screw head diameter
f=2; // screw head thickness

//difference() {
//    %cube([b,a,b]);
//    translate([b/2,-1,b/2]) rotate([-90,0,0])cylinder(h=a+2,r=c/2);
//    translate([1+b,d,b/2]) rotate([0,-90,0]) cylinder(h=b+2,r=c/2);
//    translate([b/2-c/2,a+1,b/2]) rotate([90,0,0]) cube([c,b/2+1,a+2]);
//    #translate([b/2,0,5]) rotate([90,0,0]) cylinder(3, d=e);
//}

difference() {
    cylinder(h=a,d=b);
    translate([0,0,-1]) cylinder(h=a+2, d=c);
    translate([0,0,3]) cylinder(h=a+2, d=e);

    translate([0,(b+2)/2,a-e/2-2]) rotate([90,0,0]) 
    union() {
        cylinder(h=b+2, d=c);
        translate([0,0])cylinder(h=f+1, d=e);
        translate([0,0,b-f+1]) cylinder(h=f+1, d=e);
    }    
}


