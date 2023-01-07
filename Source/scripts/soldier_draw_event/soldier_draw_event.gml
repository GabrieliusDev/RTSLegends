// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function soldier_draw_event(soldier = argument0){
	if(soldier.parent != self){
	draw_set_color(soldier.parent.color);
	draw_circle(x,y,5,false);
}
}