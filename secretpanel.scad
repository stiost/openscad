$fn=100;
eps=1/128;

h=40;
w=60;
wt=1.5;
usbc=28; // usb c board depth
usbc_w=9+1; // usb c plug width
usbc_h=3.3+1; // usb c plug height
sd=6; // switch hole diameter
pd=6.8; // potentionmeter hole diameter



difference() {
    cube([w,wt,h], center=true);
    translate([-12,0,-10]) rotate([90,0,0]) cylinder(wt+2, d=pd+1, center=true);
    translate([-12,0,10]) rotate([90,0,0]) cylinder(wt+2, d=pd+1, center=true);
    translate([12,0,10]) rotate([90,0,0]) cylinder(wt+2, d=sd+1, center=true);
    translate([12,0,-10]) usbchole();
}

module usbchole() {
    union() {
        cube([usbc_w-usbc_h,wt+2,usbc_h], center=true);
        translate([-(usbc_w-usbc_h)/2,0,0]) rotate([90,0,0]) cylinder(h=wt+2, d=usbc_h, center=true);
        translate([(usbc_w-usbc_h)/2,0,0]) rotate([90,0,0]) cylinder(h=wt+2, d=usbc_h, center=true);
    }
}
