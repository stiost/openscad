eps=1/128;
$fn=100;

a=21.35; // main cylinder height
b=15; // main cylinder width
c=5; // hdim
d=a-5; // mount hole
e=9; // screw head diameter
f=3.5-1; // screw head thickness

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


