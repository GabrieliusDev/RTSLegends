// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function hero_warrior_event_create(){	
	//essentials
	objectId = undefined;
	playerId = undefined;
	eType = entityType.hero_warrior;
	displayOnMap = true;
	
	motivation_hoffset = 40;
	motivation_scale = 1;
	
	//Brain
	//Morale
	morale = 0
	moraleThreshold = 30;
	maxMorale = 100;
	
	moraleChangeOnMinionAttacks = 1;
	
	//Boredom
	boredom = 0;
	boredomThreshold = 70;
	maxboredom = 100;
	boredomChangeAmount = 12;
	
	boredomChangeOnMinionAttacks = 5;
	
	//in ms
	timeAfterStartingToGetBored = 3 * 1000;
	lastActionHappenedAt = current_time;
	
	
	//movement
	last_pos_x = x;
	last_pos_y = y;
	moveX = x;
	moveY = y;
	moveSpeed = 3;
	
	guarding = undefined;
	attacking = undefined;
	pointToCapture = undefined;
	motivated = false;
	
	//combat
	visionRadius = 300;
	combatRadius = 30;
	
	maxHp = 300;
	hp = maxHp;
	damage = 30;
	inCombat = false;
	
	attacksIntervals = 1 * room_speed;
	
	//hero updating events
	speedOfStatusUpdates = 5 * room_speed;
	speedOfCombatLogicUpdates = 1 * room_speed;
	
	if(obj_player.isHost)
	{
		alarm[0] = speedOfStatusUpdates;
		alarm[1] = speedOfCombatLogicUpdates;
	}
}