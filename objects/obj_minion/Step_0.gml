/// @description Insert description here
// You can write your code in this editor

if(path != undefined && playerId != undefined)
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