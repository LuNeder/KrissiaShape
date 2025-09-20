// (c) Luana Neder CC-BY-SA-4.0
// https://luana.dev.br/2025/09/20/KrissiaShape.html
d = 100/4; // Total length will be 4d, and I want it to be 10cm
side = (12/5) * d; // Side of  the pyramid (thanks, Miguel!)
rsq = (side * sqrt(2))/2; // diagonal of the square, halfed ("radius" of the "cylinder")


rotate([0, 0, 45]) {
    cylinder( 3*d, // height
        rsq, // bottom "radius" (l * srqt(2) / 2)
        00, // top "radius" (l * srqt(2) / 2)
        $fn=4 // 4 faces resolution (square base)
    );
};


x = (8/5) * d; // For the vertices of the trapezoid (thanks, Rádio!)
y = (2/5) * d; // Same as x
endcoord = (4*d) - (side/2); // Total length is 4d, but pyramid is centered on axis
iatr = 55; // Inclination θ of right side of the trapezoid, chosen arbitrarily as 55 deg bc it looks good
topendcoord = endcoord - (d * tan(90-iatr)); 
//topendcoord = endcoord - y; // option: I think this might make it parallel to the pyramid's side

// Point test
//translate([side/2, -side/2, 0]) sphere(r = 1);
//translate([side/2, side/2, 0]) sphere(r = 1);
//translate([x/2, x/2, d]) sphere(r = 1);
//translate([x/2, -x/2, d]) sphere(r = 1);
//translate([endcoord, side/2, 0]) sphere(r = 1);
//translate([endcoord, -side/2, 0]) sphere(r = 1);
//#translate([topendcoord, -((side/2) - y), d]) sphere(r = 1);
//#translate([topendcoord, ((side/2) - y), d]) sphere(r = 1);

polyhedron(
    // Vertices
    points=[
        [side/2, -side/2, 0], // 0
        [side/2, side/2, 0], // 1
        [x/2, x/2, d], // 2
        [x/2, -x/2, d], // 3
        [endcoord, side/2, 0], // 4 
        [endcoord, -side/2, 0], // 5
        [topendcoord, -((side/2) - y), d], // 6
        [topendcoord, ((side/2) - y), d] // 7
    ],

    
    faces=[ // faces in any ordeer, points in faces order by left hand rule (thumb: direction of n)
        [0,1,2,3], // Pyramid Face (left)
        [0,5,4,1], // Bottom
        [5,6,7,4], // Inclined right (B)
        [3,2,7,6], // Top (C)
        [0,3,6,5], // Front (->x ^z (X)y)
        [7,2,1,4] // Back
    ]
);
