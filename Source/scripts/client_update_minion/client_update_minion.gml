// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function client_update_minion(time = argument0, objectId = argument1, xx = argument2, yy = argument3, moveX = argument4, moveY = argument5, currentIndex = argument6, hp = argument7, incombat = argument8){
	var minion = ds_map_find_value(global.Minions, objectId);	
	InterpolatePosition(minion, minion.last_pos_x, minion.last_pos_y, xx, yy, (current_time-global.TimeOnStart)/ time);
	minion.last_pos_x = xx;
	minion.last_pos_y = yy;
	minion.moveX = moveX; 
	minion.moveY = moveY; 
	minion.currentIndex = currentIndex;
	minion.hp = hp;
	minion.incombat = incombat;
	
	//if(hasTarget)
	//{
	//	var attacking = ds_map_find_value(global.Minions, attackingId);
	//	minion.attacking = attacking; 
	//}else
	//{
	//	minion.attacking = undefined;	
	//}	
}