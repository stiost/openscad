$fn=100;

magnet_diameter = 18.00;
magnet_height = 2.91;

walls = 1.5;

magnet_slot_tol = 0.35;
manget_slot_height_tol = 0.4;

magnet_slot_width = magnet_diameter + magnet_slot_tol;
magnet_slot_height = magnet_height + manget_slot_height_tol;

cross_length = 7;
cross_tol = 0.3;

pin = 2.15;
pin_height = 4;
pin_diameter = 6;
pin_diameter_tol = 0.15;

adapter_height = 10;

magnet_slot_edge = 2;

plate_width = magnet_slot_width*2+walls*2;
plate_height = magnet_slot_height+walls*2;

echo(plate_width);
echo(plate_height);

//difference() {
//    holder();
//    cross();
//}

pin_header();



module holder() {
    difference() {
        hull() {
          translate([magnet_slot_width/2,0,0]) cylinder(h=plate_height, r=magnet_slot_width/2+walls);
          translate([-magnet_slot_width/2,0,0]) cylinder(h=plate_height, r=magnet_slot_width/2+walls);
        }
        translate([magnet_slot_width/2,0,plate_height-magnet_slot_height]) cylinder(h=magnet_slot_height+1, r=magnet_slot_width/2);
        translate([-magnet_slot_width/2,0,plate_height-magnet_slot_height]) cylinder(h=magnet_slot_height+1, r=magnet_slot_width/2);
        translate([0,0,10+walls*2]) cube([7,7,20], center=true);
    }
}

module cross() {
    w = walls + cross_tol;
    l = cross_length + cross_tol;
    h = walls/2+cross_tol;
    p = pin_diameter + pin_diameter_tol;
    translate([0,0,(h+1)/2-1]) cylinder(h=h+100,r=p/2, center=true);
}

module pin_header() {
    difference() {
        cylinder(h=adapter_height,r=pin_diameter/2);
        translate([0,0,adapter_height-pin_height]) cylinder(h=adapter_height+10,r=pin/2);
    }
}
