///@function astar_set_passable_script
///@description Sets the script used to check if a grid celll is passable - not required
///@param script
global._astar_passable_script = argument0;
global._astar_custom_passable_script = (argument0 != astar_is_passable);