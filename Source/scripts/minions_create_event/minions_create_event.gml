// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function minions_create_event(){
	objectId = undefined;
	displayOnMap = true;
	
	motivation_hoffset = 40;
	motivation_scale = 1;

	currentIndex = -1;
	path = undefined;
	playerId = undefined;
	eType = entityType.minion;
	moveCompleteDistance = 60;

	moveX = x;
	moveY = y;
	capturing = undefined;	
	moveSpeed = 2;

	last_pos_x = x;
	last_pos_y = y;
	show_debug = false;

	//stats
	maxHp = 150;
	hp = maxHp;
	

	//Combat
	attacking = undefined;
	lastInteractionWithTargetAt = 0;
	inCombat = false;
	focusRadius = 150;
	combatRadius = 30;
	hitIntervals = room_speed*1;

	//info on server
	if(obj_player.isHost)
	{
		#region Stats
			damage = 10;			
		#endregion
		
		alarm_set(0, room_speed);
	}	
}