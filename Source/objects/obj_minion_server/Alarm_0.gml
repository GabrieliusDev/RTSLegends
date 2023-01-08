/// @description Updating data to all players
// You can write your code in this editor
if(objectId != undefined)
{
	if(attacking != undefined)
	send_minion_data(objectId, x, y, moveX, moveY, currentIndex, hp, attacking.objectId, inCombat);
}
alarm_set(0, room_speed);