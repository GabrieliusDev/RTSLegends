// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function server_kill_entity(entity = argument0){
	for (var k = ds_map_find_first(global.CombatEntities); !is_undefined(k); k = ds_map_find_next(global.CombatEntities, k))
	{
		var cEntity = global.CombatEntities[? k];
		
		if(cEntity.attacking == entity)
		{
			cEntity.attacking = undefined;
		}
	}
	
	
	switch(entity.eType)
	{
		case entityType.minion:
			ds_map_delete(global.CombatEntities, entity.objectId);
			ds_map_delete(global.Minions, entity.objectId);
			
			server_buffer = con_server.server_buffer;
			buffer_seek(server_buffer, buffer_seek_start, 0);
			buffer_write(server_buffer, buffer_u8, network.entity_kill);
			buffer_write(server_buffer, buffer_u8, entityType.minion);
			buffer_write(server_buffer, buffer_u16, entity.objectId);
			send_data_to_all_players(server_buffer);
			
			instance_destroy(entity, false);
		break;
	}
}