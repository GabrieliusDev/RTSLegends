// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function client_create_motivation(xx = argument0, yy = argument1, playerId = argument2){
	if(!place_empty(xx, yy))
	{	
		motivationTarget = instance_place(xx, yy, all);
		if(motivationTarget != undefined)
		{
			if(object_get_name(motivationTarget.object_index) != "obj_motivation" &&
			   object_get_name(motivationTarget.object_index) != "obj_path_point")
			{
				var targetHasMotivation = false;
				for (var k = ds_map_find_first(global.Motivations); !is_undefined(k); k = ds_map_find_next(global.Motivations, k))
				{
					var cEntity = global.Motivations[? k];
		
					if(cEntity.target == motivationTarget && cEntity.playerId == playerId)
					{
						targetHasMotivation = true;						
					}
				}
			
				if(!targetHasMotivation)
				{
					client_buffer = con_client.client_buffer;
					buffer_seek(client_buffer, buffer_seek_start, 0);
					buffer_write(client_buffer, buffer_u8, network.ask_to_spawn_motivation);
					buffer_write(client_buffer, buffer_u16, motivationTarget.objectId);
					buffer_write(client_buffer, buffer_u8, playerId);
					network_send_packet(con_client.client, client_buffer, buffer_tell(client_buffer));
				}
			}
		}
	}
}