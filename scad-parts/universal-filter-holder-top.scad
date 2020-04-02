/////////////////////////////////////////////////////////////////
// This module is used for maintaining the PM2.5 Filter holder.//
/////////////////////////////////////////////////////////////////

// This imports the peg hole's to make the cutouts in the filter holder.
use <connector-pegs.scad>

module universal_filter_holder(filter_holder_x, filter_holder_y, filter_holder_z, filter_hole_height,filter_hole_radius, filter_hole_length, peg_space, peg_y_position, number_of_pegs, peg_height, peg_radius,connector_clip_x, connector_clip_y, connector_clip_z) {
    
    difference() {
        
        // This section is for creating the base rectangle for the filter holder.
        union() {
            // This section is for creating the YELLOW rectangle pieces of the filter holder.
            color("yellow")
            cube([filter_holder_x, filter_holder_y, filter_holder_z], center=true);
            
            // This section is for creating the RED rectangle pieces of the filter holder.
            translate([0,0,-1])
            color("red")
            cube([90-5.25, 124.5, filter_holder_z], center=true);
            
        }
    

        //This Section is for maintaining the large PINK center cutout for the air to pass through.
        translate([0, -filter_hole_length/2, 0])
        color("pink")
        hull() {
            translate([0, filter_hole_length, 0]) 
            cylinder(h = filter_hole_height, r1 = filter_hole_radius, r2 = filter_hole_radius, center = true);
            
            translate([0,0,-1])
            cylinder(h = filter_hole_height, r1 = filter_hole_radius, r2 = filter_hole_radius, center = true);
        }
        
        // This section is for making the PURPLE gap for holding the filter.
         translate([0,0,1])
         color("purple")
         cube([filter_holder_x-5, filter_holder_y-15, filter_holder_z+1], center=true);
    
        // This section is for cutting out the BLUE peg holes. Color defined in connector_pegs.scad file.
        // use <connector-pegs.scad>
        rotate([0,0,90])
        translate([0,peg_y_position,0])
        holder_pegs(peg_space, number_of_pegs, peg_height, peg_radius, connector_clip_x, connector_clip_y, connector_clip_z);

        rotate([0,0,90])
        translate([0,-peg_y_position,0])
    holder_pegs(peg_space, number_of_pegs, peg_height, peg_radius, connector_clip_x, connector_clip_y, connector_clip_z);
        
        }
    // The following 3 section create crossbar holders for the filters to secure them.    
    translate([0, -filter_hole_length/2, -1.75])  
    cube([filter_holder_x-5.25, 4, 1.5], center=true);
        
    translate([0, filter_hole_length/2, -1.75])  
    cube([filter_holder_x-5.25, 4, 1.5], center=true);
             
    translate([0, 0, -1.75])  
    cube([4, filter_holder_y-15.5, 1.5], center=true);

}

// Bottom Layer top
universal_filter_holder(filter_holder_x=90,
              filter_holder_y=140,
              filter_holder_z=3,
              filter_hole_height = 6,
              filter_hole_radius = 34,
              filter_hole_length = 48,
              peg_y_position=38,
              peg_space=64,
              number_of_pegs=2,
              peg_height=10,
              peg_radius=5,
              connector_clip_x=10,
              connector_clip_y=3,
              connector_clip_z=2);


