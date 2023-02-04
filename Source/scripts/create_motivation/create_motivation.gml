// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function create_motivation(xx = argument0, yy = argument1, playerId = argument2){
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
					var motivation = instance_create_depth(motivationTarget.x, motivationTarget.y-motivationTarget.motivation_hoffset, -yy, obj_motivation);
					var objectId = global.NewMotivationId++;
					motivation.objectId = objectId;
					motivation.playerId = playerId;
					ds_map_add(global.Motivations, objectId, motivation);
					with(motivation)
					{
						set_motivation_type(other.motivationTarget, playerId);	
						target = other.motivationTarget;
						h_offset = other.motivationTarget.motivation_hoffset;
						image_xscale = other.motivationTarget.motivation_scale;
						image_yscale = other.motivationTarget.motivation_scale;
					}
					spawn_entity(entityType.motivation, motivation.x, motivation.y, motivation);
				}
			}
		}
	}
}