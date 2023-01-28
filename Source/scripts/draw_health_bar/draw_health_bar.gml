// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function draw_health_bar(hp_bar_width = argument0, hp_bar_height = argument1, h_offset = argument2){	
	var hp_bar_start_pos = x-(hp_bar_width/2);
	var hp_bar_end_pos = x+(hp_bar_width/2);
	var hp_bar_top_pos = h_offset-(hp_bar_height/2);
	var hp_bar_bot_pos = h_offset+(hp_bar_height/2);

	draw_rectangle_color(hp_bar_start_pos-1, hp_bar_top_pos-1, hp_bar_end_pos+1, hp_bar_bot_pos+1, c_black, c_black, c_black, c_black, false);
	draw_rectangle_color(hp_bar_start_pos, hp_bar_top_pos, hp_bar_start_pos+hp_bar_width, hp_bar_bot_pos, c_red, c_red, c_red, c_red, false);
	draw_rectangle_color(hp_bar_start_pos, hp_bar_top_pos, hp_bar_start_pos+(hp_bar_width*(hp/maxHp)), hp_bar_bot_pos, c_green, c_green, c_green, c_green, false);
}