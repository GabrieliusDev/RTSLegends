/// @description Spawning soldiers
//attacking other points
if(attacking != undefined && pop > 1)
{
	var soldier = instance_create_depth(x, y, depth, obj_soldier_server);
	spawn_soldier(x, y, self.pointId, attacking.pointId);
	pop--;
	with(soldier)
	{
		parent = other;
		attacking = other.attacking;
		move_towards_point(other.attacking.x, other.attacking.y, 5);
	}
}else if(pop <= 1)
{
	attacking = undefined;
}
alarm[1] = room_speed / amount_of_sodliers_per_second;