///@function astar_allow_diagonal(boolean)
///@description Allows or disables diagonal checks in pathfinding. True by default
///@param boolean
var _boolean = argument0;

if(argument0){
	global._astar_adjacent = [ASTAR_TOP, ASTAR_BOTTOM, ASTAR_LEFT, ASTAR_RIGHT, ASTAR_TOP_LEFT, ASTAR_TOP_RIGHT, ASTAR_BOTTOM_LEFT, ASTAR_BOTTOM_RIGHT];	
}else{
	global._astar_adjacent = [ASTAR_TOP, ASTAR_BOTTOM, ASTAR_LEFT, ASTAR_RIGHT];
}
