// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function point_draw_event(point = argument0){
	switch(point.owner)
	{
		case ownership.Neutral:		
			draw_set_color(c_gray);
			break;
		case ownership.Player1:
			point.color = make_color_rgb(236,179,101);
			draw_set_color(point.color);
			break;
		case ownership.Player2:
			point.color = make_color_rgb(52,190,130);
			draw_set_color(point.color);
			break;
	}

	switch(point.p_type)
	{
		case types.outpost:
			var size = point.sprite_size/2;
			draw_set_circle_precision(64);
			draw_circle(x + shake_x, y + shake_y, size, false);
			break;
		case types.barracks:
			var size = point.sprite_size/2;
			draw_rectangle(x-size+ shake_x, y-size+ shake_y, x+size+ shake_x, y+size+ shake_y, false); 
			break;
		case types.tower:
			var size = point.sprite_size/2;
			draw_set_circle_precision(4);
			draw_circle(x+ shake_x, y, size, false); 
			draw_set_circle_precision(64);
			break;
		case types.gatherer:
			var size = point.sprite_size/2;
			draw_triangle(x-size+ shake_x, y+size+ shake_y, x+ shake_x, y-size+ shake_y, x+size+ shake_x, y+size+ shake_y, false); 
			break;
	}
	shake_x = lerp(shake_x, 0, 0.5);
	shake_y = lerp(shake_y, 0, 0.5);
	draw_set_circle_precision(64);
	draw_set_color(c_black);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text(x, y, floor(point.pop));
	draw_set_color(c_white);
	draw_text(x, y-50, string(pointId));
}