mouse_over = gui_button_types.nothing;
for(var i = 0; i < buttons_count; i++)
{	
	if(point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), posx + spacing*i, posy, posx + spacing * i + button_size, posy + button_size))
	{
		mouse_over = i;
	}
}

if (mouse_over == gui_button_types.nothing)
{
    button_pressed = false;
	if mouse_check_button_pressed(mb_left) && can_build
    {
		if(global.energy >= ds_map_find_value(global.prices, building))
		{
			build(self, building);	
		}
		building_mode=false;
		can_build = false;
    }	
}
else
{
    if mouse_check_button_pressed(mb_left)
    {
        button_pressed = true;
    }
    else if mouse_check_button_released(mb_left)
    {
		building_mode = true;
		building = mouse_over;			
    }
}