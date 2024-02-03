$fn=100;
eps=1/128;

bw=120;
bd=80;
bh=40;
wt=1.5;

difference() {
    cube([bw,bd,bh], center=true);
    translate([0,0,wt]) cube([bw-wt*2,bd-wt*2,bh], center=true);
}
