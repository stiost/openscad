$fn=32;

include <BOSL2/std.scad>
include <BOSL2/screws.scad>

t=2;

difference() {
    cuboid([100, 50, t], anchor=BOTTOM, rounding=1, 
    edges=[
        BOTTOM+LEFT, 
        FRONT+BOTTOM, 
        BACK+BOTTOM, 
        FRONT+LEFT, 
        BACK+LEFT,
        BOTTOM+RIGHT,
        FRONT+RIGHT,
        BACK+RIGHT
    ]);
    translate([32,0,0]) cyl(d=5.5, h=t, anchor=BOTTOM);
    translate([-32,0,0]) cyl(d=5.5, h=t, anchor=BOTTOM);
}
