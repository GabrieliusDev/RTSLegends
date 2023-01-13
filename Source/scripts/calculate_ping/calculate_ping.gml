// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function calculate_ping(time = argument0){
	global.Ping = (time - (current_time - global.TimeOnStart)) * sign(time - (current_time - global.TimeOnStart));
}