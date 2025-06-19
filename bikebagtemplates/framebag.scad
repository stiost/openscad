$fn=100;

angle_c=59.3191;
angle_d=116.866;

module bottom() {
    a=65; // bottom 
    b=112; // right side until zipper
    c=214; // downtube
    d=245; // top where zipper goes
    aca=150; // angle between a and c

    // d=b
    // c=ab+c 
    // tan(-150) * x = b
    // x = b/tan(-150)

    echo(sqrt(pow(d-a, 2) + pow(b,2)));
    

//    d=b/tan(-150)+a;
//    echo("d", d);

    linear_extrude(2)
    polygon(
        [[0,0], [0,b], [d,b], [a,0]],
        [[0,1,2,3]]
    );
}

module frame() {
    a=531.2; // 68+196.7+196.5+70;
    b=377.4; // 147.6+64+165.8;
    c=622.3; // 109.3+64+230+64+155;
    d=60;
    echo(a, b, c, d);
    
    // calculate d
    // x^2 + y^2 = c^2
    // (x+a)^2 + (y+b)^2 = d^2
    
    C=[0,0];
    B=[0,b];
    A=[a,b];
    D = [535.1917, 317.5329]; // from python script
        
    angle_C = internal_angle(D, C, B);
    angle_B = internal_angle(C, B, A);
    angle_A = internal_angle(B, A, D);
    angle_D = internal_angle(A, D, C);

    echo("Angle A =", angle_A);
    echo("Angle B =", angle_B);
    echo("Angle C =", angle_C);
    echo("Angle D =", angle_D);
    echo("SUM=", angle_A+angle_B+angle_C+angle_D);
    echo("slope=", D[0]/D[1]);
    
    polygon([C, B, A, D], [[0,1,2,3]]);
}

module bottom2(height, bottom_width) {
    m = tan(90-angle_c);
    echo("m", m);
    // y=mx+0
    y = m * bottom_width;
    echo("y", y);
    
    C=[0,y];
    D=[bottom_width,y];
    B=[0,y+height];
    // y+height=mx
    // x=(y+height)/m
    A=[(y+height)/m,y+height];
    
    polygon([C, B, A, D], [[0,1,2,3]]);
}

function vector_angle(v) = atan2(v[1], v[0]);

function internal_angle(prev, current, next) =
    let (
        v1 = prev - current,
        v2 = next - current,
        a1 = vector_angle(v1),
        a2 = vector_angle(v2),
        angle = (a2 - a1 + 360) % 360
    )
    angle > 180 ? 360 - angle : angle;

color("red") translate([0,0,-1]) frame();
bottom2(112, 60);
