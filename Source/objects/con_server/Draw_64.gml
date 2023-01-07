if(!global.game_started)
{
	draw_set_font(fnt_menu);
	draw_set_valign(fa_center);
	draw_set_halign(fa_center);
	draw_set_color(c_white);
	draw_text(view_wport[0]/2, view_hport[0]/2, "Waiting for other players to join");
	draw_set_font(fnt_main);
}