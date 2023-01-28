// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function minions_draw_event(){
	draw_self();
	depth = -y;
	
	flip_horizontaly_by_direction_pointing(moveX);

	//HP
	var hp_bar_width = 25;
	var hp_bar_height = 2;
	var h_offset = y-20;
	
	if(hp != maxHp)
	draw_health_bar(hp_bar_width, hp_bar_height, h_offset);

	//-----Debug info --------
	if(global.DebugOn)
	{
		draw_set_alpha(0.2);
		//draw_circle_color(x, y, focusRadius, c_white, c_white, false);
		//draw_circle_color(x, y, combatRadius, c_red, c_red, false);
		draw_set_alpha(1);
		
		var moving = false;
		if(last_pos_x != x || last_pos_y != y)
			moving = true;
			
		var coliding = false;
		if(position_meeting(x, y, all))
			coliding = true;
		
		draw_text(x, y-40, playerId);
		
		if(show_debug)
		{
			draw_text(x, y-60, "inC:" + string(inCombat) + " isM:" + string(moving) + " isCol:" + string(coliding));
			draw_text(x, y-40, "x: " +  string(x) + " " + string(moveX)  + " y:" + string(y) + " " + string(moveY));
		}
		
		last_pos_x = x;
		last_pos_y = y;
		
		if(attacking != undefined)
		{
			if(playerId == 1)
				draw_line_color(x, y, attacking.x, attacking.y, c_red, c_red);
			if(playerId == 0)
				draw_line_color(x, y, attacking.x, attacking.y, c_aqua, c_aqua);
		}

		if(!obj_player.isHost)
		{
			draw_text(x, y-80, "c_x: " + string(x) + "; c_y: " +string(y));
			draw_text(x, y-60, "c_x: " + string(last_pos_x) + "; c_y: " + string(last_pos_y));
		}
	}
}