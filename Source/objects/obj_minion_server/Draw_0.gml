/// @description Insert description here
// You can write your code in this editor
draw_self();
depth = -y;
//draw_text(x, y-40, string(currentIndex) + " " + string(playerId));

//HP
var hp_bar_width = 50;
var hp_bar_height = 5;
var h_offset = y-30;

var hp_bar_start_pos = x-(hp_bar_width/2);
var hp_bar_end_pos = x+(hp_bar_width/2);
var hp_bar_top_pos = h_offset-(hp_bar_height/2);
var hp_bar_bot_pos = h_offset+(hp_bar_height/2);

draw_rectangle_color(hp_bar_start_pos-1, hp_bar_top_pos-1, hp_bar_end_pos+1, hp_bar_bot_pos+1, c_black, c_black, c_black, c_black, false);
draw_rectangle_color(hp_bar_start_pos, hp_bar_top_pos, hp_bar_start_pos+hp_bar_width, hp_bar_bot_pos, c_red, c_red, c_red, c_red, false);
draw_rectangle_color(hp_bar_start_pos, hp_bar_top_pos, hp_bar_start_pos+(hp_bar_width*(hp/maxHp)), hp_bar_bot_pos, c_green, c_green, c_green, c_green, false);
//draw_text(x, y-40, hp);

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
