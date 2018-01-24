draw_self();
draw_set_colour(c_yellow);
draw_set_alpha(0.3);
var _i=0;
repeat(ds_list_size(paths)-1){
	var _point = paths[| ++_i];
	var _x1 = _point[0] * World.cell_size,
		_y1 = _point[1] * World.cell_size,
		_x2 = _x1 + 64,
		_y2 = _y1 + 64;
		
	draw_rectangle(_x1, _y1, _x2, _y2, false);
}
draw_set_alpha(1);