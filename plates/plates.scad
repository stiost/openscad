eps=1/128;
$fn=100;

size = 120;
thickness = 10;
interface = 3;
interface_length = 30;
wall = 3;

difference() {
    cube([size+wall+wall, size+wall+wall, thickness+wall]);
    difference() {
        translate([wall, wall, wall]) cube([size, size, thickness+eps]);
        
        translate([wall, wall, wall]) cube([interface_length, interface, thickness]);
        translate([size-interface_length+wall, wall, wall]) cube([interface_length, interface, thickness]);
        translate([size-interface_length+wall, size, wall]) cube([interface_length, interface, thickness]);
        translate([wall, size, wall]) cube([interface_length, interface, thickness]);
        
        translate([wall, wall, wall]) cube([interface, interface_length, thickness]);
        translate([wall, size-interface_length+wall, wall]) cube([interface, interface_length, thickness]);
        translate([size, size-interface_length+wall, wall]) cube([interface, interface_length, thickness]);
        translate([size, wall, wall]) cube([interface, interface_length, thickness]);
    }
}
