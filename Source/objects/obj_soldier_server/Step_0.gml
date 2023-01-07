if(attacking != undefined)
{
	if(point_distance(x, y, attacking.x, attacking.y) <= 32)
	{
		if(attacking.owner != parent.owner && attacking > 0)
		{
			attacking.pop -= damage;
			if(parent.owner == obj_player.playerId)
				point_shake(attacking);
			instance_destroy();
		}else
		{
			attacking.pop += 1;
			instance_destroy();
		}
	}
}