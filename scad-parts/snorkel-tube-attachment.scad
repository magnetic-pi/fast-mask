//////////////////////////////////////////////////////////////////////////////////////////////
// This module is used for maintaining the connector tube to the PM2.5 Filter holder bottom.//
//////////////////////////////////////////////////////////////////////////////////////////////

// This imports the connector blocks, designed to connect the snorkel to the filter bottom.
use <connector-blocks.scad>


// This module is for generating the outer tube wall.
module snorkel_tube_outer_wall(snorkel_diameter, snorkel_tube_height, snorkel_tube_radius){
    hull() {
        translate([0, snorkel_diameter, 0]) 
        cylinder(h = snorkel_tube_height, r1 = snorkel_tube_radius, r2 = snorkel_tube_radius, center = true);
        cylinder(h = snorkel_tube_height, r1 = snorkel_tube_radius, r2 = snorkel_tube_radius, center = true);
        }
}

// This module is for removing the center of the tube.
module snorkel_tube_inner_cutout(snorkel_diameter, snorkel_tube_height, snorkel_tube_radius){
    translate([0, 0, -1])
    hull() {
        translate([0, snorkel_diameter, 0]) 
        cylinder(h = snorkel_tube_height-1, r1 = snorkel_tube_radius-1, r2 = snorkel_tube_radius-1, center = true);
        cylinder(h = snorkel_tube_height-1, r1 = snorkel_tube_radius-1, r2 = snorkel_tube_radius-1, center = true);
    }
}


// This module combines the first two modules to diff the inner out of the outer wall.
module diffed_snorkel_tube(snorkel_diameter, snorkel_tube_height, snorkel_tube_radius){
    
    translate([0, -(snorkel_diameter/2), 0])
    difference(){
    snorkel_tube_outer_wall(snorkel_diameter, snorkel_tube_height, snorkel_tube_radius);
    snorkel_tube_inner_cutout(snorkel_diameter, snorkel_tube_height, snorkel_tube_radius);
    
    color("red")
    translate([-11, 0, 13.5])
    cube([10,90,140],center=true);

    // Snorkel tube backside cutout.
    color("purple")
    translate([-8, 12.5, 84])
    cube([2,12,6], center=true);   

    }
   
}

// This module is for generating connector clip to connect the tube to the mask.
module connector_clip(){
    difference(){
        cube([15,20,1],center=true);
        translate([-1,0,0])
        cube([6,12,10],center=true);      
    }
}

module snorkel_filter_attachment_tube(snorkel_diameter, snorkel_tube_height, snorkel_tube_radius){
    rotate([90,90,0])
    translate([9, 0, -15])   
    diffed_snorkel_tube(snorkel_diameter, snorkel_tube_height, snorkel_tube_radius);   
    
    // This adds the black connector section on the front to connect the filter bottom to the snorkel tube.
    //use <connector-blocks.scad>
    color("black")
    translate([0,74,4.5])
    connector_block_cutout(ccube_x=15, ccube_y=5, ccube_z=5);
    
    color("green")
    rotate([0,0,90])
    translate([104,0, -19.5])
    connector_clip();
  
}

snorkel_filter_attachment_tube(snorkel_diameter=25.5, snorkel_tube_height=170, snorkel_tube_radius=11);