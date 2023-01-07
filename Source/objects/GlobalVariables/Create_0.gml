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
	player_connect,
	
	spawned_minion,
	spawned_entity,
	entity_kill,
	entity_pos_update,
	
	camera_pos,
	not_implemented
}

enum entityType
{
	minion,
	path_point,
	headQuarters
}
#endregion

#region Variables
global.Minions = ds_map_create();
global.CombatEntities = ds_map_create();

global.NewMinionsId = 0;
#endregion