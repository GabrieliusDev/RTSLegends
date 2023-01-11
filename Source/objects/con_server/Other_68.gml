type_event = ds_map_find_value(async_load, "type");

switch(type_event)
{
	case network_type_connect:
		socket = ds_map_find_value(async_load, "socket");
		ds_list_add(socket_list, socket);	
		
		var _player = instance_create_depth(playerSpawn_x, playerSpawn_y, depth, obj_player_server);
		_player.playerId = socket;
		ds_map_add(socket_to_instanceId, socket, _player);
		global.TimeOnStart = current_time;
		
		buffer_seek(server_buffer, buffer_seek_start, 0);
		buffer_write(server_buffer, buffer_u8, network.player_connect);			
		buffer_write(server_buffer, buffer_u8, string(socket));
		buffer_write(server_buffer, buffer_u32, global.TimeOnStart);
		network_send_packet(socket, server_buffer, buffer_tell(server_buffer));
		
		if(ds_list_size(socket_list) == 1)
		{
			start_game();
		}
		break;
		
	case network_type_disconnect:
		socket = ds_map_find_value(async_load, "socket");
		ds_list_delete(socket_list, ds_list_find_index(socket_list, socket));
		
		with(ds_map_find_value(socket_to_instanceId, socket))
		{
			ds_map_delete(other.socket_to_instanceId, other.socket);
			instance_destroy();
		}
		
		break;
		
	case network_type_data:		
		buffer = ds_map_find_value(async_load, "buffer");
		socket = ds_map_find_value(async_load, "id");
		buffer_seek(buffer, buffer_seek_start, 0);
		received_packet_server(buffer, socket);
		break;
}