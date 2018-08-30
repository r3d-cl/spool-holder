module half_roller(){
    small_cylinder_overlap=3;
    fit_tolerance=0.2;

    difference(){
        union(){
            cylinder(r=main_cylinder_diam/2,h=rolling_distance/2);
            translate([0,0,(rolling_distance+max_cylinder_diam-main_cylinder_diam)/2])
                union(){
                    cylinder(h=max_cylinder_diam/2,r1=max_cylinder_diam/2,r2=0);
                    mirror([0,0,-1]) cylinder(h=max_cylinder_diam/2,r1=max_cylinder_diam/2,r2=0);
                }
            cylinder(r=small_cylinder_diam/2,h=base_width/2+small_cylinder_overlap);
        }
        cube([fit_cube_width+fit_tolerance,fit_cube_width+fit_tolerance,fit_cube_length+6],center=true);
        translate([0,0,-first_layer_tolerance]) rotate([0,0,45])
            cylinder(2*first_layer_tolerance,sqrt(2)*fit_cube_width/2+2*first_layer_tolerance,sqrt(2)*fit_cube_width/2,$fn=4);
    }
}
