/// @description Insert description here
// You can write your code in this editor

if(capturing_playerId != undefined)
{
	if(takingFor == capturing_playerId)
	{
		if(takenAmount < maxTakenAmount)
		{
			takenAmount += capturingAmount;
		}
	}else
	{
		if(takenAmount > 0)
		{
			takenAmount -= capturingAmount;	
		}else
		{
			takingFor = capturing_playerId;	
		}
	}
}

alarm[0] = room_speed;