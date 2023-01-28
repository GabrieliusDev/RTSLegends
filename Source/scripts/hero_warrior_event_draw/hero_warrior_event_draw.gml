// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function hero_warrior_event_draw(){
	draw_self();
	
	flip_horizontaly_by_direction_pointing(moveX);
	
	//HP
	var hp_bar_width = 25;
	var hp_bar_height = 2;
	var h_offset = y-30;
	draw_health_bar(hp_bar_width, hp_bar_height, h_offset);
	
	if(global.DebugOn)
	{
		draw_text(x, y - 40, "Boredom: " + string(boredom));
		draw_text(x, y - 60, "Morale: " + string(morale));
		if(guarding != undefined)
		draw_text(x, y - 80, "Guarding: " + string(guarding.objectId));
		
		draw_set_alpha(0.2);
		draw_circle_color(x, y, visionRadius, c_white, c_white, false);
		draw_circle_color(x, y, combatRadius, c_red, c_red, false);
		draw_set_alpha(1);
		
		if(attacking != undefined)
			draw_line_color(x, y, attacking.x, attacking.y, c_red, c_red);
	}
}