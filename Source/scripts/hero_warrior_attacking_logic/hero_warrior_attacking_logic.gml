// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function hero_warrior_attacking_logic(){
	if(attacking != undefined)
	{
		if(attacking.hp > damage){
			lastActionHappenedAt = current_time;
		
			if(boredom - boredomChangeOnMinionAttacks < 0)
				boredom = 0;
			else
				boredom -= boredomChangeOnMinionAttacks;
		
			if(morale + moraleChangeOnMinionAttacks > maxMorale)
				morale = maxMorale;
			else
				morale += moraleChangeOnMinionAttacks;

			attacking.hp -= damage;	
			var info_box = instance_create_depth(attacking.x, attacking.y, attacking.depth-1, obj_entity_info_box);
			info_box.info = damage;
		}
		else{	
			server_kill_entity(attacking);
		}
	}else
	{
		inCombat = false;	
	}

	if(inCombat)
	{
		alarm[2] = attacksIntervals;
	}
}