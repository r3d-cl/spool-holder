use <functions.scad>

module create_washer(washer_width,washer_diam,small_cylinder_diam){
    washer_radius_tolerance=1;

    difference(){
        create_cylinder(washer_width,washer_diam);
        create_cylinder(washer_width+1,small_cylinder_diam+2*washer_radius_tolerance);}
}
