if(attacking != undefined)
{
	if(point_distance(x, y, attacking.x, attacking.y) <= 32)
	{
		if(attacking.owner != obj_player.playerId && parent.owner == obj_player.playerId)
			point_shake(attacking);
		instance_destroy();
	}
}