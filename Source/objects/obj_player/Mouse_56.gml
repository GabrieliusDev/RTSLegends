show_range_zone = false;

if(p_parent != undefined)
{
	if(isHost == true)
	{
		with(obj_point_server)
		{
			if(point_distance(mouse_x, mouse_y, x, y) <= sprite_size/2 &&
			   point_distance(other.p_parent.x, other.p_parent.y, x, y) <= global.movement_range+10)
			{
				other.p_attacking = self;		
			}
		}
	}else
	{
		with(obj_point)
		{
			if(point_distance(mouse_x, mouse_y, x, y) <= sprite_size/2 &&
			   point_distance(other.p_parent.x, other.p_parent.y, x, y) <= global.movement_range+10)
			{
				other.p_attacking = self;		
			}
		}
	}
}

if(p_parent != undefined && p_attacking != undefined && p_parent.owner == playerId)
{
	create_attack_command(self);
	p_parent = undefined;
	p_attacking = undefined;
}
p_parent = undefined;