@net8floz 2018 

# astar-grid-pathfinding
An example of astar grid based pathfinding in GMS2

![Preview](https://i.imgur.com/eI1vmiq.gif)


## Setup
Just import the scripts into your project! Optionally call `astar_allow_diagonal(false);` to disable diagonal checking 

## Function reference 

##### `astar_find_path(grid, start_x, start_y, end_x, end_y)` 
Returns a ds_list of positions. Positions are stored as arrays [x, y]. A grid is expected to be filled with `1`s and `0`s. `start_x`, `start_y`, `end_x`, `end_y` are all expected to be **grid positions** not pixel positions.

To customize what `0` and `1` mean as far as if a grid space is available or taken use the passable script functions

#### `astar_allow_diagonal(boolean)`
Allows or disables diagonal checks in pathfinding. True by default


#### `astar_set_passable_script(script_index)`
Sets the script used to check if a grid celll is passable - not required. Take a look at the default `astar_is_passable` script for implementation details.
