// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function find_nearest_point(pointToIgnore = argument0, findOwn = argument1, findOthers){
	var closest = undefined;
	var dist = room_width;
	for (var k = ds_map_find_first(global.Points); !is_undefined(k); k = ds_map_find_next(global.Points, k))
	{
		var entity = global.Points[? k];
		if(pointToIgnore != undefined)
		{
			if(entity != pointToIgnore)
			{
				if(findOwn)
				{
					if(closest == undefined)
					{
						closest = entity;
						dist = distance_to_object(entity);
					}else
					{
						var tempDist = distance_to_object(entity);
						if(tempDist < dist)
						{
							closest = entity;
							dist = tempDist;
						}
					}
				}
				else if(findOthers){
				
				}
				else 
				{
				
				}
			}
		}else
		{
			if(findOwn)
			{
				if(entity.takingFor == playerId)
				{
					if(closest == undefined)
					{
						closest = entity;
						dist = distance_to_object(entity);
					}else
					{
						var tempDist = distance_to_object(entity);
						if(tempDist < dist)
						{
							closest = entity;
							dist = tempDist;
						}
					}
				}
			}
			else if(findOthers){
				
			}
			else 
			{
				
			}
		}
	}
	
	return closest;
}