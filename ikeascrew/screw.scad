eps=1/128;
$fn=100;

a=9.90;
b=8;
c=25;


use<../threads_v2p1.scad>;

module MetricBolt(diameter, length, tolerance=0.4) {
  drive_tolerance = pow(3*tolerance/HexDriveAcrossCorners(diameter),2)
    + 0.75*tolerance;
    
  cylinder(h=6, r=10);
  translate([-a/2,-a/2,6]) cube([a,a,3]);
  translate([0,0,9])
    ScrewThread(diameter, length+0.01, tolerance=tolerance,
      tip_height=ThreadPitch(diameter), tip_min_fract=0.75);
}

module MetricNut(diameter, thickness=0, tolerance=0.6) {
  thickness = (thickness==0) ? NutThickness(diameter) : thickness;
  ScrewHole(diameter, thickness, tolerance=tolerance)
    cylinder(h=6, r=9);
}

module Demo() {
  MetricBolt(b, c);
//  translate([25, 25, 0]) MetricNut(b, tolerance=1);
//  translate([25, 0, 0]) MetricNut(b, tolerance=0.8);
//  translate([0, 0, 0]) MetricNut(b, tolerance=0.6);
}

Demo();
