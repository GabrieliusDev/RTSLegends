// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function minions_step_event(){
	if(path != undefined && playerId != undefined && attacking == undefined)
	{
		with(obj_point_server)
		{
			if(distance_to_point(other.x, other.y) < captureZoneRadius + 100 && (takenAmount < maxTakenAmount || takingFor != other.playerId))
			{
				other.capturing = self;
				break;
			}
		}
		if(distance_to_point(moveX, moveY) < moveCompleteDistance && !capturing)
		{
			with(obj_path_point)
			{
				if(index == other.currentIndex + 1 && path == other.path && playerId == other.playerId)
				{
					other.currentIndex = other.currentIndex+1;
					other.moveX = x;
					other.moveY = y;
					break;
				}	
			}
		}

		if(attacking == undefined)
		{	
			if(capturing != undefined)
			{
				mp_potential_step(capturing.x, capturing.y, moveSpeed, false);
			
				if(capturing.takingFor == playerId && capturing.takenAmount == capturing.maxTakenAmount)
					capturing = undefined;		
			}else
			{
				mp_potential_step(moveX, moveY, moveSpeed, false);
			}		
		}
	}

	if(attacking == undefined)
	{
		find_nearest_enemy();
	}else{
		var dist = distance_to_point(attacking.x, attacking.y);
		if(dist > focusRadius)
		{
			attacking = undefined;
			send_minion_target(objectId, inCombat, false, undefined);
		}else
		{
			if(dist > combatRadius)
			{
				mp_potential_step(attacking.x, attacking.y, moveSpeed, false);
				inCombat = false;
			}else
			{
				if(!inCombat)
				{
					alarm[1] = 1;	
					inCombat = true;
				}
			}
		}
	}
}