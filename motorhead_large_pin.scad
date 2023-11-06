$fn=100;

plate_width = 40;
plate_height = 5;

magnet_slot_width = 12.3;
magnet_slot_height = 3;
magnet_slot_edge = 2;

pw = 3.9;     // pin width
pi = 0.7;    // pin indent

head();

module pin_hole() {
    difference() {
        cylinder(h=plate_height+2, r=pw/2);
        translate([-pw/2,pw/2-pi,-1]) cube([pw, pi, plate_height+4]);
    }
}


module head() {
    difference() {
        cylinder(h=plate_height, r=plate_width/2);
        translate([plate_width/2-magnet_slot_width/2-magnet_slot_edge,0,plate_height-magnet_slot_height]) cylinder(h=magnet_slot_height+1, r=magnet_slot_width/2);
        translate([-(plate_width/2-magnet_slot_width/2-magnet_slot_edge),0,plate_height-magnet_slot_height]) cylinder(h=magnet_slot_height+1, r=magnet_slot_width/2);
        #translate([0,0,-1]) pin_hole();
    }
}
