//////////////////////////////////////////////////////////////////////////////////////////////
// This module is used for connecting the snorkel to the filter.//
//////////////////////////////////////////////////////////////////////////////////////////////

// Generates two BLUEoutside blocks for the plug to connect through.
module connector_block_cutout(ccube_x, ccube_y, ccube_z){
    color("blue")
    difference() {
        cube([ccube_x, ccube_y, ccube_z],center=true);
        cube([ccube_x+2, ccube_y-1, ccube_z-1],center=true);
    }
}

// Generates RED inside block for the plug to connect through.
module connector_block_outsides(ccube_x, ccube_y, ccube_z){
    color("red")
    difference() {
        connector_block_cutout(ccube_x, ccube_y, ccube_z);
        cube([ccube_x-15, ccube_y+2, ccube_z+2],center=true);
    }
}

// Generates the white plug to hold the parts together.
module connector_block_peg(ccube_x, ccube_y, ccube_z){
    color("white")
    difference() {
        cube([ccube_x+2, ccube_y, ccube_z],center=true);
        translate([-1, 0, 0])
        connector_block_cutout(ccube_x+.25, ccube_y+.25, ccube_z+.25);
    }
}

// Generates two BLUEoutside blocks for the plug to connect through.
connector_block_outsides(ccube_x=30, ccube_y=5, ccube_z=5);

// Generates RED inside block for the plug to connect through.
connector_block_cutout(ccube_x=15, ccube_y=5, ccube_z=5);

// Generates the white plug to hold the parts together.
//connector_block_peg(ccube_x=30, ccube_y=5, ccube_z=5);
