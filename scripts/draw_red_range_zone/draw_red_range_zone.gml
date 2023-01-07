// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function draw_red_range_zone(xx = argument0, yy = argument1){
	draw_set_color(c_red);
	draw_set_alpha(0.3);
	draw_circle(xx, yy, global.movement_range, false);
	draw_set_color(c_black);
	draw_set_alpha(1);
	draw_circle(xx, yy, global.movement_range, true);	
}