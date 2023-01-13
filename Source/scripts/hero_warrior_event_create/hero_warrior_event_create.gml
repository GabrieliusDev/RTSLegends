// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function hero_warrior_event_create(){	
	//essentials
	playerId = undefined;
	eType = entityType.hero_warrior;
	displayOnMap = true;
	
	//brain
	morale = 0
	moraleThreshold = 30;
	maxMorale = 100;

	boredom = 0;
	boredomThreshold = 70;
	maxboredom = 100;
	
	
	//movement
	moveX = x;
	moveY = y;
	
	target = undefined;
	pointToCapture = undefined;
	motivated = false;
	
	visionRadius = 300;
	combatRadius = 30;
}