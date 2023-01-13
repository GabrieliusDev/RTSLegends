// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function hero_warrior_event_draw(){
	draw_self();
	
	flip_horizontaly_by_direction_pointing(moveX);
	
	if(global.DebugOn)
	{
		draw_text(x, y - 40, "Boredom: " + string(boredom));
		draw_text(x, y - 60, "Morale: " + string(morale));
		
		draw_set_alpha(0.2);
		draw_circle_color(x, y, visionRadius, c_white, c_white, false);
		draw_circle_color(x, y, combatRadius, c_red, c_red, false);
		draw_set_alpha(1);
	}
}