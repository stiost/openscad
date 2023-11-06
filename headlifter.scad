$fn=100;

adapter_height = 8;
adapter_width = 4.15;
pin = 2.15;

difference() {
    cylinder(h=adapter_height, r=adapter_width/2);
    translate([0,0,-1]) cylinder(h=adapter_height+2, r=pin/2);
}
