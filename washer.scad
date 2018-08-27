use <functions.scad>

module create_washer(){
    difference(){
        create_cylinder(washer_width,washer_diam);
        create_cylinder(washer_width+1,small_cylinder_pocket_diam);}
}
