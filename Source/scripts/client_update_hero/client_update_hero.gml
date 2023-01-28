// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function client_update_hero(type = argument0, time = argument1, objectId = argument2){
	calculate_ping(time);
	
	switch(type)
	{
		case entityType.hero_warrior:
			var warrior = ds_map_find_value(global.CombatEntities, objectId);
			var xx = argument[3];
			var yy = argument[4];
			InterpolatePosition(warrior, warrior.last_pos_x, warrior.last_pos_y, xx, yy, (current_time-global.TimeOnStart)/time);

			warrior.moveX = argument[5]; 
			warrior.moveY = argument[6];
			warrior.hp = argument[7];
			warrior.inCombat = argument[8];
			warrior.morale = argument[9];
			warrior.boredom = argument[10];
			warrior.motivated = argument[11];
			
			var guarding = argument[12];
			if(guarding != 0)
			{
				warrior.guarding = ds_map_find_value(global.Points, guarding);
			}else
			{
				warrior.guarding = undefined;
			}
			
			var attacking = argument[13];
			if(attacking != 0)
			{
				warrior.attacking = ds_map_find_value(global.CombatEntities, attacking);
			}else
			{
				warrior.attacking = undefined;	
			}
			
			var pointToCapture = argument[14];
			if(pointToCapture != 0)
			{
				warrior.pointToCapture = ds_map_find_value(global.Points, pointToCapture)
;			}else
			{
				warrior.pointToCapture = undefined;
			}
		break;
	}
}