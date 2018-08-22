module half_roller(main_cylinder_diam,small_cylinder_diam,fit_cube_length,fit_cube_width,base_width,washer_width){
    small_cylinder_overlap=2;
    fit_tolerance=0.2;
    washer_tolerance=1;

    difference(){
        union(){
            cylinder(r=main_cylinder_diam/2,h=(base_width-fit_tolerance)/2-washer_width-2*washer_tolerance);
            cylinder(,r=small_cylinder_diam/2,h=base_width/2+small_cylinder_overlap);
        }
        cube([fit_cube_width,fit_cube_width,2*(fit_cube_length+1)],center=true);
    }
}
