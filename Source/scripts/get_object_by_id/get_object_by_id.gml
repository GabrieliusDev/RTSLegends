// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function get_object_by_id(Id = argument0){
	entity = undefined;
	objectId = Id;
	with(all)
	{
		if(variable_instance_exists(id, "objectId"))
		{
			if(objectId == other.objectId)	
			{
				other.entity = self;
				break;
			}
		}
	}
	return entity;
}