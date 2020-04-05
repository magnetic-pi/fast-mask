/////////////////////////////////////////////////////////////////////////////////////////
// This module is used for creating the box for the snorkel tube and filter to connect.//
/////////////////////////////////////////////////////////////////////////////////////////

// This imports the peg hole's to make the cutouts in the filter holder.
use <connector-pegs.scad>
// This imports the peg hole's to make the cutouts in the filter holder.
use <snorkel-tube-attachment.scad>
// This imports the connector blocks, designed to connect the snorkel to the filter bottom.
use <connector-blocks.scad>

//Bottom half of the air filter holder.
module filter_holder_bottom(filter_holder_top_x, filter_holder_top_y, filter_holder_top_z, snorkel_tube_height, snorkel_tube_radius, snorkel_diameter, peg_space, number_of_pegs, peg_height, peg_radius, peg_y_position, connector_clip_x, connector_clip_y, connector_clip_z) {
    
    
    difference() {
        // This is the YELLOW base plate that everything is carving out of.
        color("yellow")
        cube([filter_holder_top_x, filter_holder_top_y, filter_holder_top_z], center=true);
        
        // This is the initial ORANGE area carved out of the inside of the YELLOW section.
        color("orange")
        cube([filter_holder_top_x-9, filter_holder_top_y-9, filter_holder_top_z-1], center=true);
        
        // This is the GREEN edge so that the filter layer connects nicely to this piece.
        color("green")
        translate([0,0,filter_holder_top_z-1])
        cube([filter_holder_top_x-5, filter_holder_top_y-5, filter_holder_top_z+1], center=true);
        
        // This is the PINK cutout so that the snorkel attachment can connect to the YELLOW base layer for the snorkel attacnment.
        color("pink")
        translate([0, 0, 0])
        cube([41, 131, 12], center=true);

    }
    
    // Bottom square to make a tighter fit to the tube.
    color("white")
    translate([0, 0, -4])
    difference(){
        cube([41.4, filter_holder_top_y, 2], center=true);
        cube([40, filter_holder_top_y-9.1, 5], center=true);
    }    
    
    // This section is for generating the BLUE pegs. Color defined in connector_pegs.scad file.
    // use <connector-pegs.scad>
    rotate([0,0,90])
    translate([0,peg_y_position,peg_height/3])
    holder_pegs(peg_space, number_of_pegs, peg_height, peg_radius-.25, connector_clip_x, connector_clip_y, connector_clip_z);

    rotate([0,0,90])
    translate([0,-peg_y_position,peg_height/3])
    holder_pegs(peg_space, number_of_pegs, peg_height, peg_radius-.25, connector_clip_x, connector_clip_y, connector_clip_z);
    
    // This section is for adding the BLACK connector blocks used to secure YELLOW to snorkel tube.
    // use <connector-blocks.scad> 
    color("black")
    translate([0,72.5,4.5])
    connector_block_outsides(ccube_x=30, ccube_y=5, ccube_z=5);
    
    
    // This section is for adding the PURPLE connector peg at the back of the YELLOW layer.
    color("purple")
    translate([0, -70, -1])
    cube([11.5,6,1.75], center=true);

}

filter_holder_bottom(filter_holder_top_x=90,
                     filter_holder_top_y=140,
                     filter_holder_top_z=6,
                     snorkel_diameter=20,
                     snorkel_tube_height=5,
                     snorkel_tube_radius=10,
                     peg_y_position=38,
                     peg_space=64,
                     number_of_pegs=2,
                     peg_height=13,
                     peg_radius=5,
                     connector_clip_x=10,
                     connector_clip_y=3,
                     connector_clip_z=2);


