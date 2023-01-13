// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function client_spawn_minion(xx = argument0, yy = argument1, path = argument2, playerId = argument3, objectId = argument4){
	var minion = instance_create_depth(xx, yy, depth, obj_minion);
	minion.path = path;
	minion.playerId = playerId;
	minion.objectId = objectId;
	
	switch(playerId)
	{
		case 1:
			with(minion)
			{
				sprite_index = spr_minion_animated_player1;
				image_index = floor(random(sprite_get_number(sprite_index)));
			}
		break;
		case 2:
			with(minion)
			{
				sprite_index = spr_minion_animated_player2;
				image_index = floor(random(sprite_get_number(sprite_index)));
			}
		break;
	}
	
	ds_map_add(global.Minions, objectId, minion);
	ds_map_add(global.CombatEntities, objectId, minion);
}