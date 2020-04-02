//////////////////////////////////////////////////////////////////
// This module is used for generating the peg cutouts and pegs. //
//////////////////////////////////////////////////////////////////

// peg_space: This controls the X-axis space between the pegs.
// number_of_pegs: This defines the number of pegs to generate.
// peg_height: This defines the Z-axis height of the peg.
// peg_radius: This determines the diameter/circumferance of each peg.
// peg_y_position: This determines the Y-axis position of the pegs.

// This generates the GREEN peg clip.
module peg_connector_clip(connector_clip_x, connector_clip_y, connector_clip_z) {
    color("green")
    cube([connector_clip_x, connector_clip_y, connector_clip_z],true);
    translate([connector_clip_y+2,0,.25])
    cube([2,5,2.5],true);
}

// This generates the WHITE hole size in the Blue peg so the GREEN clip can slide in.
module peg_connector_hole(connector_clip_x, connector_clip_y, connector_clip_z) {
    color("white")
    peg_connector_clip(connector_clip_x+.25, connector_clip_y+.25, connector_clip_z);
}

// This module combines and diffs the WHITE hole from the BLUE peg.
module peg(peg_height, peg_radius, connector_clip_x, connector_clip_y, connector_clip_z) {
    difference() {
        // This generates the BLUE peg.
        color("blue")
        cylinder(h = peg_height, r1 = peg_radius, r2 = peg_radius, center = true);
        
        // This is the WHITE peg Hole.
        rotate([0,0,90])
        translate([2, 0, +4])
        peg_connector_hole(connector_clip_x, connector_clip_y, connector_clip_z);
    }
}

// This module generates "number_of_pegs" at "pegs_space" in millimeters apart.
module holder_pegs(peg_space, number_of_pegs, peg_height, peg_radius, connector_clip_x, connector_clip_y, connector_clip_z) {
    for (i=[0: 360/number_of_pegs: 360])
        rotate([0,0,i])
        translate([peg_space,0,0])
        peg(peg_height, peg_radius, connector_clip_x, connector_clip_y, connector_clip_z);
}


peg_y_position=20;

translate([0,peg_y_position,0])
holder_pegs(peg_space=60,
            number_of_pegs=2,
            peg_height=12,
            peg_radius=5,
            connector_clip_x=13,
            connector_clip_y=3,
            connector_clip_z=2);

//translate([0,-peg_y_position,0])
//holder_pegs(peg_space=60,
//            number_of_pegs=2,
//            peg_height=12,
//            peg_radius=5,
//            connector_clip_x=10,
//            connector_clip_y=3,
//            connector_clip_z=2);

//peg_connector_clip(connector_clip_x=10,
//                   connector_clip_y=3,
//                   connector_clip_z=2);