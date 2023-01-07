function start_game(debug = argument0)
{
	xx = 6;
	yy = 4;
	
	global.Points = ds_map_create();
	global.Pcount = 0;

	x_offset = 100;
	y_offset = 100;
	
	playerCount = ds_list_size(con_server.socket_list) + 1;
	
	//Player spawn coordinates
	playerCoords = ds_list_create();
	ds_list_add(playerCoords, { xx: x_offset, yy: y_offset });
	ds_list_add(playerCoords, { xx: room_width - x_offset, yy: room_height - y_offset });
	ds_list_add(playerCoords, { xx: room_width - x_offset, yy: y_offset });
	ds_list_add(playerCoords, { xx: x_offset, yy: room_height - y_offset });
	
	for(var i = 0; i < playerCount; i++)
	{
		var playerCoord = ds_list_find_value(playerCoords, i);
		
		if(i+1 != playerCount)
		{
			send_camera_position(i+1, playerCoord.xx, playerCoord.yy);
		}
	}	
	
	host_pos = ds_list_find_value(other.playerCoords, other.playerCount-1);
	with(obj_player)
	{
		playerId = other.playerCount;	
		isHost = true;		
	}
	
	set_camera_pos_to_start(host_pos.xx, host_pos.yy);
	
	if(!debug)
	{	
		generate_paths(playerCount);
	}else{
		generate_paths(2);
	}
	
	hqCoords = ds_list_create();
	ds_list_add(hqCoords, { xx: 300, yy: 500 });
	ds_list_add(hqCoords, { xx: 3200, yy: 500 });
	
	if(!debug)
	{
		for(var i = 0; i < playerCount; i++)
		{
			var coords = ds_list_find_value(hqCoords, i);
			spawn_entity(entityType.headQuarters, coords.xx, coords.yy, i);
		}
	}else{
		for(var i = 0; i < 2; i++)
		{
			var coords = ds_list_find_value(hqCoords, i);
			spawn_entity(entityType.headQuarters, coords.xx, coords.yy, i);
		}
	}
	
	//update_all_player_stats();
	
	global.game_started = true;
}