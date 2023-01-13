// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function client_spawn_entity(type = argument0, xx = argument1, yy = argument2){
	switch(type)
	{
		#region Path_point
		case entityType.path_point:
			var pathPoint = instance_create_depth(xx, yy, depth, obj_path_point);
			pathPoint.index = argument[3];
			pathPoint.path = argument[4];
			pathPoint.playerId = argument[5];
		break;
		#endregion
		#region HQ
		case entityType.headQuarters:
			var hq = instance_create_depth(xx, yy, depth, obj_HQ);
			hq.playerId = argument[3];
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
		break;
		#endregion
		#region Point
		case entityType.point:
			var point = instance_create_depth(xx, yy, depth, obj_point);
			point.objectId = argument[3];
			
			ds_map_add(global.Points, point.objectId, point);
		break;
		#endregion
	}
}