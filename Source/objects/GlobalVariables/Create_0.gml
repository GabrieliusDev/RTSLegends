#region Enums
	enum gui_button_types
	{
		outpost,
		barracks,
		tower,
		gatherer,
		nothing
	}
	
	enum motivationType
	{
		m_capture,
		m_defend,
		m_attack
	}
	
	enum soundEffect
	{
		fx_attack_sword	
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
		
		#region Heroes
			spawned_hero,
			updated_hero,
		#endregion
	
		#region Motivation
			spawned_motivation,		
		#endregion
	
		#region Entities
			spawned_entity,
			entity_kill,
			entity_update,
			entity_pos_update,
		#endregion
		
		#region Client server commands
			ask_to_spawn_motivation,
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
		
		motivation,
		minion,
		path_point,
		point,
		headQuarters
	}
#endregion

#region Variables
	global.Minions = ds_map_create();
	global.CombatEntities = ds_map_create();
	global.Heroes = ds_map_create();
	
	global.Motivations = ds_map_create();
	global.OwnMotivations = ds_map_create();
	
	global.Points = ds_map_create();			

	global.NewCombatEntityId = 1;
	global.NewPointId = 1;
	global.NewMotivationId = 1;

	global.TimeOnStart = current_time;
	global.Ping = 0;

	global.DebugOn = false;
	global.BuildVersion = "V0.1";
#endregion

#region Coordinates
	global.HqCoords = ds_list_create();
		ds_list_add(global.HqCoords, { xx: 200, yy: 1200 });
		ds_list_add(global.HqCoords, { xx: 4200, yy: 1200 });
#endregion