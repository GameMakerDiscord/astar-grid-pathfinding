if(mouse_check_button_pressed(mb_left)){
	target_x = mouse_x div World.cell_size;
	target_y = mouse_y div World.cell_size;
	var _x = floor((x + sprite_width/2) / World.cell_size),	
		_y = floor((y + sprite_height/2) / World.cell_size);
	
	ds_list_destroy(paths);
	paths = astar_find_path(World.grid, _x, _y, target_x, target_y);
}

if(ds_list_size(paths)){
	var _point = paths[| 0],
		_x1 = _point[0] * World.cell_size,
		_y1 = _point[1] * World.cell_size;
	
	x += (_x1 - x) * 0.3;
	y += (_y1 - y) * 0.3;
	
	var _dx = _x1 - x,
		_dy = _y1 - y,
		_len_squared = _dx * _dx + _dy * _dy;
	
	if(_len_squared < 1){
		ds_list_delete(paths, 0);
		x = round(x);
		y = round(y);
	}
}