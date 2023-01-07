if(global.game_started)
{
	if(show_range_zone == true)
	{	
		if(point_distance(p_parent.x, p_parent.y, mouse_x, mouse_y) <= global.movement_range)
		{
			draw_gray_range_zone(p_parent.x, p_parent.y);
		}else
		{
			draw_red_range_zone(p_parent.x, p_parent.y);
		}
	}

	if(building_mode)
	{
		var size = button_size/2;
		if(can_build)
		{
			color = c_white;	
		}else
		{
			color = c_red;
		}
		switch(building)
		{
			case gui_button_types.outpost:		
				draw_sprite_ext(spr_btn_point_outpost_temp, 0, mouse_x - size, mouse_y - size, 1, 1, 0, color, 0.8);
				break;
			case gui_button_types.barracks:
				draw_sprite_ext(spr_btn_point_barracks_temp, 0, mouse_x - size, mouse_y - size, 1, 1, 0, color, 0.8);	
				break;
			case gui_button_types.tower:
				draw_sprite_ext(spr_btn_point_tower_temp, 0, mouse_x - size, mouse_y - size, 1, 1, 0, color, 0.8);
				break;
			case gui_button_types.gatherer:
				draw_sprite_ext(spr_btn_point_gatherer_temp, 0, mouse_x - size, mouse_y - size, 1, 1, 0, color, 0.8);
				break;
		}	
		if(closest_point != noone)
		{
			var minerals_on_point = point_find_mineral_in_range();			
			
			if((distance < global.movement_range && distance > button_size && tower_in_range == noone && distance_to_enemy > button_size && building != gui_button_types.gatherer)
				|| (minerals_on_point == true && building == gui_button_types.gatherer))
			{
				can_build = true;
				draw_set_color(c_white);
				draw_gray_range_zone(mouse_x, mouse_y);	
				if(isHost)
				{
					with(obj_point_server)
					{
						if(point_distance(x, y, mouse_x, mouse_y) < global.movement_range)
						{
							draw_set_color(c_teal);
							draw_line(x, y, mouse_x, mouse_y);
							draw_set_color(c_teal);
						}
					}
				}else
				{
					with(obj_point)
					{
						if(point_distance(x, y, mouse_x, mouse_y) < global.movement_range)
						{
							draw_set_color(c_teal);
							draw_line(x, y, mouse_x, mouse_y);
							draw_set_color(c_teal);
						}
					}
				}
			}else
			{
				can_build = false;	
				draw_set_color(c_white);
				if(building == gui_button_types.gatherer)
					draw_text(mouse_x, mouse_y - 30, "Gatherer must be built on minerals");
				else if(tower_in_range != noone)
					draw_text(mouse_x, mouse_y - 30, "Enemy tower in range");
				else if(distance > global.movement_range)
					draw_text(mouse_x, mouse_y - 30, "Too far from own points");
				else if(distance <= button_size || distance_to_enemy <= button_size)
					draw_text(mouse_x, mouse_y - 30, "Too close to other point");
				draw_red_range_zone(mouse_x, mouse_y);
			}	
		}
	}
}