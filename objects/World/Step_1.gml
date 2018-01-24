ds_grid_clear(grid,0);

with(Obstacle){
	var _x1 = bbox_left div other.cell_size,
		_x2 = bbox_right div other.cell_size,
		_y1 = bbox_top div other.cell_size,
		_y2 = bbox_bottom div other.cell_size;
	
	if(ds_grid_within_bounds(other.grid,_x1,_y1)){
		other.grid[# _x1, _y1] = 1;
	}
	
	if(ds_grid_within_bounds(other.grid,_x1, _y2)){
		other.grid[# _x1, _y2] = 1;
	}
	
	if(ds_grid_within_bounds(other.grid,_x2, _x1)){
		other.grid[# _x2, _y1] = 1;
	}
	
	if(ds_grid_within_bounds(other.grid,_x2, _y2)){
		other.grid[# _x2, _y2] = 1;
	}
	
	
	
}