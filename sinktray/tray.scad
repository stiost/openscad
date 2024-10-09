eps=1/128;
$fn=100;

a=3; // walls
b=3; // depth
c=5; // height
d=1; // spacing between bumps
e=240; // width
f=e-a-a; // interior width
g=60; // height
h=g-a-a; // interior height
bw=10;
bh=7;

difference() {
    cube([240, 60, c]);
    translate([a,a,c-b]) cube([f, h, b+eps]);
}

mbw=(f-d)/(bw+d);
bpw=floor(mbw)*(bw+d)-d;
s=(e-bpw)/2;

mbh=(h-1)/(bh+d);
echo(mbh);
bph=floor(mbh)*(bh+d)-d;
echo(bph);
sy=(g-bph)/2;

for(bx=[0:floor(mbw)-1]) {
    
    for(by=[0:floor(mbh)-1]) {            
        translate([s+bx*(bw+d),sy+by*(bh+d),c-b]) bump(bw/2, bh/2);
    }
}

module bump(w, h) {
    scale([1, (h/w), 1]) translate([w,w,0]) cylinder(h=3,r1=w, r2=w-2);
}
