enum EAstar{
	X,
	Y,
	G,
	H,
	F,
	Open,
	Closed,
	ParentX,
	ParentY,
	Num
}

#macro ASTAR_TOP [0,-1,1]
#macro ASTAR_BOTTOM [0,1,1]
#macro ASTAR_LEFT [-1,0,1]
#macro ASTAR_RIGHT [1,0,1]
#macro ASTAR_TOP_LEFT [-1,-1,1.4]
#macro ASTAR_TOP_RIGHT [1,-1,1.4]
#macro ASTAR_BOTTOM_LEFT [-1,1,1.4]
#macro ASTAR_BOTTOM_RIGHT [1,1,1.4]

global._astar_grid = undefined;
global._astar_custom_passable_script = false;
global._astar_passable_script = astar_is_passable;

astar_allow_diagonal(true);
gml_pragma("global", "__astar_init()");




