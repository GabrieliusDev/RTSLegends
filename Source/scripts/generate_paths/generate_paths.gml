// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function generate_paths(playerCount = argument0){
	
	pathCoords = ds_list_create();
	//Player 1
	ds_list_add(pathCoords, { isPoint: true, path: paths.top, playerId: 0,index: 0, xx: 1050, yy: 200});
	ds_list_add(pathCoords, { isPoint: true, path: paths.top, playerId: 0,index: 1, xx: 2300, yy: 200});
	ds_list_add(pathCoords, { isPoint: false, path: paths.top, playerId: 0,index: 2, xx: 3200, yy: 500});
	ds_list_add(pathCoords, { isPoint: true, path: paths.bottom, playerId: 0,index: 0, xx: 1050, yy: 800});
	ds_list_add(pathCoords, { isPoint: true, path: paths.bottom, playerId: 0,index: 1, xx: 2300, yy: 800});
	ds_list_add(pathCoords, { isPoint: false, path: paths.bottom, playerId: 0,index: 2, xx: 3200, yy: 500});
	//Player 2
	ds_list_add(pathCoords, { isPoint: true, path: paths.top, playerId: 1,index: 0, xx: 2300, yy: 200});
	ds_list_add(pathCoords, { isPoint: true, path: paths.top, playerId: 1,index: 1, xx: 1050, yy: 200});
	ds_list_add(pathCoords, { isPoint: false, path: paths.top, playerId: 1,index: 2, xx: 300, yy: 500});
	ds_list_add(pathCoords, { isPoint: true, path: paths.bottom, playerId: 1,index: 0, xx: 2300, yy: 800});
	ds_list_add(pathCoords, { isPoint: true, path: paths.bottom, playerId: 1,index: 1, xx: 1050, yy: 800});
	ds_list_add(pathCoords, { isPoint: false, path: paths.bottom, playerId: 1,index: 2, xx: 300, yy: 500});
	
	for(var i = 0; i < ds_list_size(pathCoords); i++)
	{		
		var pathCoord = ds_list_find_value(pathCoords, i);
		if(playerCount - 1 >= pathCoord.playerId)
		{
			if(pathCoord.playerId == 0 && pathCoord.isPoint)
			{
				instance_create_depth(pathCoord.xx, pathCoord.yy, depth, obj_point_server);
			}
			
			spawn_entity(entityType.path_point, pathCoord.xx, pathCoord.yy, pathCoord.index, pathCoord.path, pathCoord.playerId);
		}
	}
}