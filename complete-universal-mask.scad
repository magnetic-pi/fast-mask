/////////////////////////////////////////////////////////////////////////
// The universal mask is made with a filter holder specifically        //
// designed to have a smaller opening to hold partial piece of a mask. //
// This should only be used in times of emergency when supplies are    //
// critically low.                                                     //
/////////////////////////////////////////////////////////////////////////


use <scad-parts/snorkel-tube-attachment.scad>
use <scad-parts/filter-holder-bottom.scad>
use <scad-parts/connector-pegs.scad>
use <scad-parts/connector-blocks.scad>
use <scad-parts/universal-filter-holder-top.scad>
use <scad-parts/front-plug.scad>
use <scad-parts/filter-side-clamps.scad>

/////////////////////////////////////////////////////
// Filter layer bottom.                            //
//use <scad-parts/filter-holder-bottom.scad>       //
/////////////////////////////////////////////////////
translate([0,1.5,-5])
filter_holder_bottom(filter_holder_top_x=90,
                     filter_holder_top_y=140,
                     filter_holder_top_z=6,
                     snorkel_diameter=25.5,
                     snorkel_tube_height=5,
                     snorkel_tube_radius=11,
                     peg_y_position=38,
                     peg_space=64,
                     number_of_pegs=2,
                     peg_height=12,
                     peg_radius=5,
                     connector_clip_x=16,
                     connector_clip_y=3,
                     connector_clip_z=2);

///////////////////////////////////////////////////////
// Universal first filter holder layer.              //
//use <scad-parts/universal-filter-holder-top.scad>  //
///////////////////////////////////////////////////////
//color("green")
//translate([0,11.50,-1])
//universal_filter_holder(filter_holder_x=90,
//              filter_holder_y=140,
//              filter_holder_z=2,
//              filter_hole_height = 6,
//              filter_hole_radius = 30,
//              filter_hole_length = 45,
//              peg_y_position=38,
//              peg_space=64,
//              number_of_pegs=2,
//              peg_height=10,
//              peg_radius=5,
//              connector_clip_x=10,
//              connector_clip_y=3,
//              connector_clip_z=2);

//////////////////////////////////////////////////////
// Universal second filter holder layer.            //
//use <scad-parts/universal-filter-holder-top.scad> //
//////////////////////////////////////////////////////
//color("red")
//translate([0,11.50,1])
//universal_filter_holder(filter_holder_x=90,
//              filter_holder_y=140,
//              filter_holder_z=2,
//              filter_hole_height = 6,
//              filter_hole_radius = 30,
//              filter_hole_length = 45,
//              peg_y_position=38,
//              peg_space=64,
//              number_of_pegs=2,
//              peg_height=10,
//              peg_radius=5,
//              connector_clip_x=10,
//              connector_clip_y=3,
//              connector_clip_z=2);

//////////////////////////////////////////////////
// Connector tube to snorkel mask.              //
//use <scad-parts/snorkel-tube-attachment.scad> //
//////////////////////////////////////////////////
rotate([0,0,0])
translate([0, 0, -5])
snorkel_filter_attachment_tube(snorkel_diameter=25.5, snorkel_tube_height=170, snorkel_tube_radius=11);

///////////////////////////////////////////
// Clips for four filter holder pegs.    //
// use <scad-parts/connector_pegs.scad>  //
///////////////////////////////////////////
//peg_connector_clip(connector_clip_x=10,
//                   connector_clip_y=2.5,
//                   connector_clip_z=1.5);

///////////////////////////////////////////
// Peg for front holder squares.         //
//use <scad-parts/connector_blocks.scad> //
///////////////////////////////////////////
//connector_block_peg(ccube_x=30, 
//                     ccube_y=4,
//                     ccube_z=4);

///////////////////////////////////////////////
// Side clamps for preventing side buldging. //
//use <scad-parts/filter-side-clamps.scad>   //
///////////////////////////////////////////////
//filter_side_clamps();
