// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function client_kill_entity(objectId = argument0){
	var entity = ds_map_find_value(global.CombatEntities, objectId);
	for (var k = ds_map_find_first(global.CombatEntities); !is_undefined(k); k = ds_map_find_next(global.CombatEntities, k))
	{
		var cEntity = global.CombatEntities[? k];
		
		if(cEntity.attacking == entity)
		{
			cEntity.attacking = undefined;
		}
	}
	
	for (var k = ds_map_find_first(global.Motivations); !is_undefined(k); k = ds_map_find_next(global.Motivations, k))
	{
		var cEntity = global.Motivations[? k];
		
		if(cEntity.target.objectId == objectId)
		{
			cEntity.target = undefined;
			ds_map_delete(global.Motivations, k);
			instance_destroy(cEntity, false);		
		}
	}
	
	switch(entity.eType)
	{
		case entityType.minion:
			ds_map_delete(global.CombatEntities, entity.objectId);
			ds_map_delete(global.Minions, entity.objectId);
			
			instance_destroy(entity, false);
		break;
	}
}