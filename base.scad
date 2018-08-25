use <functions.scad>

module logo(logo_width){
    length_por_width=2.065;
    length=60;
    width=length/length_por_width;
    rotate([0,0,90]) translate([-length/2,-width/2,0]) resize([length,width]) linear_extrude(height = logo_width) import("logo.dxf");
}

module space_for_rollers(x,base_width,axis_height,small_cylinder_diam,radius_tolerance){
    pocket_width=small_cylinder_diam+2*radius_tolerance;

    translate([x,0,axis_height]) {
        rotate([90,0,0]) create_cylinder(base_width+1,pocket_width);
        translate([-pocket_width/2,-(base_width+1)/2,0]) cube([pocket_width,base_width+1,100,]);
    }
}

module first_support_wall(base_length,wall_thickness,base_width){
    x_distance_wall_support_centers=40;
    translate ([x_distance_wall_support_centers/2-wall_thickness/2,wall_thickness-base_width/2,0]) rotate([90,0,90]) prism(side=12,height=wall_thickness);
}

module left_support_walls(base_length,wall_thickness,base_width){
    first_support_wall(base_length,wall_thickness,base_width);
    mirror([1,0,0]) first_support_wall(base_length,wall_thickness,base_width);
}

module create_base(){
    small_cylinder_radius_tol=1;
    radius_tolerance=1;

    base_length=distance_between_rollers+small_cylinder_diam+2*radius_tolerance+6*wall_thickness;

    difference(){
        translate([-base_length/2,-base_width/2,0]) cube([base_length,base_width,base_height]);
        pocket_width=base_width-2*wall_thickness;
        translate([-base_length/2-1,-pocket_width/2,wall_thickness]) cube([base_length+2,pocket_width,base_height]);
        axis_height=base_height-distance_base_height_cylinder_center;
        space_for_rollers(-distance_between_rollers/2,base_width,axis_height,small_cylinder_diam,radius_tolerance);
        space_for_rollers(distance_between_rollers/2,base_width,axis_height,small_cylinder_diam,radius_tolerance);
     }
     translate([0,0,wall_thickness]) logo(logo_width);
     side=20;

     left_support_walls(base_length,wall_thickness,base_width);
     mirror([0,1,0]) left_support_walls(base_length,wall_thickness,base_width);
}
