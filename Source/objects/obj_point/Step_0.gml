/// @description Insert description here
// You can write your code in this editor

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
				case 0:
					player1_entity_count++;
				break;
				case 1:
					player2_entity_count++;
				break;
			}
		}
	}
}

capturing_playerId = 0;
if(player2_entity_count == player1_entity_count)
	capturing_playerId = undefined;
else if(player2_entity_count > player1_entity_count)
	capturing_playerId = 1;