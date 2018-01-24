///@function astar_find_path(grid, start_x, start_y, end_x, end_y)
///@description Returns a ds_list of positions. Positions are stored as arrays [x, y]
///@param grid
///@param start_x
///@param start_y
///@param end_x 
///@param end_y
gml_pragma("forceinline");
var _grid = argument0,	
	_start_x = argument1,
	_start_y = argument2,
	_end_x = argument3,
	_end_y = argument4,
	_value_grid = ds_grid_create(ds_grid_width(_grid),ds_grid_height(_grid)),
	_open = ds_priority_create(),
	_adjacent = global._astar_adjacent,
	_custom_script = (global._astar_custom_passable_script) ? global._astar_passable_script : noone;

var _time = get_timer();
//Create intial cell
var _out = ds_list_create(),
	_first_cell = array_create(EAstar.Num);
_first_cell[@ EAstar.X] = _start_x;
_first_cell[@ EAstar.Y] = _start_y;
_first_cell[@ EAstar.H] = 9999;

_first_cell[@ EAstar.Open] = true;


//Add initial cell to open queue
_value_grid[# _start_x, _start_y] = _first_cell;
ds_priority_add(_open,_first_cell,_first_cell[@ EAstar.F]);

while(ds_priority_size(_open)){
	//Get first celland remove from open list
	var _cell = ds_priority_delete_min(_open);
	_cell[@ EAstar.Closed] = true;
	_cell[@ EAstar.Open] = false;
	
	//Mark cell as closed
	_value_grid[# _cell[EAstar.X],_cell[EAstar.Y]] = _cell;
	
	if(_cell[EAstar.X] == _end_x && _cell[EAstar.Y] == _end_y){
		//Path has been found - return path
		 
		

		var _ox = _start_x,
			_oy = _start_y,
			_x1 = _cell[EAstar.X],
			_y1 = _cell[EAstar.Y];
			
		
		while(!(_ox == _x1 && _oy == _y1)){
			var _child = _value_grid[# _x1, _y1];
			ds_list_add(_out,[_x1, _y1]);
			_x1 = _child[EAstar.ParentX];
			_y1 = _child[EAstar.ParentY];
		}
		
		if(!ds_list_size(_out)){
			break;
		}
		
		ds_list_add(_out,[_ox, _oy]);
		
		ds_list_flip(_out);
		//show_debug_message(get_timer() - _time);
		break;
	}
	
	//Check adjacent
	var _i=-1;
	repeat(array_length_1d(_adjacent)){
		++_i;
		var _adjacent_data = _adjacent[_i],
			_x1 = _cell[EAstar.X] + _adjacent_data[0],
			_y1 = _cell[EAstar.Y] + _adjacent_data[1];
		
		//Supress out of bound errors
		if(!ds_grid_within_bounds(_grid, _x1, _y1)){
			continue;
		}
		
		//Look out for non passable cells
		var _passable_value = _grid[# _x1, _y1],			
			_can_pass = false;
		
		if(_custom_script >= 0){
			_can_pass = script_execute(_custom_script, _passable_value);	
		}else{
			_can_pass = astar_is_passable(_passable_value);	
		}
		
		//Ignore if cannot pass 
		if(!_can_pass){
			continue;
		}
		
		var _adjacent_cell = _value_grid[# _x1 , _y1],
			_update = false,
			_create = !is_array(_adjacent_cell),
			_g = _cell[EAstar.G]+_adjacent_data[2];
		
		if(_create){
			_adjacent_cell = array_create(EAstar.Num);
			_adjacent_cell[EAstar.X] = _x1;
			_adjacent_cell[EAstar.Y] = _y1;
			_update = true;
			
		}else{
			//Don't check closed cells 
			if(_adjacent_cell[EAstar.Closed]){
				continue;
			}
			_update = (_g < _adjacent_cell[EAstar.G]);
		}
		
		if(_update){
			//Update cell values
			_adjacent_cell[@ EAstar.H] = abs(_x1 - _end_x) + abs(_y1 - abs(_end_y));
			_adjacent_cell[@ EAstar.G] = _g;
			_adjacent_cell[@ EAstar.F] = _adjacent_cell[EAstar.H] + _adjacent_cell[EAstar.G];
			_adjacent_cell[@ EAstar.ParentX] = _cell[EAstar.X];
			_adjacent_cell[@ EAstar.ParentY] = _cell[EAstar.Y];
			
			if(_create){
				//Add to open queue
				_adjacent_cell[@ EAstar.Open] = true;
				ds_priority_add(_open,_adjacent_cell,_adjacent_cell[EAstar.F]);
				_value_grid[# _x1, _y1] = _adjacent_cell;
			}
		}
	}
} 


ds_grid_destroy(_value_grid);
ds_priority_destroy(_open);

return _out;