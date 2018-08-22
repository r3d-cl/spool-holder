module vertical_prim(first_layer_tolerance,fit_cube_length){
     linear_extrude(height = fit_cube_length+2) polygon(points=[[-first_layer_tolerance,-first_layer_tolerance],[-first_layer_tolerance,2*first_layer_tolerance],[2*first_layer_tolerance,-first_layer_tolerance]]);
}

module fit_cube(fit_cube_length=10,fit_cube_width=10,first_layer_tolerance=1){
    difference(){
        cube([fit_cube_width,fit_cube_width,fit_cube_length]);
        translate([0,0,-1]) vertical_prim(first_layer_tolerance,fit_cube_length);
        translate([0,fit_cube_width,-1]) rotate([0,0,-90]) vertical_prim(first_layer_tolerance,fit_cube_length);
        translate([0,fit_cube_width+1,0]) rotate([90,0,0]) vertical_prim(first_layer_tolerance,fit_cube_length);
        translate([0,-1,fit_cube_length]) rotate([-90,0,0]) vertical_prim(first_layer_tolerance,fit_cube_length);
    }
}
