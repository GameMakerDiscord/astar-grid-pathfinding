draw_set_alpha(0.1);
draw_set_colour(c_white);
var _x=0;
repeat(width){
	draw_line(_x,0,_x,room_height);
	_x+=cell_size;
}

var _y=0;
repeat(height){
	draw_line(0,_y,room_width,_y);
	_y+=cell_size;
}

var _cx = 0;
repeat(width){
	var _cy = 0;
	repeat(height){
		if(grid[# _cx, _cy]){
			draw_rectangle(_cx * cell_size, _cy * cell_size, _cx * cell_size + cell_size, _cy * cell_size + cell_size,false);
		}
		++_cy;
	}
	
	++_cx;
}

draw_set_alpha(1);

