eps=1/128;
$fn=100;

use<../threads_v2p1.scad>;

module MetricBolt(diameter, length, tolerance=0.4) {
  drive_tolerance = pow(3*tolerance/HexDriveAcrossCorners(diameter),2)
    + 0.75*tolerance;

//  difference() {
//    cylinder(h=diameter, r=(HexAcrossCorners(diameter)/2-0.5*tolerance), $fn=6);
//    cylinder(h=diameter,
//      r=(HexDriveAcrossCorners(diameter)+drive_tolerance)/2, $fn=6,
//      center=true);
//  }
  cylinder(h=diameter, r=50);
  translate([0,0,diameter-0.01])
    ScrewThread(diameter, length+0.01, tolerance=tolerance,
      tip_height=ThreadPitch(diameter), tip_min_fract=0.75);
}

module Demo() {
  MetricBolt(16, 100);
}

Demo();
