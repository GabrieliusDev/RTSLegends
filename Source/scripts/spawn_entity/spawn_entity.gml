// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function spawn_entity(type = argument0, xx = argument1, yy = argument2){
	switch(type)
	{
		case entityType.path_point:
			var pathPoint = instance_create_depth(xx, yy, depth, obj_path_point);
			pathPoint.index = argument[3];
			pathPoint.path = argument[4];
			pathPoint.playerId = argument[5];
			
			server_buffer = con_server.server_buffer;
			buffer_seek(server_buffer, buffer_seek_start, 0);
			buffer_write(server_buffer, buffer_u8, network.spawned_entity);
			buffer_write(server_buffer, buffer_u8, entityType.path_point);
			buffer_write(server_buffer, buffer_u16, xx);
			buffer_write(server_buffer, buffer_u16, yy);
			buffer_write(server_buffer, buffer_u8, argument[3]);
			buffer_write(server_buffer, buffer_u8, argument[4]);
			buffer_write(server_buffer, buffer_u8, argument[5]);
			send_data_to_all_players(server_buffer);
		break;
		case entityType.headQuarters:
			var hq = instance_create_depth(xx, yy, depth, obj_HQ_server);
			hq.playerId = argument[3];
			
			switch(argument[3])
			{
				case 0:
					with(hq)
					{
						sprite_index = spr_HQ_player1;
					}
				break;
				case 1:
					with(hq)
					{
						sprite_index = spr_HQ_player2;
					}
				break;
			}
			
			server_buffer = con_server.server_buffer;
			buffer_seek(server_buffer, buffer_seek_start, 0);
			buffer_write(server_buffer, buffer_u8, network.spawned_entity);
			buffer_write(server_buffer, buffer_u8, entityType.headQuarters);
			buffer_write(server_buffer, buffer_u16, xx);
			buffer_write(server_buffer, buffer_u16, yy);
			buffer_write(server_buffer, buffer_u8, argument[3]);
			send_data_to_all_players(server_buffer);
		break;
	}
}