// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function client_update_minion(objectId = argument0, xx = argument1, yy = argument2, moveX = argument3, moveY = argument4, currentIndex = argument5, hp = argument6, attackingId = argument7, incombat = argument8){
	var minion = ds_map_find_value(global.Minions, objectId);
	minion.x = xx;
	minion.y = yy;
	minion.moveX = moveX; 
	minion.moveY = moveY; 
	minion.currentIndex = currentIndex;
	minion.hp = hp;
	
	var attacking = ds_map_find_value(global.Minions, attackingId);
	minion.attacking = attacking; 
	minion.incombat = incombat;
}