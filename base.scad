use <functions.scad>

module logo(logo_width){
    length_por_width=2.065;
    length=30;
    width=length/length_por_width;
    rotate([0,0,90]) translate([-length/2,-width/2,0]) resize([length,width]) linear_extrude(height = logo_width+1) import("logo.dxf");
}

module space_for_rollers(x,base_width,axis_height,small_cylinder_diam,radius_tolerance){
    pocket_width=small_cylinder_diam+2*radius_tolerance;

    translate([x,0,axis_height]) {
        rotate([90,0,0]) create_cylinder(base_width+1,pocket_width);
        translate([-pocket_width/2,-(base_width+1)/2,0]) cube([pocket_width,base_width+1,100,]);
    }
}

module create_base(base_width,small_cylinder_diam,main_cylinder_diam){
    wall_thickness=3;
    small_cylinder_radius_tol=1;
    distance_between_rollers=50;
    radius_tolerance=1;
    distance_base_height_cylinder_center=small_cylinder_diam;
    distance_tolerance=1;
    base_height=wall_thickness+distance_tolerance+main_cylinder_diam/2+distance_base_height_cylinder_center;
    distance_tolerance=2;
    logo_width=1;

    base_length=distance_between_rollers+small_cylinder_diam+2*(radius_tolerance+wall_thickness);

    difference(){
        translate([-base_length/2,-base_width/2,0]) cube([base_length,base_width,base_height]);
        pocket_width=base_width-2*wall_thickness;
        translate([-base_length/2-1,-pocket_width/2,wall_thickness]) cube([base_length+2,pocket_width,base_height]);
        axis_height=base_height-distance_base_height_cylinder_center;
        space_for_rollers(-distance_between_rollers/2,base_width,axis_height,small_cylinder_diam,radius_tolerance);
        space_for_rollers(distance_between_rollers/2,base_width,axis_height,small_cylinder_diam,radius_tolerance);
        translate([0,0,wall_thickness-logo_width]) logo(logo_width);
     }

}
