$fn=100;

motor_width = 24;
motor_back_hole_width = 6.3;
motor_height = 12.36;
motor_pin_height = 20.13;

holder_height = 10;

skirt_plate_dist = 2; // distance from top skirt to magnet plate
skirt_width = 10;

plate_width = 40;

cage_width = motor_width + skirt_plate_dist + skirt_width;
cage_plate_dist = 1; // distance from top of skirt to top of plate
cage_height = motor_pin_height + cage_plate_dist;


wt = 1;

cage(); 
//skirt();
//translate([0,0,motor_pin_height+wt-5]) cylinder(h=5, r=20);

module cage() {
    difference() {
        cylinder(h=cage_height, r=motor_width+2);
        translate([0,0,wt]) cylinder(h=cage_height, r=motor_width);
        translate([0,0,-10]) cylinder(h=20, r=motor_back_hole_width/2);
        translate([motor_width,0,wt+2.5]) cube(5, center=true);
    }
    translate([0,0,wt]) difference() {
        cylinder(h=holder_height, r=motor_width/2+wt+0.4);
        translate([0,0,-5]) cylinder(h=holder_height+10, r=motor_width/2+0.4);
        translate([motor_width/2-wt,0,(holder_height+2)/2]) cube([10, 5, holder_height+2], center=true);
    }
}

module skirt() {
    difference() {
        translate([0,0,cage_height]) cylinder(h=wt, r=motor_width+2);
        translate([0,0,cage_height-1]) cylinder(h=wt+2, r=plate_width/2+skirt_plate_dist);
    }
}
