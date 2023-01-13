// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function client_update_entity(type = argument0, entityId = argument1){
	switch(type)
	{
		case entityType.point:
			var point = ds_map_find_value(global.Points, entityId);
			point.takenAmount = argument[2];
			point.takingFor = argument[3];
			point.lastTimeTrigered = argument[4];
		break;
	}
}