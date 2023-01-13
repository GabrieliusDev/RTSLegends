buffer = argument0;
if(buffer != undefined){
	msgId = buffer_read(buffer, buffer_u8);

	switch(msgId)
	{
		#region player_connect
		case network.player_connect: // Initial coonection
			var playerId = buffer_read(buffer, buffer_u8);	
			var timeOnStart = buffer_read(buffer, buffer_u8);		
			var titleBox = instance_create_depth(room_width/2, room_height/2, depth, obj_title_box);
			titleBox.title = "You Are Player"+string(playerId);
			obj_player.playerId = playerId;
			global.game_started = true;
			global.TimeOnStart = current_time;
			
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
				case entityType.point:
					var objectId = buffer_read(buffer, buffer_u8);
					client_spawn_entity(type, pos_x, pos_y, objectId);
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
		#region entity kill
		case network.entity_kill:		
			var objectId = buffer_read(buffer, buffer_u16);	
			client_kill_entity(objectId);
		break;
		#endregion	
		#region enitity update
		case network.entity_update:		
			var type = buffer_read(buffer, buffer_u8);	
			switch(type)
			{
				case entityType.point:
					var objectId = buffer_read(buffer, buffer_u8);	
					var takenAmount = buffer_read(buffer, buffer_u8);
					var takingFor = buffer_read(buffer, buffer_u8);	
					var lastTimeTriggered = buffer_read(buffer, buffer_u32);	
					client_update_entity(type, objectId, takenAmount, takingFor, lastTimeTriggered);
				break;
			}
		break;
		#endregion
		#region minion data update
		case network.minion_data_update:
			var time = buffer_read(buffer, buffer_u32);		
			var objectId = buffer_read(buffer, buffer_u16);	
			var minion = ds_map_find_value(global.Minions, objectId);
			
			var xx = buffer_read(buffer, buffer_u16);
			var yy = buffer_read(buffer, buffer_u16);
									
			calculate_ping(time);
			InterpolatePosition(minion, minion.last_pos_x, minion.last_pos_y, xx, yy, (current_time-global.TimeOnStart)/time);
			minion.last_pos_x = xx;
			minion.last_pos_y = yy;
			minion.moveX = buffer_read(buffer, buffer_u16);
			minion.moveY = buffer_read(buffer, buffer_u16);
			minion.currentIndex = buffer_read(buffer, buffer_u8);
			minion.hp = buffer_read(buffer, buffer_u8);
			minion.incombat = buffer_read(buffer, buffer_bool);
			var isCapturing = buffer_read(buffer, buffer_bool);
			if(isCapturing)
			{
				var point = ds_map_find_value(global.Points, buffer_read(buffer, buffer_u8));
				minion.capturing = point;
			}else
			{
				minion.capturing = undefined;	
			}
		break;
		#endregion		
		#region minion target update
		case network.minion_target_update:
			var objectId = buffer_read(buffer, buffer_u16);			
			var incombat = buffer_read(buffer, buffer_bool);
			var hasTarget = buffer_read(buffer, buffer_bool);
			var attackingId = buffer_read(buffer, buffer_u16);
			client_update_minions_target(objectId, incombat, hasTarget, attackingId);
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
	}
}