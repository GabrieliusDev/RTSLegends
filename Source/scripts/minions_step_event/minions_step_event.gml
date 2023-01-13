// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function minions_step_event(){
	if(path != undefined && playerId != undefined && attacking == undefined)
	{
		#region Finding what can capture nearby
			if(obj_player.isHost)
				with(obj_point_server)
				{
					if(distance_to_point(other.x, other.y) < captureZoneRadius + 100 && (takenAmount < maxTakenAmount || takingFor != other.playerId))
					{
						other.capturing = self;
						break;
					}
				}
			else
				with(obj_point)
				{
					if(distance_to_point(other.x, other.y) < captureZoneRadius + 100 && (takenAmount < maxTakenAmount || takingFor != other.playerId))
					{
						other.capturing = self;
						break;
					}
				}
		#endregion
		
		#region Finding next move on path
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
		#endregion

		#region Deciding next move step
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
		#endregion
	}

	#region Combat logic
	if(attacking == undefined)
	{
		find_nearest_enemy();
	}else
	{
		var dist = distance_to_point(attacking.x, attacking.y);
		if(dist > focusRadius)
		{
			attacking = undefined;
			if(obj_player.isHost)
			{
				send_minion_target(objectId, inCombat, false, undefined);
			}
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
					if(obj_player.isHost)
					{
						alarm[1] = 1;	
					}
					inCombat = true;
				}
			}
		}
		if(current_time - lastInteractionWithTargetAt >= 1500 && x == last_pos_x && y == last_pos_y)
			find_nearest_enemy();
	}
	#endregion
}