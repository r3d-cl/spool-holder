module create_cylinder(length,diameter){
    cylinder(length,diameter/2,diameter/2, center=true);
}

module prism(side,height){
     linear_extrude(height = height) polygon(points=[[0,0],[side,0],[0,side]]);
}
