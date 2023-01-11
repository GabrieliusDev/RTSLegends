// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function minions_draw_event(){
	draw_self();
	depth = -y;
	
	if(moveX > x)
		image_xscale = -1;
	else
		image_xscale = 1;

	//HP
	var hp_bar_width = 25;
	var hp_bar_height = 2;
	var h_offset = y-20;

	var hp_bar_start_pos = x-(hp_bar_width/2);
	var hp_bar_end_pos = x+(hp_bar_width/2);
	var hp_bar_top_pos = h_offset-(hp_bar_height/2);
	var hp_bar_bot_pos = h_offset+(hp_bar_height/2);

	draw_rectangle_color(hp_bar_start_pos-1, hp_bar_top_pos-1, hp_bar_end_pos+1, hp_bar_bot_pos+1, c_black, c_black, c_black, c_black, false);
	draw_rectangle_color(hp_bar_start_pos, hp_bar_top_pos, hp_bar_start_pos+hp_bar_width, hp_bar_bot_pos, c_red, c_red, c_red, c_red, false);
	draw_rectangle_color(hp_bar_start_pos, hp_bar_top_pos, hp_bar_start_pos+(hp_bar_width*(hp/maxHp)), hp_bar_bot_pos, c_green, c_green, c_green, c_green, false);
	//draw_text(x, y-40, hp);

	//-----Debug info --------
	if(global.DebugOn)
	{
		draw_set_alpha(0.2);
		draw_circle_color(x, y, focusRadius, c_white, c_white, false);
		draw_circle_color(x, y, combatRadius, c_red, c_red, false);
		draw_set_alpha(1);
		if(attacking != undefined)
		{
			if(playerId == 1)
				draw_line_color(x, y, attacking.x, attacking.y, c_red, c_red);
			if(playerId == 0)
				draw_line_color(x, y, attacking.x, attacking.y, c_aqua, c_aqua);
		}

		if(obj_player.isHost)
		{
			draw_text(x, y-80, "c_x: " + string(x) + "; c_y: " +string(y));
			draw_text(x, y-60, "c_x: " + string(last_pos_x) + "; c_y: " + string(last_pos_y));
		}
	}
}