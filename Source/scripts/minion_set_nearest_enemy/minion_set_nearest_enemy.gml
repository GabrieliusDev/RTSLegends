// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function minion_set_nearest_enemy(){
	var enemy = find_nearest_enemy();
	var nearestDist = distance_to_object(enemy);
	if(nearestDist <= focusRadius)
	{
		attacking = enemy;
		inCombat = false;
		lastInteractionWithTargetAt = current_time;
		if(obj_player.isHost)
			send_minion_target(objectId, inCombat, true, attacking.objectId);
	}
}