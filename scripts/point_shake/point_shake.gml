// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function do_point_shake(point = argument0){
	var shake_amount = 3;
	with(point)
	{
		shake_x = irandom_range(-shake_amount,shake_amount);
		shake_y = irandom_range(-shake_amount,shake_amount);
	}
}