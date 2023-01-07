// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function set_camera_pos_to_start(xx = argument0, yy = argument1){
	x_offset = camera_get_view_border_x(view_camera[0]);
	y_offset = camera_get_view_border_y(view_camera[0]);
	if(xx < x_offset)
	{
		xx = x_offset;
	}
	if(xx > room_width - x_offset)
	{
		xx = room_width - x_offset;
	}
	if(yy < y_offset)
	{
		yy = y_offset;
	}
	if(yy > room_height - y_offset)
	{
		yy = room_height - y_offset;
	}
	
	with(obj_player)
	{	
		x = xx;
		y = yy;
	}
	
	camera_set_view_pos(view_camera[0], room_width/2- x_offset, room_height/2 - y_offset);
}