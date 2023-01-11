// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function InterpolatePosition(entity = argument0, fromx = argument1, fromy = argument2, tox = argument3, toy = argument4, lerpAmount = argument5){
	entity.x = lerp(fromx, tox, lerpAmount);
	entity.y = lerp(fromy, toy, lerpAmount);
}