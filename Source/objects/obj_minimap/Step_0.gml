mouse_pos_x = mouse_x - camera_get_view_x(view_camera[0]);
mouse_pos_y = mouse_y - camera_get_view_y(view_camera[0]);
if(mouse_check_button(mb_left))
{
	if(point_in_rectangle(mouse_pos_x, mouse_pos_y, x, y, x+w, y+h))
	{
		with(obj_player)
		{
			x = (other.mouse_pos_x - other.x) * other.scale;
			y = (other.mouse_pos_y - other.y) * other.scale;
		}
	}
}