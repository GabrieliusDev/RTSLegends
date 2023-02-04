// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function create_motivation_from_client(motivationTarget = argument0, playerId = argument1){
	
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
		motivationTargetEntity = motivationTarget;
		var motivation = instance_create_depth(motivationTarget.x, motivationTarget.y-motivationTarget.motivation_hoffset, -yy, obj_motivation);
		var objectId = global.NewObjectId++;
		motivation.objectId = objectId;
		motivation.playerId = playerId;
		ds_map_add(global.Motivations, objectId, motivation);
		with(motivation)
		{
			set_motivation_type(other.motivationTargetEntity, playerId);	
			target = other.motivationTargetEntity;
			h_offset = other.motivationTargetEntity.motivation_hoffset;
			image_xscale = other.motivationTargetEntity.motivation_scale;
			image_yscale = other.motivationTargetEntity.motivation_scale; 
		}
		
		spawn_entity(entityType.motivation, motivation.x, motivation.y, motivation);
	}
}