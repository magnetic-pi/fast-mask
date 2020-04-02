/////////////////////////////////////////////////////////////////////////////////
// This module is for generating the side holder clips for the filter holders. //
// The clips will help form a better seal around the filters.                  //
/////////////////////////////////////////////////////////////////////////////////

module filter_side_clamps(){
    difference() {
        translate([0,0,-4])
        cube([18,5,13],center=true);
        translate([0,1,-4.5])
        cube([30,4,9],center=true);
        translate([0,0,-4])
        cube([30,3,10],center=true);
    }
}

filter_side_clamps();