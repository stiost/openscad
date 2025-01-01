$fn=10;

holes=10;
hole_size=1.5;
allowance=5;

difference() {
    cube([150,40,2]);

    for(i=[5:5:150-1])
    translate([i,5,-1])
    cylinder(4, d=hole_size);
}
