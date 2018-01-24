cell_size = 64;
width = room_width div cell_size;
height = room_height div cell_size;

grid = ds_grid_create(width,height);

astar_allow_diagonal(false);