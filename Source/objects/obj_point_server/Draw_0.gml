/// @description Insert description here
// You can write your code in this editor

draw_self();

var h_pos = poleAvailableHeight*(takenAmount/maxTakenAmount);

if(takenAmount != 0)
{
	if(takingFor == 1)
		draw_sprite(spr_point_flag_player1, 0, x, y-flagHeight-h_pos);
	if(takingFor == 2)
		draw_sprite(spr_point_flag_player2, 0, x, y-flagHeight-h_pos);
}

if(global.DebugOn)
{
	draw_set_alpha(0.2);
	draw_circle_color(x, y, captureZoneRadius, c_yellow, c_yellow, false);
	draw_set_alpha(1);

	if(capturing_playerId != undefined)
		draw_text(x-40, y+20, capturing_playerId);
	draw_text_color(x-20, y+20, player1_entity_count, c_aqua, c_aqua, c_aqua, c_aqua, 1);
	draw_text_color(x+20, y+20, player2_entity_count, c_red, c_red, c_red, c_red, 1);
}