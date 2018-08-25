use <base.scad>
use <washer.scad>
use <half_roller.scad>
use <fit_cube.scad>
use <functions.scad>

$fn=50;

small_cylinder_diam=5;
max_cylinder_diam=30;
main_cylinder_diam=20;

base_width=120;
wall_thickness=2;
logo_width=2;
distance_between_rollers=120;
distance_base_height_cylinder_center=2*small_cylinder_diam;
base_height=wall_thickness+5+main_cylinder_diam/2+distance_base_height_cylinder_center+logo_width;

washer_width=2;
washer_tolerance=1;

fit_cube_length=20;
fit_cube_width=10;
nozzle_diameter=0.4;
first_layer_tolerance=sqrt(nozzle_diameter)/2;

create_base(base_width=base_width,base_height=base_height,distance_base_height_cylinder_center=distance_base_height_cylinder_center,small_cylinder_diam=small_cylinder_diam,logo_width=logo_width,wall_thickness=wall_thickness,distance_between_rollers=distance_between_rollers);

translate([-distance_between_rollers/2,0,base_height-distance_base_height_cylinder_center]) rotate([90,0,0])
half_roller(max_cylinder_diam=max_cylinder_diam,main_cylinder_diam=main_cylinder_diam,small_cylinder_diam=small_cylinder_diam,fit_cube_length=fit_cube_length,fit_cube_width=fit_cube_width,base_width=base_width,washer_width=washer_width,first_layer_tolerance=first_layer_tolerance,wall_thickness=wall_thickness,washer_tolerance=washer_tolerance);

translate([-distance_between_rollers/2,wall_thickness+washer_width/2+washer_tolerance-base_width/2,base_height-distance_base_height_cylinder_center]) rotate([90,0,0]) create_washer(washer_width=washer_width,washer_diam=max_cylinder_diam,small_cylinder_diam=small_cylinder_diam);

translate([-distance_between_rollers/2-fit_cube_width/2,fit_cube_length/2,base_height-distance_base_height_cylinder_center-fit_cube_width/2]) rotate([90,0,0]) fit_cube(fit_cube_length=fit_cube_length,fit_cube_width=fit_cube_width,first_layer_tolerance=first_layer_tolerance);
