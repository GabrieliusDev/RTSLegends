/// @description Insert description here
// You can write your code in this editor

if(path != undefined && playerId != undefined && attacking == undefined)
{
	if(distance_to_point(moveX, moveY) < moveCompleteDistance)
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

	mp_potential_step(moveX, moveY, 2, false);
}

if(attacking == undefined)
{
	find_nearest_enemy();
}else{
	var dist = distance_to_point(attacking.x, attacking.y);
	if(dist > focusRadius)
	{
		attacking = undefined;		
	}else
	{
		if(dist > combatRadius)
		{
			mp_potential_step(attacking.x, attacking.y, 2, false);
			inCombat = false;
		}else
		{
			if(!inCombat)
			{
				inCombat = true;
			}
		}
	}
}