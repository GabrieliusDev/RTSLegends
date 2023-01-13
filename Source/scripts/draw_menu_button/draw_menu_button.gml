// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function draw_menu_button(xx = argument0, yy = argument1, text = argument2){
	draw_self();
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_set_font(fnt_menu);
	draw_set_color(make_color_rgb(223, 169, 189));
	draw_text(xx, yy, text);
	draw_set_color(c_white)
	draw_set_font(fnt_main);
}