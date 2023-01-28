// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function hero_warrior_event_step(){
	if(guarding != undefined)
	{
		if(attacking != undefined)
		{
			var distToTarget = distance_to_object(attacking);
			if(distToTarget > visionRadius)
			{
				attacking = undefined;	
			}
			else if(distToTarget > combatRadius)
			{
				inCombat = false;
				mp_potential_step(attacking.x, attacking.y, moveSpeed, false);	
			}else if(!inCombat)
			{
				if(obj_player.isHost)
					alarm[2] = attacksIntervals;
				inCombat = true;
			}
		}else
		{
			mp_potential_step(guarding.x, guarding.y, moveSpeed, false);
		}
	}
}