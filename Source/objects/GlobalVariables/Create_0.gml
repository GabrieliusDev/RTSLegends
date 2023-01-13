#region Enums
	enum gui_button_types
	{
		outpost,
		barracks,
		tower,
		gatherer,
		nothing
	}

	enum paths
	{
		top,
		bottom
	}

	enum network
	{
		#region Players
			player_connect,
		#endregion
		
		#region Minions
			minion_data_update,
			minion_target_update,
			minion_attack_data,
		
			spawned_minion,
		#endregion
	
		#region Entities
			spawned_entity,
			entity_kill,
			entity_update,
			entity_pos_update,
		#endregion
	
		#region Misc
			camera_pos,
			not_implemented
		#endregion
	}

	enum entityType
	{
		//heroes
		hero_warrior,
		hero_last_index,
		
		minion,
		path_point,
		point,
		headQuarters
	}
#endregion

#region Variables
	global.Minions = ds_map_create();
	global.CombatEntities = ds_map_create();
	global.Points = ds_map_create();
	global.Heroes = ds_map_create();

	global.NewMinionsId = 0;
	global.NewPointId = 0;

	global.TimeOnStart = current_time;
	global.Ping = 0;

	global.DebugOn = false;
#endregion

#region Coordinates
	global.HqCoords = ds_list_create();
		ds_list_add(global.HqCoords, { xx: 200, yy: 1200 });
		ds_list_add(global.HqCoords, { xx: 4200, yy: 1200 });
#endregion