eps=1/128;
$fn=100;

height=10;
depth=7;
s=10+5+5;
bh=35;
bw=50;
fh=105;
fw=30;
ch=62;
cw=95;
sh=bh+s+fh;
sw=50;
sc=5;

echo("fh", fh);
echo("sh", sh);

//translate([fw+s,0,0]) cube([sw,sh,depth]);
//cube([fw,fh,depth]);
//translate([fw-bw,fh+s,0]) cube([bw,bh,depth]);
//translate([-cw-s,0,0]) cube([cw,fh,depth]);
//translate([-cw-s,fh,0]) cube([(fw-bw+cw),bh+s,depth]);

difference() {
    cube([cw+s+fw+s+sw+10+10,sh+10+10,height]);

    translate([10,10,height-depth]) {
        ofw=(cw+s+fw+s+sw)-(sw+s+bw+s);

        hull() {
            translate([0,0,5]) corner();
            translate([cw,0,5]) corner();
            translate([0,fh,5]) corner();
            translate([cw,fh,5]) corner();
        }
        
        hull() {
            translate([0,fh+s+bh,5]) corner();
            translate([ofw,fh+s+bh,5]) corner();
            translate([0,fh,5]) corner();
            translate([ofw,fh,5]) corner();
        }
            
        
        // buds
        hull() {
            translate([ofw+s,fh+s+bh,5]) corner();
            translate([ofw+s,fh+s,5]) corner();
            translate([ofw+s+bw,fh+s,5]) corner();
            translate([ofw+s+bw,fh+s+bh,5]) corner();
        }
        
        // shades
        hull() {
            translate([ofw+s+bw+s,sh,5]) corner();
            translate([ofw+s+bw+s+sw,sh,5]) corner();
            translate([ofw+s+bw+s+sw,0,5]) corner();
            translate([ofw+s+bw+s,0,5]) corner();
        }
        
        // flashlight
        hull() {
            translate([cw+s,0,sc]) corner();
            translate([cw+s+fw,0,sc]) corner();
            translate([cw+s+fw,fh,sc]) corner();
            translate([cw+s,fh,sc]) corner();
        }
        
//        #translate([ofw+1,fh+1,sc]) corner();
    }
}



module corner() {
    cylinder(h=10,r=sc);
    sphere(sc);
}