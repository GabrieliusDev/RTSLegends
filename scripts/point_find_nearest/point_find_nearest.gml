// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function point_find_nearest(player = argument0){
	distance = point_distance(x, y, mouse_x, mouse_y);
	if(owner == player.playerId)
	{
		if(player.closest_point == noone)
		{
			player.closest_point = self;	
			player.distance = distance;
		
		}else if(distance < player.distance)
		{
			player.closest_point = self;
			player.distance = distance;
		}				
	}else
	{
		if(player.closest_enemy_point == noone)
		{
			player.closest_enemy_point = self;	
			player.distance_to_enemy = distance;
		
		}else if(distance < player.distance_to_enemy)
		{
			player.closest_enemy_point = self;
			player.distance_to_enemy = distance;
		}
	}
}