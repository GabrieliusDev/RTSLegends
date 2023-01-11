// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function find_nearest_enemy(){
	
	var nearestEntity = undefined;
	var nearestDist = room_width;
	for (var k = ds_map_find_first(global.CombatEntities); !is_undefined(k); k = ds_map_find_next(global.CombatEntities, k)) {
		var entity = global.CombatEntities[? k];
	  
		if(entity != pointer_null)
		{
			if(entity.playerId != playerId)
			{
				var dist = distance_to_point(entity.x, entity.y);
				if(dist < nearestDist)
				{
					nearestDist = dist;
					nearestEntity = entity;
				}
			}
		}
	}
	
	if(nearestDist <= focusRadius)
	{
		attacking = nearestEntity;
		if(obj_player.isHost)
			send_minion_target(objectId, inCombat, true, attacking.objectId);
	}
}