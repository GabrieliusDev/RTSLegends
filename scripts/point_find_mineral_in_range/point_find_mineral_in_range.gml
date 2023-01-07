// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function point_find_mineral_in_range(){
	var minerals_in_range = false;
	
	if(instance_exists(obj_e_mineral))
	{			
		with(obj_e_mineral)
		{
			if(point_distance(mouse_x, mouse_y, x, y) <= sprite_width/2)	
			{
				minerals_in_range = true;
				return;
			}	
		}
	}
	
	return minerals_in_range;
}