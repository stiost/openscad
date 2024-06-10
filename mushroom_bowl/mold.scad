$fn=360;
eps=1/128;

d=110; // 106
h=32;
wh=25;

//translate([0,0,0]) part_a();

part_b();

module part_b() {    
    rotate_extrude(angle=180) {
        part_b_shape();
    }
}

//shape2();

//translate([0,70,0]) rotate([180,0,0])shape(wh);

module part_a() {
    rotate_extrude() {
        shape2();
    }
}

module part_b_shape() {
    t=0.05;
    d=60+t;
    w=10;
    h=35;
    a=d+w;
    b=a+w;
    r=15+w+w;
    difference() {
        union() {
            polygon(points=[
                [a,0],[b,0],[b,h],[a,h],[a,w],[a+5,w-5]
            ]);
            translate([b-r,h]) arc(r-w,[0,90],w);
            polygon(points=[
                [b,h],[b,h+r],[a-r+w,h+r],[a-5,h+cos(45)*r-5]
            ]);
        }
        translate([a-r+w-1,h+r-w/2]) square([r+2,r]);
    }
//    #polygon(points=[
//        [a-r+w,h+r-w],[a-r+w,h+r+w],[a-r+w+w,h+r+w],[b-r+sin(45)*r,h+cos(45)*r]
//    ]);
//    translate([a-r+w,h+r-w]) square([w,w*2]);

//    difference() {
//        translate([b-r,h]) circle(r=r);
//        translate([b-r,h]) circle(r=r-w);
//    }
}

module shape2() {
    d=60;
    h=10;
    a=30+5;
    r=25-h;
    polygon(points=[
        [0,0],[d+h,0],[d+5+h,5],[d+h,10],[d,10],
        [d,a],[d-r,a+r],[0,a+r]
    ]);
    translate([d-r,a]) circle(r=r);
}

module shape(wh) {
    square([45,15]);
    translate([45,6,0]) bend2(50,10,0);
    translate([25-10+45,30,0]) square([10,wh]);
}

module bend2(a,w,t) {
    translate([0,a/2,0]) difference() {
        circle(d=a);
        circle(d=a-w*2);
        translate([-(a+t*2)/2,0,0]) square(a);
        translate([-(a*2)/2,-a+1,0]) square(a);
    }
}

module sector(radius, angles, fn = $fn) {
    r = radius / cos(180 / fn);
    step = -360 / fn;

    points = concat([[0, 0]],
        [for(a = [angles[0] : step : angles[1] - 360]) 
            [r * cos(a), r * sin(a)]
        ],
        [[r * cos(angles[1]), r * sin(angles[1])]]
    );

    difference() {
        circle(radius, $fn = fn);
        polygon(points);
    }
}

module arc(radius, angles, width = 1, fn = $fn) {
    difference() {
        sector(radius + width, angles, fn);
        sector(radius, angles, fn);
    }
} 

