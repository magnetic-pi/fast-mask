

$fn=360;

module front_face_plug() {
    difference(){
        cylinder(h=3, r=20, center=true);
        translate([0,0,1])
        cylinder(h=3, r=19.5, center=true);
    }

    translate([0,0,5])
    cylinder(h=10, r=1, center=true);

    translate([0,0,10.5])
    cylinder(h=2, r1=1.5, r2=0, center=true);
}

front_face_plug();