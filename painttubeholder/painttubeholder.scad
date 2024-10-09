eps=1/128;
$fn=100;

tw=30; // tiny bit smaller next time
twr=tw/2;
th=50;
w=3;

difference() {
    box();
    translate([w,w,w]) holes();
}

module box() {
    twr=twr+w;
    translate([twr,twr,0]) {
        hull() {
            cylinder(th, twr, twr);
            translate([(tw+w)*4,0,0]) cylinder(th, twr, twr);
            translate([(tw+w)*0.5,(tw+w),0]) cylinder(th, twr, twr);
            translate([(tw+w)*3.5,(tw+w),0]) cylinder(th, twr, twr);
        }
    }
}

module holes() {
    translate([twr,twr,0]) {
        cylinder(th, twr, twr);
        translate([tw+w,0,0]) cylinder(th, twr, twr);
        translate([(tw+w)*2,0,0]) cylinder(th, twr, twr);
        translate([(tw+w)*3,0,0]) cylinder(th, twr, twr);
        translate([(tw+w)*4,0,0]) cylinder(th, twr, twr);

        translate([(tw+w)*0.5,(tw+w),0]) cylinder(th, twr, twr);
        translate([(tw+w)*1.5,(tw+w),0]) cylinder(th, twr, twr);
        translate([(tw+w)*2.5,(tw+w),0]) cylinder(th, twr, twr);
        translate([(tw+w)*3.5,(tw+w),0]) cylinder(th, twr, twr);
    }
}
