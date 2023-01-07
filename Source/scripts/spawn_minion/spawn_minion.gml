// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function spawn_minion(xx = argument0, yy = argument1, path = argument2, playerId = argument3){	
	var minion = instance_create_depth(xx, yy, depth, obj_minion_server);
	minion.path = path;
	minion.playerId = playerId;
	minion.objectId = global.NewMinionsId;
	
	switch(playerId)
	{
		case 0:
			with(minion)
			{
				sprite_index = spr_minion_player1;
			}
		break;
		case 1:
			with(minion)
			{
				sprite_index = spr_minion_player2;
			}
		break;
	}
	
	ds_map_add(global.Minions, global.NewMinionsId, minion);
	ds_map_add(global.CombatEntities, global.NewMinionsId, minion);
	 
	 
	server_buffer = con_server.server_buffer;
	buffer_seek(server_buffer, buffer_seek_start, 0);
	buffer_write(server_buffer, buffer_u8, network.spawned_minion);
	buffer_write(server_buffer, buffer_u16, xx);
	buffer_write(server_buffer, buffer_u16, yy);
	buffer_write(server_buffer, buffer_u8, path);
	buffer_write(server_buffer, buffer_u8, playerId);
	buffer_write(server_buffer, buffer_u16, global.NewMinionsId); 
	send_data_to_all_players(server_buffer);
	
	global.NewMinionsId += 1;
}