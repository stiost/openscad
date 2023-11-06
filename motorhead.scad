$fn=100;

plate_width = 40;
plate_height = 5;

magnet_slot_width = 12.35;
magnet_slot_height = 3;
magnet_slot_edge = 2;

pin = 4.15;

difference() {
    cylinder(h=plate_height, r=plate_width/2);
    translate([plate_width/2-magnet_slot_width/2-magnet_slot_edge,0,plate_height-magnet_slot_height]) cylinder(h=magnet_slot_height+1, r=magnet_slot_width/2);
    translate([-(plate_width/2-magnet_slot_width/2-magnet_slot_edge),0,plate_height-magnet_slot_height]) cylinder(h=magnet_slot_height+1, r=magnet_slot_width/2);
    translate([0,0,-1]) cylinder(h=plate_height+2, r=pin/2);
}
