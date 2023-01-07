if(isHost == true)
{
	with(obj_point_server)
	{
		if(point_distance(mouse_x, mouse_y, x, y) <= sprite_size/2)
		{
			other.p_parent = self;
			other.show_range_zone = true;
			other.building_mode = false;
		}
	}
}else
{
	with(obj_point)
	{
		if(point_distance(mouse_x, mouse_y, x, y) <= sprite_size/2)
		{
			other.p_parent = self;
			other.show_range_zone = true;
			other.building_mode = false;
		}
	}
}