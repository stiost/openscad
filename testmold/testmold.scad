eps=1/128;
$fn=100;

w=2;
h=5;
i=30;

difference() {
    cube([i+w*2, i+w*2, h]);
    translate([w,w,w]) cube([i, i, h-w+1]);
}