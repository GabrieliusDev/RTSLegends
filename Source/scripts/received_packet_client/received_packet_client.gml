buffer = argument0;
if(buffer != undefined){
	msgId = buffer_read(buffer, buffer_u8);

	switch(msgId)
	{
		#region player_connect
		case network.player_connect: // Initial coonection
			var playerId = buffer_read(buffer, buffer_u8);			
			var titleBox = instance_create_depth(room_width/2, room_height/2, depth, obj_title_box);
			titleBox.title = "You Are Player"+string(playerId);
			obj_player.playerId = playerId;
			global.game_started = true;
			
			switch(playerId)
			{
				case 1:
					titleBox.text_color = make_color_rgb(236,179,101);	
					break;
				case 2:
					titleBox.text_color = make_color_rgb(52,190,130);
					break;
			}
			break;
			#endregion
		#region player_set_camera
		case network.camera_pos:
			var pos_x = buffer_read(buffer, buffer_u16);
			var pos_y = buffer_read(buffer, buffer_u16);
			set_camera_pos_to_start(pos_x, pos_y);
		break;
		#endregion
		#region spawned_minion
		case network.spawned_minion:
			var pos_x = buffer_read(buffer, buffer_u16);
			var pos_y = buffer_read(buffer, buffer_u16);
			var path = buffer_read(buffer, buffer_u8);
			var playerId = buffer_read(buffer, buffer_u8);
			var objectId = buffer_read(buffer, buffer_u16);
			client_spawn_minion(pos_x, pos_y, path, playerId, objectId);
		break;
		#endregion
		#region spawned_entity
		case network.spawned_entity:
			var type = buffer_read(buffer, buffer_u8);			
			var pos_x = buffer_read(buffer, buffer_u16);
			var pos_y = buffer_read(buffer, buffer_u16);
			
			switch(type)
			{
				case entityType.path_point:
					var index = buffer_read(buffer, buffer_u8);	
					var path = buffer_read(buffer, buffer_u8);	
					var playerId = buffer_read(buffer, buffer_u8);	
					client_spawn_entity(type, pos_x, pos_y, index, path, playerId);
				break;			
				case entityType.headQuarters:
					var playerId = buffer_read(buffer, buffer_u8);	
					client_spawn_entity(type, pos_x, pos_y, playerId);
				break;
			}
			
		break;
		#endregion
		#region entity pos update
		case network.entity_pos_update:
			var type = buffer_read(buffer, buffer_u8);			
			var pos_x = buffer_read(buffer, buffer_u16);
			var pos_y = buffer_read(buffer, buffer_u16);
			var objectId = buffer_read(buffer, buffer_u16);
			client_update_entity_pos(type, pos_x, pos_y, objectId);
		break;
		#endregion
	}
}