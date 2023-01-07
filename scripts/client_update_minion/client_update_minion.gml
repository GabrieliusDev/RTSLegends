// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function client_update_minion(xx = argument0, yy = argument1, objectId = argument2){
	var minion = ds_map_find_value(global.Minions, objectId);
	minion.x = xx;
	minion.y = yy;
}