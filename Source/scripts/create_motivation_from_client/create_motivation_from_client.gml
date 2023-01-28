// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function create_motivation_from_client(motivationTarget = argument0, playerId = argument1){
	motivationTargetEntity = motivationTarget;
	var motivation = instance_create_depth(motivationTarget.x, motivationTarget.y-motivationTarget.motivation_hoffset, -yy, obj_motivation);
	var objectId = global.NewMotivationId++;
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
}