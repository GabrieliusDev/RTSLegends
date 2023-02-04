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
			hq.objectId = global.NewObjectId;
			
			switch(argument[3])
			{
				case 1:
					with(hq)
					{
						sprite_index = spr_HQ_player1;
					}
				break;
				case 2:
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
			buffer_write(server_buffer, buffer_u8, global.NewObjectId++);
			send_data_to_all_players(server_buffer);
		break;
		case entityType.point:
			var point = instance_create_depth(xx, yy, depth, obj_point_server);
			point.objectId = global.NewObjectId;
			
			ds_map_add(global.Points, global.NewObjectId++, point);
			
			server_buffer = con_server.server_buffer;
			buffer_seek(server_buffer, buffer_seek_start, 0);
			buffer_write(server_buffer, buffer_u8, network.spawned_entity);
			buffer_write(server_buffer, buffer_u8, entityType.point);
			buffer_write(server_buffer, buffer_u16, xx);
			buffer_write(server_buffer, buffer_u16, yy);
			buffer_write(server_buffer, buffer_u8, point.objectId);
			send_data_to_all_players(server_buffer);
		break;
		case entityType.motivation:
			var motivation = argument[3];
			
			server_buffer = con_server.server_buffer;
			buffer_seek(server_buffer, buffer_seek_start, 0);
			buffer_write(server_buffer, buffer_u8, network.spawned_entity);
			buffer_write(server_buffer, buffer_u8, entityType.motivation);
			buffer_write(server_buffer, buffer_u16, xx);
			buffer_write(server_buffer, buffer_u16, yy);
			buffer_write(server_buffer, buffer_u16, motivation.objectId);
			buffer_write(server_buffer, buffer_u8, motivation.playerId);
			buffer_write(server_buffer, buffer_u16, motivation.target.objectId);
			buffer_write(server_buffer, buffer_u16, motivation.h_offset);
			buffer_write(server_buffer, buffer_u8, motivation.image_xscale);
			buffer_write(server_buffer, buffer_u8, motivation.image_yscale);
			send_data_to_all_players(server_buffer);			
		break;
	}
}