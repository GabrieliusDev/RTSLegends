// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function client_spawn_hero(type = argument0, xx = argument1, yy = argument2, playerId = argument3, objectId = argument4){
	switch(type)
	{
		case entityType.hero_warrior:
			var warrior = instance_create_depth(xx, yy, -yy, hero_warrior);
			warrior.playerId = playerId;
			warrior.objectId = objectId;
			ds_map_add(global.CombatEntities, objectId, warrior);
			
		break;
	}
}