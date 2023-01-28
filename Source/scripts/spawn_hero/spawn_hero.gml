// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function spawn_hero(type = argument0, xx = argument1, yy = argument2){
	switch(type)
	{
		case entityType.hero_warrior:
			var warrior = instance_create_depth(mouse_x, mouse_y, -mouse_y, hero_warrior_server);
			warrior.playerId = obj_player.playerId;
			warrior.objectId = global.NewCombatEntityId;
			ds_map_add(global.CombatEntities, warrior.objectId, warrior);
	 
	 
			server_buffer = con_server.server_buffer;
			buffer_seek(server_buffer, buffer_seek_start, 0);
			buffer_write(server_buffer, buffer_u8, network.spawned_hero);
			buffer_write(server_buffer, buffer_u8, entityType.hero_warrior);
			buffer_write(server_buffer, buffer_u16, xx);
			buffer_write(server_buffer, buffer_u16, yy);
			buffer_write(server_buffer, buffer_u8, obj_player.playerId);
			buffer_write(server_buffer, buffer_u16, global.NewCombatEntityId); 
			send_data_to_all_players(server_buffer);
	
			global.NewCombatEntityId++;
		break;
	}
}