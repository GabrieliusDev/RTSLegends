function start_game(debug = argument0)
{
	xx = 6;
	yy = 4;
	
	global.Points = ds_map_create();
	global.Pcount = 0;

	x_offset = 100;
	y_offset = 100;
	
	playerCount = ds_list_size(con_server.socket_list) + 1;	
	
	with(obj_player)
	{
		var playerCoord = ds_list_find_value(global.HqCoords, other.playerCount-1);
		set_camera_pos_to_start(playerCoord.xx, playerCoord.yy);
		playerId = other.playerCount;	
		isHost = true;	
	}
	
	#region Generating Paths
		if(!debug)
		{	
			generate_paths(playerCount);
		}else{
			generate_paths(2);
		}
	#endregion
	
	#region Spawning HQs and setting up camera
	
		if(!debug)
		{
			for(var i = 0; i < playerCount; i++)
			{
				var coords = ds_list_find_value(global.HqCoords, i);
				spawn_entity(entityType.headQuarters, coords.xx, coords.yy, i+1);
			}
		}else{
			for(var i = 0; i < 2; i++)
			{
				var coords = ds_list_find_value(global.HqCoords, i);
				spawn_entity(entityType.headQuarters, coords.xx, coords.yy, i+1);
			}
		}
	
		for(var i = 0; i < playerCount; i++)
		{
			var playerCoord = ds_list_find_value(global.HqCoords, i);
		
			if(i+1 != playerCount)
			{
				send_camera_position(i+1, playerCoord.xx, playerCoord.yy);
			}
		}
			
	
	#endregion
	
	global.game_started = true;
}