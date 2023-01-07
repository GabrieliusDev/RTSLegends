// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function build(player = argument0, building_type = argument1){
	if(building_type == types.gatherer && instance_exists(obj_e_mineral))
	{
		with(obj_e_mineral)
		{
			if(point_distance(mouse_x, mouse_y, x, y) <= sprite_width/2)
			{
				instance_destroy();
				return;
			}
		}
	}
	
	if(player.isHost)
	{
		global.energy -= ds_map_find_value(global.prices, building_type);
		var point = instance_create_depth(mouse_x, mouse_y, depth, obj_point_server);		
		point.pointId = global.Pcount++;
		ds_map_add(global.Points, point.pointId, point);	
		point.owner = player.playerId;
		point.p_type = building_type;		
		point_create(point);
	}else
	{
		send_build_data(mouse_x, mouse_y, building_type, player.playerId);
	}	
}