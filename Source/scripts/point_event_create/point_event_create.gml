// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function point_event_create(){
	objectId = undefined;
	eType = entityType.point;
	displayOnMap = true;
	
	motivation_hoffset = 110;
	motivation_scale = 1.5;
	
	lastTimeTrigered = current_time;

	takenBy = undefined;
	takingFor = 0;
	takenAmount = 0;
	maxTakenAmount = 100;
	capturingAmount = 5;
	captureZoneRadius = 200;

	player1_entity_count = 0;
	player2_entity_count = 0;
	capturing_playerId = undefined;

	flagHeight = 16;
	poleAvailableHeight = 73;

	if(obj_player.isHost)
		alarm[0] = room_speed;
}