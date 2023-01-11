/// @description Updating data to all players
// You can write your code in this editor
if(objectId != undefined)
{
	var hasTarget = false;
	var target = undefined;
	if(attacking != undefined)
	{
		hasTarget = true;
		target = attacking.objectId;
	}

	send_minion_data(objectId, x, y, moveX, moveY, currentIndex, hp, hasTarget, target, inCombat);	
}
alarm_set(0, room_speed/4);