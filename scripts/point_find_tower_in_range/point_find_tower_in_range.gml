// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function point_find_tower_in_range(player = argument0){
	if(owner != player.playerId && p_type == types.tower)
	{
		if(point_distance(x, y, mouse_x, mouse_y) <= radius_of_blocked_construction)
		{
			other.tower_in_range = self;	
		}
	}
}