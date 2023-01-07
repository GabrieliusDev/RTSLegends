function point_create_event(point = argument0){	
	owner = ownership.Neutral;
	p_type = types.outpost;
	pointId = 0;
	pop = 1;
	color = c_gray;

	attacking = undefined;
	attacker = undefined;
	shake_x = 0;
	shake_y = 0;
	
	radius_of_blocked_construction = 1200;

	sprite_size = 64;
	amount_of_sodliers_per_second = 10;

	alarm[0] = room_speed;
	alarm[1] = room_speed;
}