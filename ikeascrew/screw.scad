eps=1/128;
$fn=100;

include <BOSL2/std.scad>
include <BOSL2/screws.scad>

a=9.90;
b=8;
c=25;

cylinder(h=6, r=10);
translate([-a/2,-a/2,6]) cube([a,a,3]);
up(7) screw("M8", length=c, anchor=BOTTOM, $slop=0.2);

translate([-20,0,0]) nut("M8", $slop=0.2);
