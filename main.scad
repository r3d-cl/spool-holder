include <base.scad>
include <half_roller.scad>
include <fit_cube.scad>
include <functions.scad>

$fn=50;

rolling_distance=90;
small_cylinder_diam=4;
max_cylinder_diam=30;
main_cylinder_diam=20;
roller_ult_large_cyl_height=2;

wall_thickness=2;
logo_width=2;
distance_between_rollers=120;
distance_base_height_cylinder_center=2*small_cylinder_diam;
base_height=wall_thickness+5+main_cylinder_diam/2+distance_base_height_cylinder_center+logo_width;

base_width=110;

echo(base_width);

fit_cube_length=20;
fit_cube_width=10;
nozzle_diameter=0.4;
first_layer_tolerance=sqrt(nozzle_diameter)/2;

module left_front_assembly(){
    translate([-distance_between_rollers/2,0,base_height-distance_base_height_cylinder_center]) rotate([90,0,0]) half_roller();
}

module front_assembly(){
    left_front_assembly();
    mirror([0,1,0]) left_front_assembly();
}

//half_roller();

create_base();
left_front_assembly();

//fit_cube();
//front_assembly();
//mirror([1,0,0]) front_assembly();

//half_roller();

//translate([-distance_between_rollers/2-fit_cube_width/2,fit_cube_length/2,base_height-distance_base_height_cylinder_center-fit_cube_width/2]) rotate([90,0,0]) fit_cube();
