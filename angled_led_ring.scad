$fn=100;
eps=1/128;

a = 4.99; // top diameter
b = 5.44; // led bottom diameter
c = 0.91; // led bottom lip
l = 5.44; // led height
t = 0.2; // tolerance
at = a + t;
bt = b + t;
n = 15; // number of leds
w = 3; // space from led holes to edge
h = 3; // plate height

rw = 40; // ring width
rd = 10; // ring diameter
la = 20; // light angle
x = tan(la) * 43;
rla = 90-(la*1.33); // refracted light angle
cb = cos(rla) * 200;
ac = sin(rla) * 200;
o = 360/n/2;
echo(cb, ac, rla);
echo(360/n, o);

//cylinder(h=40, d=40);
//%translate([0,0,40+3]) cylinder(h=200, d=100);

difference() {
    union() {
        rotate([0,0,90]) motor_holder();
        difference() {
            translate([0,0,1]) cylinder(h=10, r=rw);
            translate([0,0,0]) cylinder(h=10+2, r=rw-rd);
        }
    }
    for(deg = [o : 360/n : 360+o]) {
        rotate([0,0,deg]) 
        translate([0,rw,0])
        rotate([la,0,0])
        translate([0,0,-5])
        color("red") led();
    }
}

// for(deg = [0 : 360/12 : 360]) {
//    rotate([0,0,deg]) 
//    translate([0,0,0])
//    color([1,0.8,0.4,0.5]) light();
//}

module light() {
    hull() {
        translate([rw,0,0]) 
        sphere(d=5);        
        translate([rw-x,0,43]) 
        sphere(d=10);
    }
    hull() {
        translate([rw-x,0,43]) 
        sphere(d=10);
        translate([rw-x-cb,0,43+ac])
        sphere(d=50);
    }
}


module led() {
//    cylinder(h=c, d=bt);
    cylinder(h=30, d=bt);
//    translate([0,0,c]) cylinder(h=l-c+20, d=bt);
}



module motor_holder() {
    motor_width = 24;
    motor_back_hole_width = 6.3;
    motor_height = 12.36;
    motor_pin_height = 20.13;

    holder_height = 10;

    skirt_plate_dist = 2; // distance from top skirt to magnet plate
    skirt_width = 10;

    cage_width = motor_width + skirt_plate_dist + skirt_width;
    cage_plate_dist = 1; // distance from top of skirt to top of plate
    cage_height = motor_pin_height + cage_plate_dist;


    wt = 1;

    cage(); 

    module cage() {
        difference() {
            union() {
                translate([0,0,0]) cylinder(wt, r=rw);
                translate([0,0,wt]) difference() {
                    cylinder(h=holder_height, r=motor_width/2+wt+0.4+0.5);
                    translate([0,0,-5]) cylinder(h=holder_height+10, r=motor_width/2+0.4+0.5);
                    translate([motor_width/2-wt,0,(holder_height+2)/2+eps]) cube([10, 5, holder_height+2], center=true);
                }
            }
            translate([0,0,-10]) cylinder(h=20, r=motor_back_hole_width/2);
        }
    }

}