// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function client_update_minions_target(objectId = argument0, incombat = argument1, hasTarget = argument2, attackingId = argument3){
	var minion = ds_map_find_value(global.Minions, objectId);
	minion.incombat = incombat;
	
	if(hasTarget)
	{
		var attacking = ds_map_find_value(global.Minions, attackingId);
		minion.attacking = attacking; 
	}else
	{
		minion.attacking = undefined;	
	}	
}