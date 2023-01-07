// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function client_update_entity_pos(type = argument0, xx = argument1, yy = argument2, objectId = argument3){
	switch(type)
	{
		case entityType.minion:
			var minion = ds_map_find_value(global.Minions, objectId);
			minion.x = xx;
			minion.y = yy;
		break;
	}
}