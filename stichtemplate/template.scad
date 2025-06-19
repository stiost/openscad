$fn=10;

holes=10;
hole_size=2.1;
allowance=5;

difference() {
    cube([150,20,2]);

    for(i=[5:5:150-1])
    translate([i,5,-1])
    cylinder(4, d=hole_size);
}
