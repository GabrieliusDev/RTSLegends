if(!surface_exists(surfMinimapBg)) 
	RefreshMapBG();

if(!surface_exists(surfMinimapEntities))
	surfMinimapEntities = surface_create(w, h);

draw_rectangle_color(x, y, x + w, y + h, c_black, c_black, c_black, c_black, false);

surface_set_target(surfMinimapEntities);
draw_clear_alpha(c_black, 0.0);
with(all)
{
	if(variable_instance_exists(self, "displayOnMap"))
	if(displayOnMap)
	{
		if(variable_instance_exists(self, "eType"))
		{
			if(variable_instance_exists(self, "playerId"))	
			{
				if(eType < entityType.hero_last_index)
				{
					var size = 2;
						if(playerId == obj_player.playerId)
							draw_rectangle_color(x/other.scale-size, y/other.scale-size, x/other.scale+size, y/other.scale+size, c_green, c_green, c_green, c_green, false);
						else
							draw_rectangle_color(x/other.scale-size, y/other.scale-size, x/other.scale+size, y/other.scale+size, c_red, c_red, c_red, c_red, false);
				}
				switch(eType)
				{
					case entityType.minion:
						var size = 1;
						if(playerId == obj_player.playerId)
							draw_rectangle_color(x/other.scale, y/other.scale, x/other.scale+size, y/other.scale+size, c_green, c_green, c_green, c_green, false);
						else
							draw_rectangle_color(x/other.scale, y/other.scale, x/other.scale+size, y/other.scale+size, c_red, c_red, c_red, c_red, false);
					break;
					case entityType.headQuarters:
						var size = 3;
						if(playerId == obj_player.playerId)
							draw_rectangle_color(x/other.scale-size, y/other.scale-size, x/other.scale+size, y/other.scale+size, c_green, c_green, c_green, c_green, false);
						else
							draw_rectangle_color(x/other.scale-size, y/other.scale-size, x/other.scale+size, y/other.scale+size, c_red, c_red, c_red, c_red, false);
					break;
				}
			}
			
			if(variable_instance_exists(self, "takingFor"))	
			switch(eType)
			{
				case entityType.point:
					var size = 3;
					if(takingFor == 0)
						draw_rectangle_color(x/other.scale-size, y/other.scale-size, x/other.scale+size, y/other.scale+size, c_gray, c_gray, c_gray, c_gray, false);
					else if(takingFor == obj_player.playerId)
						draw_rectangle_color(x/other.scale-size, y/other.scale-size, x/other.scale+size, y/other.scale+size, c_green, c_green, c_green, c_green, false);
					else
						draw_rectangle_color(x/other.scale-size, y/other.scale-size, x/other.scale+size, y/other.scale+size, c_red, c_red, c_red, c_red, false);
				break;
			}
		}
	}
}
surface_reset_target();
draw_surface(surfMinimapEntities, x, y);

//Draw position on GUI
var view_x = camera_get_view_x(view_camera[0])/scale;
var view_y = camera_get_view_y(view_camera[0])/scale;
draw_rectangle_color(x + view_x, y + view_y, x + view_x + (view_wport[0] / scale), y + view_y + (view_hport[0] / scale), c_white, c_white, c_white, c_white, true);