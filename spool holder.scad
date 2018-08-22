$fn=50;
base_width=100;

washer_width=1;
washer_tolerance=1;

fit_cube_length=20;
fit_cube_width=10;

use <base.scad>
use <washer.scad>
use <half_roller.scad>
use <fit_cube.scad>

small_cylinder_diam=2;
main_cylinder_diam=20;

//create_base(base_width,small_cylinder_diam,main_cylinder_diam);
//create_washer(washer_width,main_cylinder_diam,small_cylinder_diam);
//half_roller(main_cylinder_diam,small_cylinder_diam,fit_cube_length,fit_cube_width,base_width,washer_width);
fit_cube(fit_cube_length,fit_cube_width);
