// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function point_capture_event(){
	player1_entity_count = 0;
	player2_entity_count = 0;

	for (var k = ds_map_find_first(global.CombatEntities); !is_undefined(k); k = ds_map_find_next(global.CombatEntities, k)) 
	{
		var entity = global.CombatEntities[? k];
	
		if(entity.eType == entityType.minion)
		{
			var dist = distance_to_object(entity);
			if(dist <= captureZoneRadius)
			{
				switch(entity.playerId)
				{
					case 1:
						player1_entity_count++;
					break;
					case 2:
						player2_entity_count++;
					break;
				}
			}
		}
	}

	capturing_playerId = 1;
	if(player2_entity_count == player1_entity_count)
		capturing_playerId = undefined;
	else if(player2_entity_count > player1_entity_count)
		capturing_playerId = 2;

	if(capturing_playerId != undefined)
	{
		if(takingFor == capturing_playerId)
		{
			if(takenAmount < maxTakenAmount)
			{
				takenAmount += capturingAmount;
				lastTimeTrigered = current_time;
				update_entity(self);
			}
		}else
		{
			if(takenAmount > 0)
			{
				takenAmount -= capturingAmount;	
				lastTimeTrigered = current_time;
				update_entity(self);
			}else
			{
				takingFor = capturing_playerId;	
				update_entity(self);
			}
		}
	}
}